import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Testimonial extends StatefulWidget {
  @override
  _TestimonialState createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {

  Container _commentInput(Size size) {
    return Container(
            margin: EdgeInsets.only(top: 24, left: 12, right: 12),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
                bottomLeft: Radius.circular(14.0),
                bottomRight: Radius.circular(14.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.feather, color: Color(0xff7A7A7A))
              ],
            ),
          );
  }

  Container _commentButtons(Size size) {
    return Container(
            margin: EdgeInsets.only(top: 24, left: 12, right: 12),
            padding: EdgeInsets.only(top: 25, left: 13, right: 13),
            height: size.height * 0.09,
            decoration: BoxDecoration(
              color: Color(0xffF3DCCC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14.0),
                bottomRight: Radius.circular(14.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buttons("+ foto"),
                _buttons("Publicar"),
              ],
            ),
          );
  }

  _buttons(String text) {
    return Container(
      width: 152,
      padding: EdgeInsets.only(top: 1, bottom: 4),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10),
            side: BorderSide(color: Color(0xffD68954))),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        color: Color(0xffD68954),
      ),
    );
  }

  _headComment(Size size) {
    return Container(
      height: size.height * 0.15,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment:
                Alignment.lerp(Alignment.center, Alignment.bottomCenter, 4.8),
            child: _commentButtons(size),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _commentInput(size),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.0004),
      child: Center(
        child: Column(
          children: <Widget>[
            _headComment(size),
          ],
        ),
      ),
    );
  }
}
