import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class Message extends Object{
  DateTime datePublisher;
  String messenger;
  Uint8List linkImage;
  String uuidUser;
  int Likes = 0;

  Message({
    @required this.datePublisher,
    @required this.messenger,
    @required this.linkImage,
    @required this.uuidUser,
  });

  static sortListMessage(List<Map> message) {
    message.sort((a, b) {
      if (a["message"].datePublisher.compareTo(b["message"].datePublisher) < 0) {
        return 1;
      } else {
        return 0;
      }
    });
    return message;
  }
}
