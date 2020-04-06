import 'package:equokids/Utils/Card.dart';
import 'package:flutter/material.dart';

class Equinoterapia extends StatelessWidget {

  static List<Widget> cardItems = <Widget>[GenericCard(
    title: "Qual o Objetivo do EquoKids?\n",
    subtitle:
    "O EquoKids é um aplicativo que tem como tema inicial a Equoterapia - método terapêutico e educacional que utiliza o cavalo como meio de aprendizagem.\n\n" +
        "Objetivos: \n" +
        "-Fazer com que os responsáveis tenham um fácil acesso ao desenvovimento de suas crianças e que também exponham a sua visão.\n" +
        "-Troca de experinêcias com outros responsáveis.\n" +
        "-Acesso a agenda do auluno (horário e data das aulas).\n",
    image: "assets/question1.jpg",
  ),
    GenericCard(
      title: "O que é equoterapia?",
      subtitle:
      "Commodo occaecat deserunt irure officia mollit. Ea proident ipsum est deserunt ipsum minim ipsum dolore quis. Quis sunt non dolore irure ea officia velit nostrud incididunt do cupidatat do eu id. Nostrud tempor labore sunt amet in.",
      image: "assets/question2.jpg",
    ),
    GenericCard(
      title: "Quais os benefícios?",
      subtitle:
      "Commodo occaecat deserunt irure officia mollit. Ea proident ipsum est deserunt ipsum minim ipsum dolore quis. Quis sunt non dolore irure ea officia velit nostrud incididunt do cupidatat do eu id. Nostrud tempor labore sunt amet in.",
      image: "assets/question3.jpg",
    ),
    GenericCard(
      title: "Pra quem é indicado?",
      subtitle:
      "Commodo occaecat deserunt irure officia mollit. Ea proident ipsum est deserunt ipsum minim ipsum dolore quis. Quis sunt non dolore irure ea officia velit nostrud incididunt do cupidatat do eu id. Nostrud tempor labore sunt amet in.",
      image: "assets/question4.jpg",
    ),
    GenericCard(
      title: "Existem contraindicações?",
      subtitle:
      "Commodo occaecat deserunt irure officia mollit. Ea proident ipsum est deserunt ipsum minim ipsum dolore quis. Quis sunt non dolore irure ea officia velit nostrud incididunt do cupidatat do eu id. Nostrud tempor labore sunt amet in.",
      image: "assets/question5.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: cardItems
      ),
    );
  }
}
