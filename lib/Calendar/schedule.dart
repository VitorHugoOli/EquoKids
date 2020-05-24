import 'dart:ui';

import 'package:EquoKids/Calendar/Event.dart';
import 'package:EquoKids/Utils/DropBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  final Size size;
  final Event event;
  final StateSetter setter;
  final Map<DateTime, Event> events;

  Schedule({@required this.size,
    @required this.event,
    @required this.events,
    @required this.setter});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {


  _header(bool isInNone, Size size) {
    return Column(
      children: <Widget>[
        Container(
          width: size.width,
          height: 60,
          padding: EdgeInsets.only(left: 18, top: 13),
          decoration: BoxDecoration(
              color: isInNone ? Color(0xffF3DCCC) : Color(0xffD68954),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11), topRight: Radius.circular(11))),
          child: Text(
            isInNone ? "Agendar" : "Agendado",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 30,
                color: isInNone ? Color(0xffD68954) : Colors.white,
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

  _timeBox(String text) {
    return Row(
      children: <Widget>[
        Text(
          text + ":",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        Container(
          width: widget.size.width * 0.2,
          height: 54,
          margin: EdgeInsets.only(
            left: 19,
            right: 12,
          ),
          padding: EdgeInsets.only(left: window.physicalSize.height * 0.008),
          decoration: BoxDecoration(
              color: Color(0xffF3DCCC),
              borderRadius: BorderRadius.all(Radius.circular(70))),
          child: DropBoxInput(
            event: widget.event,
            timeType: "Até" == text ? "end" : "start",
            color: Color(0xffD68954),
          ),
        ),
      ],
    );
  }

  _schedule() {
    return Container(
      width: widget.size.width,
      height: 60,
      padding: EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
          color: Color(0xffD68954),
          borderRadius: BorderRadius.all(Radius.circular(70))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _timeBox("De"),
          _timeBox("Até"),
        ],
      ),
    );
  }

  RaisedButton buttons(isInNone) {
    RaisedButton buildButtons(
        {Color color, Color colorText, String text, Function onPressed}) {
      return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0)),
        color: color,
        onPressed: () {
          widget.setter(onPressed);
        },
        child: Text(
          text,
          style: TextStyle(color: colorText),
        ),
      );
    }

    if (isInNone) {
      return buildButtons(
        color: Color(0xffD68954),
        text: "Agendar",
        colorText: Colors.white,
        onPressed: () {
          widget.event.status = Status.scheduled;
          print(widget.event.startTime);
          print(widget.event.endTime);
          widget.events[widget.event.dateTime] = widget.event;
        },
      );
    } else {
      return buildButtons(
        color: Colors.white,
        text: "Cancelar Agendamento",
        colorText: Colors.black,
        onPressed: () {
          widget.event.status = Status.none;
          widget.events.remove(widget.event.dateTime);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    bool isInNone = widget.event.status == Status.none;

    return Column(children: [
      _header(isInNone, size),
      Container(
        width: widget.size.width,
        height: isInNone ? 200 : 600,
        decoration: BoxDecoration(
          color: isInNone ? Color(0xffFAE9DD) : Color(0xffE69E6D),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_schedule(), buttons(isInNone)],
        ),
      ),
    ]);
  }
}
