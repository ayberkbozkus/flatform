import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorkingSituationChart extends StatelessWidget {
  final String location;

  const WorkingSituationChart({Key key, this.location}) : super(key: key);

  static Map<dynamic, String> productivityModeName = {
    0: 'Çalışan',
    1: 'Toplam'
  };
  static Map<dynamic, String> productivityModeCharacters = {0: 'Ç', 1: 'T'};

  static String machineNumber = "0";
  static String facilty;
  static String country;
  _getData() async {
    String url = "http://45.130.13.92:4340/dash_api?section=5min&device=mobile";
    var response = await http.get(url, headers: {"fluster": "fluster!2020"});
    Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
    if (location.startsWith('Tür') | location.startsWith('Ro')) {
      country = "Turkey";
      machineNumber = "14";
      return map;
    } else if (location.startsWith('T')) {
      facilty = location;
      if (location == "T2") {
        machineNumber = "6";
      } else {
        machineNumber = "4";
      }
      return map[country]['facilities'];
    } else {
      machineNumber = "0";
      return map[country]['facilities'][facilty]['machines'][location];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return Stack(children: [
                new charts.PieChart(
                  dataList(snapshot.data),
                  defaultRenderer: new charts.ArcRendererConfig(
                    arcWidth: 20,
                  ),
                  behaviors: [
                    new charts.DatumLegend(
                      desiredMaxRows: 5,
                      desiredMaxColumns: 2,
                      position: charts.BehaviorPosition.bottom,
                      entryTextStyle: charts.TextStyleSpec(
                        fontSize: 9,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: Text(
                      machineNumber,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]);
            else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  static List<charts.Series<Productivity, dynamic>> dataList(
      Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();
    Map<int, int> value = {0: 14, 1: 80};
    for (int i = 0; i < 2; i++) {
      if (apiData["Turkey"] != null) {
        value = {0: 14, 1: 66};
      } else if (apiData["T1"] != null) {
        value = {0: 4, 1: 12};
      } else if (apiData["T2"] != null) {
        value = {0: 6, 1: 10};
      } else if (apiData["T3"] != null) {
        value = {0: 4, 1: 12};
      } else {
        machineNumber = "6";
      }
      list.add(new Productivity(productivityModeName[i], value[i]));
    }
    ;

    return [
      new charts.Series<Productivity, dynamic>(
        id: 'Tesis Verimliligi',
        domainFn: (Productivity productivity, _) => productivity.name,
        measureFn: (Productivity productivity, _) => productivity.value,
        data: list,
        labelAccessorFn: (Productivity row, _) => '${row.name}: ${row.value}',
      )
    ];
  }
}

class Productivity {
  final String name;
  final int value;
  Productivity(this.name, this.value);
}
