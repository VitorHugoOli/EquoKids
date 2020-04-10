import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  static PageController _controllerOne = PageController(
    initialPage: DateTime.now().month - 1,
    viewportFraction: 0.5,
  );

  static PageController _controllerTwo = PageController(
    initialPage: DateTime.now().month - 1,
    viewportFraction: 0.5,
  );

  static ScrollPhysics _physics = PageScrollPhysics();

  @override
  void initState() {
    super.initState();
    _controllerOne.addListener(_scrollListener);
  }

  ///Scroll Control
  _scrollListener() async {
    _controllerTwo.animateTo(_controllerOne.offset, duration: Duration(milliseconds: 1), curve: Curves.linear);
  }

  Widget monthListStyle(Size size, String month) {
    TextStyle sty;

    sty = TextStyle(
      fontSize: 32.0,
      fontFamily: "Raleway",
      color: Color.fromRGBO(28, 161, 173, 0.45),
      fontWeight: FontWeight.w700,
    );

    return Container(
      width: 2,
      height: 2,
      child: Text(month, style: sty),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            child: PageView(
              physics: _physics,
              controller: _controllerOne,
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
          Container(
            height: size.height * 0.1,
            child: PageView(
              physics: _physics,
              onPageChanged: (int page) {
                print(_physics.toString());
              },
              controller: _controllerTwo,
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
        ],
      ),
    );
  }
}
