//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:table_calendar/table_calendar.dart';
//import 'package:intl/intl.dart';
//
//class Calendar extends StatefulWidget {
//  @override
//  _CalendarState createState() => _CalendarState();
//}
//
//class _CalendarState extends State<Calendar> {
//  CalendarController _calendarController = CalendarController();
//
//  @override
//  Widget build(BuildContext context) {
//    return TableCalendar(
//      locale: 'pt_BR',
//      calendarController: _calendarController,
//      initialCalendarFormat: CalendarFormat.month,
//      formatAnimation: FormatAnimation.slide,
//      startingDayOfWeek: StartingDayOfWeek.sunday,
//      availableGestures: AvailableGestures.none,
//      rowHeight: 40,
//
//      //disable swipe between days
//      availableCalendarFormats: const {
//        CalendarFormat.month: 'Month',
//      },
//
//      calendarStyle: CalendarStyle(
//        todayStyle: TextStyle(
//          color: Colors.white,
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 18,
//        ),
//        weekdayStyle: TextStyle(
//          color: Color(0xff1CA1AD),
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 21,
//        ),
//        weekendStyle: TextStyle(
//          color: Color(0xff1CA6A6),
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 21,
//        ),
//        outsideStyle: TextStyle(
//          color: Color(0xff63C3CA),
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 21,
//        ),
//        unavailableStyle: TextStyle (
//          color: Color(0xff08C503A),
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 21,
//        ),
//        outsideWeekendStyle: TextStyle(
//          color: Color(0xff63C3CA),
//          fontFamily: "Comfortaa",
//          fontWeight: FontWeight.w900,
//          fontSize: 21,
//        ),
//      ),
//      daysOfWeekStyle: DaysOfWeekStyle(
//        dowTextBuilder: (date, locale) {
//          var weekName = DateFormat.E(locale).format(date);
//          return weekName.substring(0, 1).toUpperCase() +
//              weekName.substring(1, 3);
//        },
//        weekdayStyle: TextStyle(
//          color: Color(0xff1CA1AD),
//          fontFamily: "Raleway",
//          fontWeight: FontWeight.w900,
//          fontSize: 20,
//        ),
//        weekendStyle: TextStyle(
//          color: Color(0xff1CA1AD),
//          fontFamily: "Raleway",
//          fontWeight: FontWeight.w900,
//          fontSize: 20,
//        ),
//      ),
//      headerStyle: HeaderStyle(
//          titleTextBuilder: (date, locale) {
//            var weekName = DateFormat.MMMM(locale).format(date);
//            return weekName.substring(0, 1).toUpperCase() +
//                weekName.substring(1);
////          weekName.substring(0,1).toUpperCase()+weekName.substring(1)
//          },
//
//          titleTextStyle: TextStyle(
//            color: Color(0xff1CA1AD),
//            fontFamily: "Raleway",
//            fontWeight: FontWeight.w900,
//            fontSize: 30,
//          )),
//      builders: CalendarBuilders(
//        selectedDayBuilder: (context, date, _) {
//          return Container(
//            decoration: new BoxDecoration(
//              color: Color(0xffF3DCCC),
//              shape: BoxShape.rectangle,
//              borderRadius: BorderRadius.all(Radius.circular(11.0)),
//            ),
//            margin: const EdgeInsets.all(4.0),
//            width: 50,
//            height: 50,
//            child: Center(
//              child: Text(
//                '${date.day}',
//                style: TextStyle(
//                  fontSize: 21.0,
//                  color: Color(0xff1CA1AD),
//                  fontWeight: FontWeight.w900,
//                ),
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
