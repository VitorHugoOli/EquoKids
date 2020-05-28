import 'package:EquoKids/Utils/Card.dart';
import 'package:flutter/material.dart';

class Equinoterapia extends StatelessWidget {
  static List<Widget> cardItems = <Widget>[
    GenericCard(
      title: "O que é equoterapia?",
      subtitle:
          "É um método terapêutico que utiliza o cavalo dentro de uma abordagem interdisciplinar nas áreas de saúde, educação e equitação, buscando o desenvolvimento biopsicossocial de pessoas com deficiência e/ou com necessidades especiais.",
      image: "assets/question2.jpg",
    ),
    GenericCard(
      title: "Qual o Objetivo do EquoKids?",
      subtitle:
          "O EquoKids é um aplicativo que tem como tema inicial a Equoterapia - método terapêutico e educacional que utiliza o cavalo como meio de aprendizagem.\n\n" +
              "Objetivos: \n" +
              "-Fazer com que os responsáveis tenham um fácil acesso ao desenvovimento de suas crianças e que também exponham a sua visão.\n" +
              "-Troca de experinêcias com outros responsáveis.\n" +
              "-Acesso a agenda do auluno (horário e data das aulas).\n",
      image: "assets/question1.jpg",
    ),
    GenericCard(
      title: "Quais os benefícios?",
      subtitle:
          "A Equoterapia emprega o cavalo como agente promotor de ganhos a nível físico e psíquico. Esta atividade exige a participação do corpo inteiro, contribuindo, assim, para o desenvolvimento da força muscular, relaxamento, conscientização do próprio corpo e aperfeiçoamento da coordenação motora e do equilíbrio.",
      image: "assets/question3.jpg",
    ),
    GenericCard(
      title: "Pra quem é indicado?",
      subtitle:
          "Para pessoas com deficiências ou necessidades especiais, como a síndrome de Down, paralisia cerebral, derrame, esclerose múltipla, hiperatividade, autismo, crianças muito agitadas ou com dificuldade de concentração.",
      image: "assets/question4.jpg",
    ),
    GenericCard(
      title: "Existem contraindicações?",
      subtitle: "Luxação ou sublocação: Bloqueio articular ou limitação da amplitude de movimento para acompanhar a sessão. Desalinhamento posturais, pélvico ou de coluna, que não possam ser corrigidos;\n\n" +
          "Traqueostomia: Os casos que ocorre a dependência de oxigenoterapia ou desconforto respiratório;\n\n" +
          "Asma e alergia: Praticante que desencadeia crises de broncoespasmo no ambiente equoterápico, será considerado contraindicado;\n\n" +
          "Epilepsia: Participantes com crise de epilepsia fora de controle;\n\n" +
          "Doenças Degenerativas: Em estágios avançados da doença ou casos que ocorra esforço, fadiga ou piora da função.\n\n",
      image: "assets/question5.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: cardItems),
    );
  }
}
