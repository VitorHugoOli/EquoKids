import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avaliar extends StatelessWidget {
  Size size;

  Avaliar({this.size});

  _header() {
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.only(left: 18, top: 13),
      decoration: BoxDecoration(
          color: Color(0xffD68954),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11), topRight: Radius.circular(11))),
      child: Text(
        "Avaliar",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 30,
            color: Colors.white,
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _timeBox("De:"),
          _timeBox("Até:"),
        ],
      ),
    );
  }

  _bigBox(String text) {
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.only(
        left: 18,
        top: 8,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          )),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 18,
            color: Color(0xffD68954),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  _card1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 40,
            width: size.width * .4,
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Color(0xffE69E6D),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Text(
              "Aconteceu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ))
      ],
    );
  }

  _card2(String text, double largura) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 40,
            width: size.width * largura ,
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 26,
                  color: Color(0xffD68954),
                  fontWeight: FontWeight.w400),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _header(),
      Container(
        width: size.width,
        height: 600,
        decoration: BoxDecoration(
          color: Color(0xffF3DCCC),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                _card1(),
                _schedule(),
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Desenvolvimento Motor", .82),
                _bigBox("(marcha, equilibrio, locomoção, etc.)")
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Desenvolvimento Social", .82),
                _bigBox("(interação social, comunicação)")
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Autocuidado", .48),
                _bigBox("(melhora na alimentação, higiene pessoal, etc.)")
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
