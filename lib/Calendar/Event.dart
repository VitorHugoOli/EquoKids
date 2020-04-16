import 'package:flutter/cupertino.dart';

enum Status { none, scheduled, InEvaluation, rated }

class Event {
  DateTime dateTime;
  int motorDevelopment;
  int socialDevelopment;
  int selfCare;
  Status status;

  Event({
    @required this.dateTime,
    @required this.motorDevelopment,
    @required this.socialDevelopment,
    @required this.selfCare,
    @required this.status,
  });
}
