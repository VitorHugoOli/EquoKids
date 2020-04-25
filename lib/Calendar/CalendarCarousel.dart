import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

class CalendarCarouselOwn extends StatefulWidget {
  final PageController controllerCalendar;
  final Function(DateTime) calendarChange;
  final DateTime targetDateTime;
  final Map<DateTime,Event> events;
  final Function(DateTime) dayPressed;

  CalendarCarouselOwn(
      {this.controllerCalendar,
      this.targetDateTime,
      this.calendarChange,
      this.dayPressed,
      this.events});

  @override
  _CalendarCarouselOwnState createState() => _CalendarCarouselOwnState();
}

class _CalendarCarouselOwnState extends State<CalendarCarouselOwn> {
  DateTime _currentDate = DateTime.now();


  dayPressed(DateTime date, _) {
    widget.dayPressed(date);
    setState(() {
      _currentDate = date;
    });
  }

  weekBuilder() {
    return (weekday, weekdayName) {
      return Text(
          weekdayName.substring(0, 1).toUpperCase() + weekdayName.substring(1),
          style: TextStyle(
            color: Color(0xff1CA1AD),
            fontFamily: "Comfortaa",
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ));
    };
  }

  Widget customEventsDay(Status status, DateTime day) {
    Color colorRadius = Color(0xff1CA1AD);
    Color colorText = Colors.white;

    if (status == Status.none) {
      colorRadius = Colors.transparent;
      colorText = Color(0xff1CA1AD);
    } else if (status == Status.scheduled) {
      colorRadius = Colors.red;
    } else if (status == Status.InEvaluation) {
      colorRadius = Color(0xffD68954);
    } else {}
    return Container(
      decoration: new BoxDecoration(
        color: colorRadius,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      margin: const EdgeInsets.only(left: 2, right: 2),
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          '${day.day}',
          style: TextStyle(
            fontSize: 20.0,
            color: colorText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget widgetDay(
      {@required Color colorRadius,
      @required Color colorText,
      @required DateTime day}) {
    return Container(
      decoration: new BoxDecoration(
        color: colorRadius,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),
      margin: const EdgeInsets.all(1),
      width: 50,
      height: 50,
      child: Center(
        child: Text(
          '${day.day}',
          style: TextStyle(
            fontSize: 20.0,
            color: colorText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  dayBuilder() {
    return (bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day) {

      if (widget.events.containsKey(day)) {
        return customEventsDay(widget.events[day].status, day);
      } else if (isNextMonthDay || isPrevMonthDay) {
        return widgetDay(
            colorRadius: Colors.transparent,
            colorText: Color(0xff63C3CA),
            day: day);
      } else if (isSelectedDay) {
        return widgetDay(
            colorRadius: Color(0xffF3DCCC),
            colorText: Color(0xff1CA1AD),
            day: day);
      } else if (isToday) {
        return widgetDay(
            colorRadius: Colors.white, colorText: Color(0xff1CA1AD), day: day);
      } else {
        return widgetDay(
            colorRadius: Colors.transparent,
            colorText: Color(0xff1CA1AD),
            day: day);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    print(widget.targetDateTime);
    print(_currentDate);


    return CalendarCarousel(
      locale: 'pt_BR',
      selectedDayButtonColor: Colors.transparent,
      selectedDayBorderColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      weekDayFormat: WeekdayFormat.standaloneShort,
      firstDayOfWeek: 0,
      showHeader: false,
      height: 225.0,
      childAspectRatio: 1.35,
      selectedDateTime: _currentDate,
      markedDateMoreShowTotal: true,
      targetDateTime: widget.targetDateTime,
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      onCalendarChanged: widget.calendarChange,
      onDayPressed: dayPressed,
      customWeekDayBuilder: weekBuilder(),
      customDayBuilder: dayBuilder(),
      markedDateCustomShapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.0))),
      controller: widget.controllerCalendar,
    );
  }
}
