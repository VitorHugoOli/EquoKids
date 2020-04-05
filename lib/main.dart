import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomNavigationBar/BottomNavigationBar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EquinoKids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff1CA6A6),
        appBarTheme: AppBarTheme(
          color: Color(0x000000FF),
        ),

        scaffoldBackgroundColor: Color(0xFFCEF6F5),
        fontFamily: 'Comfortaa',

      ),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => new BottomNavigation(),
//        '/Calender': (BuildContext context) => new PageControllerServicos(),
//        '/Chat': (BuildContext context) => new LoginPage(),
//        '/Gallery': (BuildContext context) => new HomeScreen(),
//        '/Faq': (BuildContext context) => new EsqueceuSenha(),
      },
    );
  }
}


