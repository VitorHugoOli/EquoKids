import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

enum Status { none, scheduled, InEvaluation, rated }

class Event {
  DateTime dateTime;
  DateTime startTime;
  DateTime endTime;
  int motorDevelopment;
  int socialDevelopment;
  int selfCare;
  Status status;

  Event({
    @required this.dateTime,
    @required this.startTime,
    @required this.endTime,
    @required this.motorDevelopment,
    @required this.socialDevelopment,
    @required this.selfCare,
    @required this.status,
  });
}

class EventTotal {
  double total;
  String mes;

  EventTotal({
    @required this.total,
    @required this.mes,
  });

  static Map<int, String> months = {
    1: "Jan".toUpperCase(),
    2: "Fev".toUpperCase(),
    3: "Mar".toUpperCase(),
    4: "Abr".toUpperCase(),
    5: "Mai".toUpperCase(),
    6: "Jun".toUpperCase(),
    7: "Jul".toUpperCase(),
    8: "Ago".toUpperCase(),
    9: "Set".toUpperCase(),
    10: "Out".toUpperCase(),
    11: "Nov".toUpperCase(),
    12: "Dez".toUpperCase(),
  };

  static makeAnalyzeTotal(Map<DateTime, Event> events) {
    List<EventTotal> eventsTotal = List<EventTotal>();
    var obj = {};

    events.forEach((key, value) {
      if (value.status == Status.rated) {
        var month = value.dateTime.month;

        if (!obj.containsKey(month)) obj[month] = {'values': 0.0, 'count': 0.0};
        obj[month]['values'] += ((value.motorDevelopment +
                value.socialDevelopment +
                value.selfCare) /
            3);
        obj[month]['count'] += 1;
      }
    });

    obj.forEach((key, value) {
      print(value['values']);
      eventsTotal.add(EventTotal(
          total: (value['values'] / value['count']), mes: months[key]));
    });
    return eventsTotal;
  }

  static makeAnalyzeMotor(Map<DateTime, Event> events) {
    List<EventTotal> eventsTotal = List<EventTotal>();
    var obj = {};

    events.forEach((key, value) {
      if (value.status == Status.rated) {
        var month = value.dateTime.month;

        if (!obj.containsKey(month)) obj[month] = {'values': 0.0, 'count': 0.0};
        obj[month]['values'] += value.motorDevelopment;
        obj[month]['count'] += 1;
      }
    });

    obj.forEach((key, value) {
      print(value['values']);
      eventsTotal.add(EventTotal(
          total: (value['values'] / value['count']), mes: months[key]));
    });
    return eventsTotal;
  }

  static makeAnalyzeSocial(Map<DateTime, Event> events) {
    List<EventTotal> eventsTotal = List<EventTotal>();
    var obj = {};

    events.forEach((key, value) {
      if (value.status == Status.rated) {
        var month = value.dateTime.month;

        if (!obj.containsKey(month)) obj[month] = {'values': 0.0, 'count': 0.0};
        obj[month]['values'] += value.socialDevelopment;
        obj[month]['count'] += 1;
      }
    });

    obj.forEach((key, value) {
      print(value['values']);
      eventsTotal.add(EventTotal(
          total: (value['values'] / value['count']), mes: months[key]));
    });
    return eventsTotal;
  }

  static makeAnalyzeSelf(Map<DateTime, Event> events) {
    List<EventTotal> eventsTotal = List<EventTotal>();
    var obj = {};

    events.forEach((key, value) {
      if (value.status == Status.rated) {
        var month = value.dateTime.month;

        if (!obj.containsKey(month)) obj[month] = {'values': 0.0, 'count': 0.0};
        obj[month]['values'] += value.selfCare;
        obj[month]['count'] += 1;
      }
    });

    obj.forEach((key, value) {
      print(value['values']);
      eventsTotal.add(EventTotal(
          total: (value['values'] / value['count']), mes: months[key]));
    });

    eventsTotal.forEach((element) {
      print("vlaue ${element.total}");
    });
    return eventsTotal;
  }
}
