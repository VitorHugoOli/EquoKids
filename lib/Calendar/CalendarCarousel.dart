import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayBuilder, WeekdayFormat;

class CalendarCarouselOwn extends StatefulWidget {
  PageController controllerCalendar;
  Function(DateTime) calendarChange;
  DateTime targetDateTime;

  CalendarCarouselOwn(
      {this.controllerCalendar, this.targetDateTime, this.calendarChange});

  @override
  _CalendarCarouselOwnState createState() => _CalendarCarouselOwnState();
}

class _CalendarCarouselOwnState extends State<CalendarCarouselOwn> {
  DateTime _currentDate = DateTime.now();

//  Map<DateTime,Event> events = {
//    DateTime(2020,4,12):
//  }

  dayPressed(DateTime date, List<Event> events) {
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

  dayBuilder() {
    return (isSelectable, index, isSelectedDay, isToday, isPrevMonthDay,
        textStyle, isNextMonthDay, isThisMonthDay, day) {
      TextStyle sty;
      if (isNextMonthDay || isPrevMonthDay) {
        sty = TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.bold,
          color: Color(0xff63C3CA),
        );
      } else if (isSelectedDay) {
        return Container(
          decoration: new BoxDecoration(
            color: Color(0xffF3DCCC),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(11.0)),
          ),
//          margin: const EdgeInsets.all(1.0),
          width: 50,
          height: 100,
          child: Center(
            child: Text(
              '${day.day}',
              style: TextStyle(
                fontSize: 21.0,
                color: Color(0xff1CA1AD),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        );
      } else if (isToday) {
        return Container(
          decoration: new BoxDecoration(
            color: Color(0xFF1CA1AD),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          margin: const EdgeInsets.all(4.0),
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              '${day.day}',
              style: TextStyle(
                fontSize: 21.0,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        );
      } else {
        sty = TextStyle(
          fontSize: 21.0,
          color: Color(0xff1CA1AD),
          fontWeight: FontWeight.bold,
        );
      }
      return Container(
        margin: const EdgeInsets.all(4.0),
        width: 50,
        height: 50,
        child: Center(
          child: Text('${day.day}', style: sty),
        ),
      );
    };
  }

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      locale: 'pt_BR',
      selectedDayButtonColor: Colors.transparent,
      selectedDayBorderColor: Colors.transparent,
      todayBorderColor: Colors.transparent,
      todayButtonColor: Colors.transparent,
      weekDayFormat: WeekdayFormat.standaloneShort,
      firstDayOfWeek: 0,
      showHeader: false,
      height: 225.0,
      childAspectRatio: 1.6,
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
