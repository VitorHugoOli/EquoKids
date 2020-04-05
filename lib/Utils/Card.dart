// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// This is the stateless widget that the main application instantiates.
class GenericCard extends StatelessWidget {
  String title;
  String subtitle;

  GenericCard({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        elevation: 9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              width: size.width ,
              margin: EdgeInsets.all(16),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage("assets/horse1.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}