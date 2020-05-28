import 'dart:async';
import 'dart:math';
import 'dart:ui';

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
final random = new Random();

Map<DateTime, Event> events = {
  DateTime(2020, 2, 5): Event(
      dateTime: DateTime(2020, 2, 5),
      startTime: DateTime.parse("2012-02-27T${(1 + 11) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(1 + 12) % 23}Z"),
      motorDevelopment: random.nextInt(4)+1,
      socialDevelopment: random.nextInt(4)+1,
      selfCare: random.nextInt(4)+1,
      status: Status.rated),
  DateTime(2020, 2, 15): Event(
      dateTime: DateTime(2020, 2, 15),
      startTime: DateTime.parse("2012-02-27T${(1 + 11) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(1 + 12) % 23}Z"),
      motorDevelopment: random.nextInt(4)+1,
      socialDevelopment: random.nextInt(4)+1,
      selfCare: random.nextInt(4)+1,
      status: Status.rated),
  DateTime(2020, 3, 5): Event(
      dateTime: DateTime(2020, 3, 5),
      startTime: DateTime.parse("2012-02-27T${(1 + 11) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(1 + 12) % 23}Z"),
      motorDevelopment: random.nextInt(4)+1,
      socialDevelopment: random.nextInt(4)+1,
      selfCare: random.nextInt(4)+1,
      status: Status.rated),
  DateTime(2020, 3, 15): Event(
      dateTime: DateTime(2020, 3, 15),
      startTime: DateTime.parse("2012-02-27T${(1 + 11) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(1 + 12) % 23}Z"),
      motorDevelopment: random.nextInt(4)+1,
      socialDevelopment: random.nextInt(4)+1,
      selfCare: random.nextInt(4)+1,
      status: Status.rated),
  DateTime(2020, 4, 29): Event(
      dateTime: DateTime(2020, 4, 29),
      startTime: DateTime.parse("2012-02-27T${(29 + 13) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(29 + 14) % 23}Z"),
      motorDevelopment: 0,
      socialDevelopment: 0,
      selfCare: 0,
      status: Status.scheduled),
  DateTime(2020, 4, 8): Event(
      dateTime: DateTime(2020, 4, 8),
      startTime: DateTime.parse("2012-02-27T${(8 + 13) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(8 + 14) % 23}Z"),
      motorDevelopment: 0,
      socialDevelopment: 0,
      selfCare: 0,
      status: Status.InEvaluation),
  DateTime(2020, 4, 1): Event(
      dateTime: DateTime(2020, 4, 1),
      startTime: DateTime.parse("2012-02-27T${(1 + 13) % 23}Z"),
      endTime: DateTime.parse("2012-02-27T${(1 + 14) % 23}Z"),
      motorDevelopment: 3,
      socialDevelopment: 2,
      selfCare: 4,
      status: Status.rated),

};

Map<DateTime, Event> mockUpEvents() {
  events.forEach((date, value) {

    if ((value.endTime.compareTo(DateTime.now()) < 0) &&
        (value.status == Status.scheduled)) {
      value.status = Status.InEvaluation;
    }
  });

  return events;
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, Event> events = Map<DateTime, Event>();
  static final actualDay = DateTime.now();

  Event actualEvent = Event(
      dateTime: DateTime.now(),
      startTime: null,
      endTime: null,
      motorDevelopment: 0,
      socialDevelopment: 0,
      selfCare: 0,
      status: Status.none);

  String _currentMonth = DateFormat.MMMM("pt_BR").format(actualDay);
  DateTime _targetDateTime = actualDay;
  int oldCurrentPage =
      12 + (actualDay.month - actualDay.subtract(Duration(days: 360)).month);

  static PageController _controller = PageController(
    initialPage:
        12 + (actualDay.month - actualDay.subtract(Duration(days: 360)).month),
    viewportFraction: 0.8,
  );

  static PageController _controllerCalendar = PageController(
    initialPage:
        12 + (actualDay.month - actualDay.subtract(Duration(days: 360)).month),
    keepPage: true,
    viewportFraction: 1.0,
  );

  static Map<Status, dynamic> _bottomPageController(
      size, actualEvent, events, setState) {
    Schedule schedule = Schedule(
        size: size, event: actualEvent, events: events, setter: setState);
    Avaliar avaliar = Avaliar(
      size: size,
      event: actualEvent,
      setter: setState,
    );
    return {
      Status.none: schedule,
      Status.scheduled: schedule,
      Status.InEvaluation: avaliar,
      Status.rated: avaliar,
    };
  }

  static Map<int, String> months = {
    1: "Janeiro",
    2: "Fevereiro",
    3: "Março",
    4: "Abril",
    5: "Maio",
    6: "Junho",
    7: "Julho",
    8: "Agosto",
    9: "Setembro",
    10: "Outubro",
    11: "Novembro",
    12: "Dezembro",
  };

  monthList(size) {
    List<Widget> monthListPast = List<Widget>();
    List<Widget> monthListFuture = List<Widget>();
    int firstMonth = actualDay.subtract(Duration(days: 360)).month;
    int lastMonth = actualDay.add(Duration(days: 360)).month;
    for (int i = firstMonth; i <= 12; i++) {
      monthListPast.add(monthListStyle(size, months[i]));
    }
    for (int i = 1; i <= lastMonth; i++) {
      monthListFuture.add(monthListStyle(size, months[i]));
    }

    return {
      "past": monthListPast,
      "future": monthListFuture,
    };
  }

  @override
  void initState() {
    super.initState();
    events = mockUpEvents();
    _controller.addListener(_scrollListener);

    Timer.periodic(Duration(minutes: 1), (timer) {
      events.forEach((date, value) {
        if ((value.endTime.compareTo(actualDay) < 0) &&
            (value.status == Status.scheduled)) {
          value.status = Status.InEvaluation;
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    /*
      Não se faz necessario uma vez que este não é uma pagina é só é inicializado uma unica vez.
    */
//    _controller.dispose();
    super.dispose();
  }

  ///Scroll Control
  _scrollListener() async {
    double current = _controller.page;
    if ((current - current.toInt()) == 0) {
      oldCurrentPage = _targetDateTime.month;
      _controllerCalendar.animateToPage((_controller.page).toInt(),
          duration: Duration(milliseconds: 100), curve: Curves.linear);
      setState(() {});
    }
  }

  calendarChange(DateTime date) {
    this.setState(() {
      _targetDateTime = date;
      _currentMonth = DateFormat.MMMM("pt_BR").format(_targetDateTime);
      _controller.animateToPage(_controllerCalendar.page.round(),
          duration: Duration(milliseconds: 225), curve: Curves.easeInToLinear);
    });
  }

  dayPressed(DateTime date) {
    if (events.containsKey(date)) {
      actualEvent = events[date];
    } else {
      actualEvent = Event(
          dateTime: date,
          startTime: null,
          endTime: null,
          motorDevelopment: 0,
          socialDevelopment: 0,
          selfCare: 0,
          status: Status.none);
    }

    setState(() {});
  }

  monthListStyle(Size size, String month) {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      ...monthList(size)["past"],
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
                      ...monthList(size)["future"],
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
