import 'package:EquoKids/Calendar/Event.dart';
import 'package:EquoKids/Utils/DropBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avaliar extends StatelessWidget {
  final Size size;
  final Event event;

  Avaliar({@required this.size, @required this.event});

  _typeChange() {
    return {
      "socialDevelopment": event.socialDevelopment,
      "motorDevelopment": event.motorDevelopment,
      "selfCare": event.selfCare
    };
  }

  _header(bool isInEvaluation) {
    return Column(
      children: <Widget>[
        Container(
          width: size.width,
          height: 60,
          padding: EdgeInsets.only(left: 18, top: 13),
          decoration: BoxDecoration(
              color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11), topRight: Radius.circular(11))),
          child: Text(
            isInEvaluation ? "Avaliar" : "Avaliado",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: size.width,
            height: 1,
            decoration: BoxDecoration(color: Colors.white))
      ],
    );
  }

  _timeBox(String text, bool isInEvaluation) {
    return Row(
      children: <Widget>[
        Text(
          text + ":",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Container(
          width: size.width * 0.2,
          height: 54,
          margin: EdgeInsets.only(
            left: 19,
            right: 12,
          ),
          padding: EdgeInsets.only(top: 14, left: 15),
          decoration: BoxDecoration(
              color: isInEvaluation ? Color(0xffF3DCCC) : Color(0xff8BE8F0),
              borderRadius: BorderRadius.all(Radius.circular(70))),
          child: Text(
            ("Até" == text
                ? event.endTime.hour.toString()
                : event.startTime.hour.toString()) + "hrs",
            style: TextStyle(
                color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
                fontSize: 20),
          ),
        ),
      ],
    );
  }

  _schedule(bool isInEvaluation) {
    return Container(
      width: size.width,
      height: 60,
      padding: EdgeInsets.only(
        left: 18,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _timeBox("De", isInEvaluation),
          _timeBox("Até", isInEvaluation),
        ],
      ),
    );
  }

  _rating(String rate) {
    detector(IconData icon, int value) {
      return GestureDetector(
        onTap: () {
          _typeChange()[rate] = value;
          print(value);
        },
        child: Icon(
          icon,
          color: Color(0xffD4D4D4),
          size: 35,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        detector(FontAwesomeIcons.calendar, 1),
        detector(FontAwesomeIcons.calendar, 2),
        detector(FontAwesomeIcons.calendar, 3),
        detector(FontAwesomeIcons.calendar, 4),
        detector(FontAwesomeIcons.calendar, 5)
      ],
    );
  }

  _bigBox(String text, String rate, bool isInEvaluation) {
    return Container(
      width: size.width,
//      height: size.height * .18,
      padding: EdgeInsets.only(
        left: 10,
        top: 12,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Text(
              text,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 18,
                  color: isInEvaluation ? Color(0xffD68954) : Color(0xff4BB4BD),
                  fontWeight: FontWeight.w600),
            ),
          ),
          _rating(rate),
        ],
      ),
    );
  }

  _card1(bool isInEvaluation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 30,
            width: size.width * .3,
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: isInEvaluation ? Color(0xffE69E6D) : Color(0xff4BB4BD),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Text(
              "Aconteceu:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ))
      ],
    );
  }

  _card2(String text, double largura, bool isInEvaluation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 32,
            width: size.width * largura,
            padding: EdgeInsets.only(top: 6),
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
                  fontSize: 18,
                  color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
                  fontWeight: FontWeight.w800),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isInEvaluation = event.status == Status.InEvaluation;

    return Column(children: [
      _header(isInEvaluation),
      Container(
        width: size.width,
        height: 600,
        decoration: BoxDecoration(
          color: isInEvaluation ? Color(0xffF3DCCC) : Color(0xff8BE8F0),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                _card1(isInEvaluation),
                _schedule(isInEvaluation),
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Desenvolvimento Motor", .6, isInEvaluation),
                _bigBox("(marcha, equilibrio, locomoção, etc.)",
                    "motorDevelopment", isInEvaluation)
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Desenvolvimento Social", .6, isInEvaluation),
                _bigBox("(interação social, comunicação)", "socialDevelopment",
                    isInEvaluation)
              ],
            ),
            Column(
              children: <Widget>[
                _card2("Autocuidado", .34, isInEvaluation),
                _bigBox("(melhora na alimentação, higiene pessoal, etc.)",
                    "selfCare", isInEvaluation)
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
