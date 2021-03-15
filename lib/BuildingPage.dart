import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BuildPage extends StatelessWidget {
  final String titulopagina;
  final bool pagina;

  BuildPage({this.titulopagina, this.pagina});

  body(context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 350,
                  height: 250,
                  child: Lottie.asset(
                    "assets/developer.json",
                    frameBuilder: (context, child, composition) {
                      return AnimatedOpacity(
                        child: child,
                        opacity: composition == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Em Construção",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFD98859),
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pagina == false) {
      return body(context);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Container(
              child: Image.asset("images/login/logokamoney.png"),
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
      body: body(context),
    );
  }
}
