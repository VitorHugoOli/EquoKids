import 'package:EquoKids/BBT_Modified/newDorpDownButton.dart';
import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';

class BottomSchedule extends StatefulWidget {
  Size size;
  Event event;

  BottomSchedule({@required this.size, @required this.event});

  @override
  _BottomScheduleState createState() => _BottomScheduleState();
}

class _BottomScheduleState extends State<BottomSchedule> {
  String dropdownValue = '13hrs';

  _header() {
    return Container(
      width: widget.size.width,
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

  _dropBox() {
    return Theme(
      data: ThemeData(
        canvasColor: Color(0xffF3DCCC),
      ),
      child: DropdownButtonOwn<String>(
        value: dropdownValue,
        elevation: 16,
        style: TextStyle(color: Colors.white),
        iconSize: 0,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['13hrs', '12hrs', '11hrs', '10hrs']
            .map<DropdownMenuItemOwn<String>>((String value) {
          return DropdownMenuItemOwn<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Color(0xffD68954), fontSize: 20),
            ),
          );
        }).toList(),
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
          width: widget.size.width * 0.2,
          height: 54,
          margin: EdgeInsets.only(
            left: 19,
            right: 12,
          ),
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Color(0xffF3DCCC),
              borderRadius: BorderRadius.all(Radius.circular(70))),
          child: _dropBox(),
        ),
      ],
    );
  }

  _schedule() {
    return Container(
      width: widget.size.width,
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
        width: widget.size.width,
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xffF3DCCC),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        padding: EdgeInsets.only(left: 18, top: 12, right: 18),
        child: Column(
          children: <Widget>[_header(), _schedule()],
        ),
      ),
    ]);
  }
}
