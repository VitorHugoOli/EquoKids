import 'package:equokids/Utils/Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bubble_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  static List<BubbleBottomBarItem> itens = <BubbleBottomBarItem>[
    BubbleBottomBarItem(
//      showBadge: true,
//      badge: Text("5"),
//      badgeColor: Colors.deepPurpleAccent,
      backgroundColor: Color(0xFFD98859),
      icon: Icon(
        FontAwesomeIcons.hatCowboySide,
        color: Color(0xFF1CA6A6),
      ),
      activeIcon: Icon(
        FontAwesomeIcons.hatCowboySide,
        color: Color(0xFFD98859),
      ),
      title: Text("Equinoterapia"),
    ),
    BubbleBottomBarItem(
        backgroundColor: Color(0xFFD98859),
        icon: Icon(
          FontAwesomeIcons.solidCommentDots,
          color: Color(0xFF1CA6A6),
        ),
        activeIcon: Icon(
          FontAwesomeIcons.commentDots,
          color: Color(0xFFD98859),
        ),
        title: Text("Historias")),
    BubbleBottomBarItem(
        backgroundColor: Color(0xFFD98859),
        icon: Icon(
          FontAwesomeIcons.solidCalendarAlt,
          color: Color(0xFF1CA6A6),
        ),
        activeIcon: Icon(
          FontAwesomeIcons.calendarAlt,
          color: Color(0xFFD98859),
        ),
        title: Text("Calendarios")),
    BubbleBottomBarItem(
        backgroundColor: Color(0xFFD98859),
        icon: Icon(
          FontAwesomeIcons.chartLine,
          color: Color(0xFF1CA6A6),
        ),
        activeIcon: Icon(
          FontAwesomeIcons.chartLine,
          color: Color(0xFFD98859),
        ),
        title: Text("Evolução"))
  ];

  void changePage(int i, title) {
    int index;
    for (int i = 0; i < itens.length; i++) {
      if (itens[i].title == title) index = i;
    }
    print(title);
    print(index);
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD98859),
        title: Center(
          child: Image(
            image: AssetImage("assets/equokids1.png"),
            width: size.width * 0.4,
            fit: BoxFit.fill,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GenericCard(
              title: "Qual o Objetivo do EquoKids?\n",
              subtitle: "O EquoKids é um aplicativo que tem como tema inicial a Equoterapia - método terapêutico e educacional que utiliza o cavalo como meio de aprendizagem.\n\n"+
              "Objetivos: \n" +
                  "-Fazer com que os responsáveis tenham um fácil acesso ao desenvovimento de suas crianças e que também exponham a sua visão.\n" +
                  "-Troca de experinêcias com outros responsáveis.\n" +
                  "-Acesso a agenda do auluno (horário e data das aulas).\n",
              image: "assets/question1.jpg",
            ),
            GenericCard(
              title: "O que é equoterapia?",
              subtitle: "Realmente é",
              image: "assets/question2.jpg",
            ),
            GenericCard(
              title: "Caleb sou eu 2",
              subtitle: "Realmente é",
              image: "assets/question3.jpg",
            ),
            GenericCard(
              title: "Josue sou eu 2",
              subtitle: "Realmente é talvez",
              image: "assets/question4.jpg",
            ),
            GenericCard(
              title: "Josue sou eu 2",
              subtitle: "Realmente é talvez",
              image: "assets/question5.jpg",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int index = 0;
          for (int i = 0; i < itens.length; i++) {
            if (itens[i].title.toString() == Text("Equinoterapia").toString())
              index = i;
          }
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
        child: Icon(
          FontAwesomeIcons.hatCowboySide,
          color: Colors.white,
          size: 25,
        ),
        backgroundColor: Color(0xFFD98859),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BubbleBottomBar(
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.center,
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          //border radius doesn't work when the notch is enabled.
          elevation: 8,
          items: itens),
    );
  }
}
