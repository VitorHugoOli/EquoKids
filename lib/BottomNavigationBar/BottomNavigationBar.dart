import 'package:equokids/Calendar/Calendar.dart';
import 'package:equokids/EquinoTerapia/Equinoterapia.dart';
import 'package:equokids/Utils/Card.dart';
import 'package:equokids/Utils/HatCowBoy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../BuildingPage.dart';
import 'bubble_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex;
  Widget body = Equinoterapia();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  static List<BubbleBottomBarItem> barItens = <BubbleBottomBarItem>[
    BubbleBottomBarItem(
      backgroundColor: Color(0xFFD98859),
      icon: Icon(
        HatCowBoy.hatCowBoyOutline,
        color: Color(0xFF1CA6A6),
      ),
      activeIcon: Icon(
        HatCowBoy.hatCowBoyOutline,
        color: Color(0xFFD98859),
      ),
      title: Text("Equinoterapia"),
    ),
    BubbleBottomBarItem(
      backgroundColor: Color(0xFFD98859),
      icon: Icon(
        HatCowBoy.hatCowBoyOutline,
        color: Color(0xFF1CA6A6),
      ),
      activeIcon: Icon(
        HatCowBoy.hatCowBoyOutline,
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

  static final mapPag = {
    0: Equinoterapia(),
    1: BuildPage(pagina: false, Titulopagina: "Construindo"),
    2: BuildPage(pagina: false, Titulopagina: "Construindo"),
    3: Calendar(),
    4: BuildPage(pagina: false, Titulopagina: "Construindo"),

  };

  void changePage(int i) {
    var tempBody = mapPag[i];
    if (tempBody != null) {
      body = tempBody;
    }
    setState(() {
      currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int index = 0;
          for (int i = 0; i < barItens.length; i++) {
            if (barItens[i].title.toString() ==
                Text("Equinoterapia").toString()) index = i;
          }
          body = mapPag[0];
          setState(() {
            currentIndex = index;
          });
        },
        child: Icon(
          HatCowBoy.hatCowBoy,
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
          items: barItens),
    );
  }
}
