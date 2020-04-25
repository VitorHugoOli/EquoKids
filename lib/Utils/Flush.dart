import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

var _blockFlushBar = false;

buildMessenger({messenger, context}) {
  if (_blockFlushBar) {
    return null;
  }
  return Flushbar(
    message: messenger,
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    onStatusChanged: (FlushbarStatus status) {
      switch (status) {
        case FlushbarStatus.SHOWING:
          {
            print("SHOWING");
            break;
          }
        case FlushbarStatus.IS_APPEARING:
          {
            _blockFlushBar = true;
            break;
          }
        case FlushbarStatus.IS_HIDING:
          {
            _blockFlushBar = false;
            break;
          }
        case FlushbarStatus.DISMISSED:
          {
            _blockFlushBar = false;
            print("DISMISSED");
            break;
          }
      }
      Future.delayed(const Duration(milliseconds: 4000), () {
        _blockFlushBar = false;
        print("BlockBar: ${_blockFlushBar}");
      });
    },
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Color.fromRGBO(2, 203, 103, 1),
    ),
    duration: Duration(seconds: 4),
    leftBarIndicatorColor: Color.fromRGBO(2, 203, 103, 1),
  )..show(context);
}