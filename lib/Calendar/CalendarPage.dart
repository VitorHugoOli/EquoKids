import 'package:EquoKids/Calendar/Avaliar.dart';
import 'package:EquoKids/Calendar/Event.dart';
import 'package:EquoKids/Calendar/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'CalendarCarousel.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

Map<DateTime, Event> mockUpEvents() {
  Map<DateTime, Event> events = {
    DateTime(2020, 4, 29): Event(
        dateTime: DateTime(2020, 4, 29),
        motorDevelopment: 0,
        socialDevelopment: 0,
        selfCare: 0,
        status: Status.scheduled),
    DateTime(2020, 4, 8): Event(
        dateTime: DateTime(2020, 4, 8),
        motorDevelopment: 0,
        socialDevelopment: 0,
        selfCare: 0,
        status: Status.InEvaluation),
    DateTime(2020, 4, 1): Event(
        dateTime: DateTime(2020, 4, 1),
        motorDevelopment: 3,
        socialDevelopment: 2,
        selfCare: 4,
        status: Status.rated)
  };

  events.forEach((e, a) {
    a.startTime = DateTime.parse("2012-02-27T${(e.day+13)%23}Z");
    a.endTime = DateTime.parse("2012-02-27T${(e.day+14)%23}Z");
  });

  return events;
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, Event> events = Map<DateTime, Event>();

  Event actualEvent = Event(
      dateTime: DateTime.now(),
      motorDevelopment: 0,
      socialDevelopment: 0,
      selfCare: 0,
      status: Status.none);

  String _currentMonth = DateFormat.MMMM("pt_BR").format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  int oldCurrentPageCalendar = DateTime.now().month - 2;
  int oldCurrentPage = DateTime.now().month - 1;

  static PageController _controller = PageController(
    initialPage: DateTime.now().month - 1,
    viewportFraction: 0.8,
  );

  static PageController _controllerCalendar = PageController(
    initialPage: 12,
    keepPage: true,
    viewportFraction: 1.0,
  );

  static Map<Status, dynamic> _bottomPageController(
      size, actualEvent, events, setState) {
    Schedule schedule = Schedule(
        size: size, event: actualEvent, events: events, setter: setState);
    Avaliar avaliar = Avaliar(size: size, event: actualEvent);
    return {
      Status.none: schedule,
      Status.scheduled: schedule,
      Status.InEvaluation: avaliar,
      Status.rated: avaliar,
    };
  }

  @override
  void initState() {
    super.initState();
    events = mockUpEvents();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    /*
      Não se faz necessario uma vez que este não é uma pagina é só é inicializado uma unica vez.
    */
//    _controller.dispose();
//    super.dispose();
  }

  ///Scroll Control
  _scrollListener() async {
    double current = _controller.page;
    if ((current - current.toInt()) == 0) {
      if (oldCurrentPageCalendar != _controller.page) {
        print(_controller.page + 9);
        _controllerCalendar.animateToPage((_controller.page + 9).toInt(),
            duration: Duration(milliseconds: 100), curve: Curves.linear);
        setState(() {});
      }
    }
  }

  calendarChange(DateTime date) {
    this.setState(() {
      _targetDateTime = date;
      _currentMonth = DateFormat.MMMM("pt_BR").format(_targetDateTime);
      oldCurrentPageCalendar = _targetDateTime.month - 1;
      _controller.animateToPage(_targetDateTime.month - 1,
          duration: Duration(milliseconds: 225), curve: Curves.easeInToLinear);
    });
  }

  dayPressed(DateTime date) {
    if (events.containsKey(date)) {
      actualEvent = events[date];
    } else {
      actualEvent = Event(
          dateTime: date,
          motorDevelopment: 0,
          socialDevelopment: 0,
          selfCare: 0,
          status: Status.none);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget monthListStyle(Size size, String month) {
      TextStyle sty;
      _currentMonth.toLowerCase() == month.toLowerCase()
          ? sty = TextStyle(
              fontSize: 48.0,
              fontFamily: "Raleway",
              color: Color(0xff1CA1AD),
              fontWeight: FontWeight.w700,
            )
          : sty = TextStyle(
              fontSize: 48.0,
              fontFamily: "Raleway",
              color: Color.fromRGBO(28, 161, 173, 0.45),
              fontWeight: FontWeight.w700,
            );

      return Container(
        child: Text(month, style: sty),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.08,
                  child: PageView(
                    controller: _controller,
                    children: <Widget>[
                      monthListStyle(size, "Janeiro"),
                      monthListStyle(size, "Fevereiro"),
                      monthListStyle(size, "Março"),
                      monthListStyle(size, "Abril"),
                      monthListStyle(size, "Maio"),
                      monthListStyle(size, "Junho"),
                      monthListStyle(size, "Julho"),
                      monthListStyle(size, "Agosto"),
                      monthListStyle(size, "Setembro"),
                      monthListStyle(size, "Outubro"),
                      monthListStyle(size, "Novembro"),
                      monthListStyle(size, "Dezembro"),
                    ],
                  ),
                ),
                CalendarCarouselOwn(
                  controllerCalendar: _controllerCalendar,
                  calendarChange: calendarChange,
                  targetDateTime: _targetDateTime,
                  dayPressed: dayPressed,
                  events: events,
                ),
              ],
            ),
          ),
          _bottomPageController(
              size, actualEvent, events, setState)[actualEvent.status],
        ],
      ),
    );
  }
}
