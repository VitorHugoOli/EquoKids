import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CalendarCarousel.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String _currentMonth = DateFormat.MMMM("pt_BR").format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  int oldCurrentPageCalendar = 0;
  double oldCurrentPage = 0;

  static PageController _controller = PageController(
    initialPage: DateTime.now().month - 1,
    viewportFraction: 0.8,
  );

  static PageController _controllerCalendar = PageController(
    initialPage: 12,
    keepPage: true,
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ///Scroll Control
  _scrollListener() async {
    double current = _controller.page;
    if (oldCurrentPageCalendar != _controller.page) {
      if ((current - current.toInt()) == 0) {
        if (_controller.page < oldCurrentPage) {
          _controllerCalendar.nextPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        } else {
          _controllerCalendar.previousPage(
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        }
        oldCurrentPage = _controller.page;
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

//    teste(){
//      Column(
//     children: <Widget>[
//
//     ],
//    )}

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
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
          ),

        ],
      ),
    );
  }
}
