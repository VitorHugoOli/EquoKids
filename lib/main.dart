import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomNavigationBar/BottomNavigationBar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EquinoKids',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'), // English
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff1CA6A6),
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
