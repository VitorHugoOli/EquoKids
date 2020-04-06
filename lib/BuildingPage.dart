import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  BuildPage({this.Titulopagina, this.pagina});

  String Titulopagina;
  bool pagina;

  body(context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top:50),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 350,
                  height: 350,
                  child: FlareActor('assets/space_demo.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "idle-comet"),
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
