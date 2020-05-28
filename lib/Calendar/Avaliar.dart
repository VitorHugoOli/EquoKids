import 'package:EquoKids/Calendar/Event.dart';
import 'package:EquoKids/Utils/EvaluationIcons.dart';
import 'package:EquoKids/Utils/Flush.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Avaliar extends StatefulWidget {
  final Size size;
  final Event event;
  final StateSetter setter;

  Avaliar({@required this.size, @required this.event, @required this.setter});

  @override
  _AvaliarState createState() => _AvaliarState();
}

class _AvaliarState extends State<Avaliar> {
  _typeChange() {
    return {
      "socialDevelopment": {
        "value": widget.event.socialDevelopment,
        "set": (value) {
          widget.event.socialDevelopment = value;
        }
      },
      "motorDevelopment": {
        "value": widget.event.motorDevelopment,
        "set": (value) {
          widget.event.motorDevelopment = value;
        }
      },
      "selfCare": {
        "value": widget.event.selfCare,
        "set": (value) {
          widget.event.selfCare = value;
        }
      }
    };
  }

  _header(bool isInEvaluation) {
    return Column(
      children: <Widget>[
        Container(
          width: widget.size.width,
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
            width: widget.size.width,
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
          width: widget.size.width * 0.22,
          height: 54,
          margin: EdgeInsets.only(
            left: 19,
            right: 12,
          ),
          padding: EdgeInsets.only(top: 15, left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(70),
            ),
          ),
          child: Text(
            ("Até" == text
                    ? widget.event.endTime.hour.toString()
                    : widget.event.startTime.hour.toString()) +
                "hrs",
            style: TextStyle(
                color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
                fontSize: widget.size.height * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _schedule(bool isInEvaluation) {
    return Container(
      width: widget.size.width,
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

  _rating(String rate, bool isInEvaluation) {
    detector(IconData icon, int value) {
      return GestureDetector(
        onTap: () {
          if (isInEvaluation) {
            _typeChange()[rate]["set"](value);
            setState(() {});
          }
        },
        child: Icon(
          icon,
          color: _typeChange()[rate]["value"] == value
              ? Colors.white
              : isInEvaluation ? Color(0xffF3DCCC) : Color(0xff8BE8F0),
          size: 45,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        detector(EvaluationIcons.darkness, 1),
        detector(EvaluationIcons.sad, 2),
        detector(EvaluationIcons.meh_regular, 3),
        detector(EvaluationIcons.smile_regular, 4),
        detector(EvaluationIcons.happy, 5)
      ],
    );
  }

  _bigBox(String text, String rate, bool isInEvaluation) {
    return Container(
      width: widget.size.width,
      padding: EdgeInsets.only(
        left: 10,
        top: 12,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
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
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          _rating(rate, isInEvaluation),
        ],
      ),
    );
  }

  _cardHappened(bool isInEvaluation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 35,
            width: widget.size.width * .35,
            padding: EdgeInsets.only(top: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Text(
              "Aconteceu:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 20,
                  color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }

  _cardEvaluation(String text, double largura, bool isInEvaluation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 32,
            width: widget.size.width * largura,
            padding: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: isInEvaluation ? Color(0xffD68954) : Color(0xff1CA1AD),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ))
      ],
    );
  }

  Column evaluation(
      {bool isInEvaluation,
      double width,
      String textSubtitle,
      String rate,
      String textBody}) {
    return Column(
      children: <Widget>[
        _cardEvaluation(textSubtitle, width, isInEvaluation),
        _bigBox(textBody, rate, isInEvaluation),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isInEvaluation = widget.event.status == Status.InEvaluation;

    return Column(children: [
      _header(isInEvaluation),
      Container(
        width: widget.size.width,
        height: 700,
        decoration: BoxDecoration(
          color: isInEvaluation ? Color(0xffE69E6D) : Color(0xff4BB4BD),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                _cardHappened(isInEvaluation),
                _schedule(isInEvaluation),
              ],
            ),
            evaluation(
                isInEvaluation: isInEvaluation,
                width: .6,
                textSubtitle: "Desenvolvimento Motor",
                textBody: "(marcha, equilibrio, locomoção, etc.)",
                rate: "motorDevelopment"),
            evaluation(
                isInEvaluation: isInEvaluation,
                width: .6,
                textSubtitle: "Desenvolvimento Social",
                textBody: "(interação social, comunicação)",
                rate: "socialDevelopment"),
            evaluation(
                isInEvaluation: isInEvaluation,
                width: .34,
                textSubtitle: "Autocuidado",
                textBody: "(melhora na alimentação, higiene pessoal, etc.)",
                rate: "selfCare"),
            isInEvaluation
                ? Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: size.height * 0.07,
                    width: widget.size.width * 0.3,
                    child: FlatButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: Color(0xffD68954),
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        if (widget.event.motorDevelopment > 0 &&
                            widget.event.socialDevelopment > 0 &&
                            widget.event.selfCare > 0) {
                          widget.event.status = Status.rated;
                          widget.setter(() {});
                        } else {
                          buildMessenger(
                              messenger:
                                  "Vocẽ deve preencher todos as avaliaçoes",
                              context: context);
                        }
                      },
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: size.height * 0.07,
                  ),
          ],
        ),
      ),
    ]);
  }
}
