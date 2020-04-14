import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;

class CalendarCarouselOwn extends StatefulWidget {
  PageController controllerCalendar;
  Function(DateTime) calendarChange;
  DateTime targetDateTime;
  List<Event> events;
  Function(DateTime) dayPressed;

  CalendarCarouselOwn({this.controllerCalendar,
    this.targetDateTime,
    this.calendarChange,
    this.dayPressed,
    this.events});

  @override
  _CalendarCarouselOwnState createState() => _CalendarCarouselOwnState();
}

class _CalendarCarouselOwnState extends State<CalendarCarouselOwn> {
  DateTime _currentDate = DateTime.now();

  dayPressed(DateTime date,_) {
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
            color: colorText,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }


  dayBuilder() {
    return (isSelectable, index, isSelectedDay, isToday, isPrevMonthDay,
        textStyle, isNextMonthDay, isThisMonthDay, day) {
      TextStyle sty;
      bool haveDay = false;
      Event event;
      widget.events.forEach((e) {
        if (e.dateTime.compareTo(day) == 0) {
          haveDay = true;
          event = e;
        }
      });

      if (haveDay) {
        return customEventsDay(event.status,day);
      } else if (isNextMonthDay || isPrevMonthDay) {
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
            color: Color(0xFF323232),
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


  @override
  Widget build(BuildContext context) {
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
