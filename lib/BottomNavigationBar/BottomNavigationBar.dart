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
      showBadge: true,
      badge: Text("5"),
      badgeColor: Colors.deepPurpleAccent,
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.dashboard,
        color: Colors.black,
      ),
      activeIcon: Icon(
        Icons.dashboard,
        color: Colors.red,
      ),
      title: Text("Home"),
    ),
    BubbleBottomBarItem(
        backgroundColor: Colors.deepPurple,
        icon: Icon(
          Icons.access_time,
          color: Colors.black,
        ),
        activeIcon: Icon(
          Icons.access_time,
          color: Colors.deepPurple,
        ),
        title: Text("Logs")),
    BubbleBottomBarItem(
        backgroundColor: Colors.indigo,
        icon: Icon(
          Icons.folder_open,
          color: Colors.black,
        ),
        activeIcon: Icon(
          Icons.folder_open,
          color: Colors.indigo,
        ),
        title: Text("Folders")),
    BubbleBottomBarItem(
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        activeIcon: Icon(
          Icons.menu,
          color: Colors.green,
        ),
        title: Text("Menu"))
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
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
            width: size.width*0.4,
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
              title: "QUal o Objetivo do EquoKids?",
              subtitle: "é msm",
            ),
            GenericCard(
              title: "Caleb sou eu 2",
              subtitle: "Realmente é",
            ),GenericCard(
              title: "Caleb sou eu 2",
              subtitle: "Realmente é",
            ),GenericCard(
              title: "Josue sou eu 2",
              subtitle: "Realmente é talvez",
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
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
