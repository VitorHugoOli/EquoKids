import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime.now();

  TextStyle styleDay = TextStyle(
    color: Color(0xff1CA1AD),
    fontFamily: "Comfortaa",
    fontWeight: FontWeight.w900,
    fontSize: 18,
  );

  TextStyle styleWeek = TextStyle(
    color: Color(0xff1CA1AD),
    fontFamily: "Comfortaa",
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 4, 9): [
        new Event(
          date: new DateTime(2020, 4, 12),
          title: 'Event 1',
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 4, 11),
          title: 'Event 2',
        ),
        new Event(
          date: new DateTime(2020, 4, 10),
          title: 'Event 3',
        ),
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    _markedDateMap.add(
        new DateTime(2020, 4, 25),
        new Event(
          date: new DateTime(2019, 2, 25),
          title: 'Event 5',
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      //Caledar
      child: CalendarCarousel<Event>(
        locale: 'pt_BR',
        onDayPressed: (DateTime date, List<Event> events) {
          print(date);
          setState(() {
            _currentDate = date;
          });
        },
        thisMonthDayBorderColor: Colors.blue,
        selectedDayButtonColor: Colors.transparent,
        selectedDayBorderColor: Colors.transparent,
        todayBorderColor: Colors.transparent,
        todayButtonColor: Colors.transparent,
        daysTextStyle: styleDay,
        inactiveDaysTextStyle: styleDay,
        nextDaysTextStyle: styleDay,
        prevDaysTextStyle: styleDay,
        weekdayTextStyle: styleDay,
        markedDatesMap: _markedDateMap,
        weekDayFormat: WeekdayFormat.standaloneShort,
        customWeekDayBuilder: (weekday, weekdayName) {
          print(weekdayName);
          return Text(
              weekdayName.substring(0, 1).toUpperCase() +
                  weekdayName.substring(1),
              style: styleDay);
        },
        firstDayOfWeek: 0,
        showHeader: false,
        isScrollable: true,
        weekFormat: false,
        height: 400.0,
        selectedDateTime: _currentDate,
        customDayBuilder: (isSelectable, index, isSelectedDay, isToday,
            isPrevMonthDay, textStyle, isNextMonthDay, isThisMonthDay, day) {
          if (isNextMonthDay || isPrevMonthDay) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff63C3CA),
                  ),
                ),
              ),
            );
          }

          if (isSelectedDay) {
            return Container(
              decoration: new BoxDecoration(
                color: Color(0xffF3DCCC),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(11.0)),
              ),
              margin: const EdgeInsets.all(4.0),
              width: 50,
              height: 50,
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
            return Container(
              margin: const EdgeInsets.all(4.0),
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Color(0xff1CA1AD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
        markedDateCustomShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.0))),
        // null for not rendering any border, true for circular border, false for rectangular border
        customGridViewPhysics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
