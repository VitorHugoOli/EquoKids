import 'package:EquoKids/BBT_Modified/newDorpDownButton.dart';
import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';

class DropBoxInput extends StatefulWidget {
  final Event event;
  final String timeType;
  final Color color;

  DropBoxInput(
      {@required this.event, @required this.timeType, @required this.color});

  @override
  _DropBoxInputState createState() => _DropBoxInputState();
}

class _DropBoxInputState extends State<DropBoxInput> {
  String dropdownValue;

  static List<String> hours = <String>[
    "00hrs",
    "01hrs",
    "02hrs",
    "03hrs",
    "04hrs",
    "05hrs",
    "06hrs",
    "07hrs",
    "08hrs",
    "09hrs",
    "10hrs",
    "11hrs",
    "12hrs",
    "13hrs",
    "14hrs",
    "15hrs",
    "16hrs",
    "17hrs",
    "18hrs",
    "19hrs",
    "20hrs",
    "21hrs",
    "22hrs",
    "23hrs",
  ];

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.timeType == "end" ? hours[14] : hours[13];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime timeSet = DateTime.parse(
        "${widget.event.dateTime.toIso8601String().split("T")[0]}"
        "T"
        "${dropdownValue.split("hrs")[0]}Z");
    widget.timeType == "end"
        ? widget.event.endTime = timeSet
        : widget.event.startTime = timeSet;

    return Theme(
      data: ThemeData(
        canvasColor: Color(0xffF3DCCC),
      ),
      child: DropdownButtonOwn<String>(
        value: dropdownValue,
        elevation: 16,
        style: TextStyle(color: Colors.white),
        underline: Container(),
        iconSize: 0,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
            DateTime timeSet =
                DateTime.parse("2012-02-27T${dropdownValue.split("hrs")[0]}Z");
            widget.timeType == "end"
                ? widget.event.endTime = timeSet
                : widget.event.startTime = timeSet;
          });
        },
        items: hours.map<DropdownMenuItemOwn<String>>((String value) {
          return DropdownMenuItemOwn<String>(
            value: value,
            child: Text(
              value,
              style:
                  TextStyle(color: widget.color, fontSize: size.height * 0.03),
            ),
          );
        }).toList(),
      ),
    );
  }
}
