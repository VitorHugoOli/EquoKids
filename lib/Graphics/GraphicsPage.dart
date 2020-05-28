import 'package:EquoKids/Calendar/CalendarPage.dart';
import 'package:EquoKids/Calendar/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AreaChart.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<charts.Series<EventTotal, String>> chartTotal =
      List<charts.Series<EventTotal, String>>();
  List<charts.Series<EventTotal, String>> chartDetails =
      List<charts.Series<EventTotal, String>>();

  Container buildGenericCard(
      Size size, String title, Widget builderWidget, customSize) {
    return Container(
      height: size.height * customSize,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.06,
            width: size.width * 0.7,
            padding: EdgeInsets.only(bottom: 4, right: 8),
            decoration: BoxDecoration(
                color: Color(0xFFE69E6D),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 20,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )),
          ),
          Positioned(
            top: 35,
            child: Container(
              height: size.height * (customSize - 0.1),
              width: size.width * 0.95,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: builderWidget,
            ),
          )
        ],
      ),
    );
  }

  buildTotalChart(Size size) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.33,
            child: charts.OrdinalComboChart(chartTotal,
                defaultRenderer: new charts.BarRendererConfig(
                    // By default, bar renderer will draw rounded bars with a constant
                    // radius of 100.
                    // To not have any rounded corners, use [NoCornerStrategy]
                    // To change the radius of the bars, use [ConstCornerStrategy]
                    cornerStrategy: const charts.ConstCornerStrategy(30),
                    groupingType: charts.BarGroupingType.grouped),
                behaviors: [
//                  charts.SeriesLegend(position: charts.BehaviorPosition.bottom)
                ],
                animate: false,
                primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                    <charts.TickSpec<num>>[
                      charts.TickSpec<num>(1, label: 'Ruim'),
                      charts.TickSpec<num>(2, label: 'Regular'),
                      charts.TickSpec<num>(3, label: 'Medio'),
                      charts.TickSpec<num>(4, label: 'Bom'),
                      charts.TickSpec<num>(5, label: 'Ótimo'),
                    ],
                  ),
                ),
                customSeriesRenderers: [
                  new charts.LineRendererConfig(
                      // ID used to link series to this renderer.
                      includePoints: true,
                      includeArea: true,
                      stacked: true,
                      strokeWidthPx: 5,
                      radiusPx: 5,
                      customRendererId: 'customLine')
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Legenda:",
                      style: TextStyle(
                          color: Color(0xff1CA1AD),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        height: 10,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffDB9E37),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11, left: 11),
                        child: Text(
                          "Desenvolvimento médio por mês",
                          style: TextStyle(
                              color: Color(0xffDB9E37),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildPerTypeChart(Size size) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.33,
            child: charts.OrdinalComboChart(chartDetails,
                defaultRenderer: new charts.BarRendererConfig(
                    // By default, bar renderer will draw rounded bars with a constant
                    // radius of 100.
                    // To not have any rounded corners, use [NoCornerStrategy]
                    // To change the radius of the bars, use [ConstCornerStrategy]
                    cornerStrategy: const charts.ConstCornerStrategy(30),
                    groupingType: charts.BarGroupingType.grouped),
                behaviors: [
//                  charts.SeriesLegend(position: charts.BehaviorPosition.bottom)
                ],
                animate: false,
                primaryMeasureAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.StaticNumericTickProviderSpec(
                    <charts.TickSpec<num>>[
                      charts.TickSpec<num>(1, label: 'Ruim'),
                      charts.TickSpec<num>(2, label: 'Regular'),
                      charts.TickSpec<num>(3, label: 'Medio'),
                      charts.TickSpec<num>(4, label: 'Bom'),
                      charts.TickSpec<num>(5, label: 'Ótimo'),
                    ],
                  ),
                ),
                customSeriesRenderers: [
                  new charts.LineRendererConfig(
                      // ID used to link series to this renderer.
                      includePoints: true,
                      stacked: true,
                      strokeWidthPx: 5,
                      radiusPx: 5,
                      customRendererId: 'customMotor'),
                  new charts.LineRendererConfig(
                      // ID used to link series to this renderer.
                      includePoints: true,
                      stacked: true,
                      strokeWidthPx: 5,
                      radiusPx: 5,
                      customRendererId: 'customSocial'),
                  new charts.LineRendererConfig(
                      // ID used to link series to this renderer.
                      includePoints: true,
                      stacked: true,
                      strokeWidthPx: 5,
                      radiusPx: 5,
                      customRendererId: 'customSelf')
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Legenda:",
                      style: TextStyle(
                          color: Color(0xff1CA1AD),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        height: 10,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffDB9E37),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11, left: 11),
                        child: Text(
                          "Desenvolvimento Motor",
                          style: TextStyle(
                              color: Color(0xffDB9E37),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        height: 10,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffDB554D),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11, left: 11),
                        child: Text(
                          "Desenvolvimento Social",
                          style: TextStyle(
                              color: Color(0xffDB554D),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 14),
                        height: 10,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff37DB79),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11, left: 11),
                        child: Text(
                          "Desenvolvimento Autocuidado",
                          style: TextStyle(
                              color: Color(0xff37DB79),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    chartTotal.add(charts.Series<EventTotal, String>(
      id: 'Desenvolvimento',
      colorFn: (_, __) => charts.Color.fromHex(code: '#DB9E37'),
      domainFn: (EventTotal event, _) => event.mes,
      measureFn: (EventTotal event, _) => event.total,
      areaColorFn: (EventTotal, _) =>
          charts.Color(r: 219, g: 158, b: 55, a: 40),
      data: EventTotal.makeAnalyzeTotal(events),
    )..setAttribute(charts.rendererIdKey, 'customLine'));

    chartDetails.add(charts.Series<EventTotal, String>(
      id: 'Motor',
      colorFn: (_, __) => charts.Color.fromHex(code: '#DB9E37'),
      domainFn: (EventTotal event, _) => event.mes,
      measureFn: (EventTotal event, _) => event.total,
      areaColorFn: (EventTotal, _) =>
          charts.Color(r: 219, g: 158, b: 55, a: 40),
      data: EventTotal.makeAnalyzeMotor(events),
    )..setAttribute(charts.rendererIdKey, 'customMotor'));

    chartDetails.add(charts.Series<EventTotal, String>(
      id: 'Social',
      colorFn: (_, __) => charts.Color.fromHex(code: '#DB554D'),
      domainFn: (EventTotal event, _) => event.mes,
      measureFn: (EventTotal event, _) => event.total,
      areaColorFn: (EventTotal, _) =>
          charts.Color(r: 219, g: 158, b: 55, a: 40),
      data: EventTotal.makeAnalyzeSocial(events),
    )..setAttribute(charts.rendererIdKey, 'customSocial'));

    chartDetails.add(charts.Series<EventTotal, String>(
      id: 'Self',
      colorFn: (_, __) => charts.Color.fromHex(code: '#37DB79'),
      domainFn: (EventTotal event, _) => event.mes,
      measureFn: (EventTotal event, _) => event.total,
      areaColorFn: (EventTotal, _) =>
          charts.Color(r: 219, g: 158, b: 55, a: 40),
      data: EventTotal.makeAnalyzeSelf(events),
    )..setAttribute(charts.rendererIdKey, 'customSelf'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildGenericCard(
                size, "Desenvolvimento Mensal", buildTotalChart(size), 0.57),
            buildGenericCard(
                size, "Mês Detalhado", buildPerTypeChart(size), 0.65),
          ],
        ),
      ),
    );
  }
}
