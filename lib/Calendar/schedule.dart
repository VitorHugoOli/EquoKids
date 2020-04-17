import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';

class BottomSchedule extends StatelessWidget {
  Size size;
  Event event;

  BottomSchedule({@required this.size,@required this.event});

  _header() {
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.only(left: 18, top: 12),
      decoration: BoxDecoration(
          color: Color(0xffF3DCCC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Text(
        "Agendar",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 30,
            color: Color(0xffD68954),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  _timeBox(String text) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Container(
          width: size.width * 0.2,
          height: 54,
          margin: EdgeInsets.only(
            left: 19,
            right: 12,
          ),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xffF3DCCC),
              borderRadius: BorderRadius.all(Radius.circular(70))),
        ),
      ],
    );
  }

  _schedule() {
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.only(
        left: 18,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Color(0xffD68954),
          borderRadius: BorderRadius.all(Radius.circular(70))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _timeBox("De:"),
          _timeBox("Até:"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: size.width,
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xffF3DCCC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          children: <Widget>[
            _header(),

            _schedule()
          ],
        ),
      ),
    ]);
  }
}
