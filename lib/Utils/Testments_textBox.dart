import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Size size;

_textBox() {
  return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    Container(
        width: size.width * .912,
        height: 54,
        padding: EdgeInsets.only(
            left: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child:

        Row(mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(FontAwesomeIcons.calendar, color: Colors.black45, size: 20),
          ],
        )),
  ]);
}

_bottomButtons(String text, bool isInEvaluation) {
  return Row(
    children: <Widget>[
      Container(
        width: size.width * .35,
        height: size.height * .03,
        margin: EdgeInsets.only(
          left: 19,
          right: 12,
        ),
        decoration: BoxDecoration(
            color: isInEvaluation ? Color(0xffF3DCCC) : Color(0xff8BE8F0),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    ],
  );
}
_socialHeader(bool isInEvaluation) {
  return Container(
    width: size.width,
    height: 90,
    padding: EdgeInsets.only(
      bottom: 5,
    ),
    decoration: BoxDecoration(
        color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _textBox(),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          _bottomButtons("+ foto", isInEvaluation),
          _bottomButtons("Publicar", isInEvaluation)
        ])
      ],
    ),
  );
}
