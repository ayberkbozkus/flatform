import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductivityChart extends StatelessWidget {
  final String location;

  const ProductivityChart({Key key, this.location}) : super(key: key);

  static Map<dynamic, String> productivityModeName = {
    0: 'Manuel',
    1: 'Setup',
    2: 'Semi Automatic',
    3: 'Automatic',
    4: 'Hold to Run'
  };
  static Map<dynamic, String> productivityModeCharacters = {
    0: 'B',
    1: 'M',
    2: 'S',
    3: 'S',
    4: 'Y'
  };

  static String facilty;
  static String country;
  _getData() async {
    String url = "http://45.130.13.92:4340/dash_api?section=5min&device=mobile";
    var response = await http.get(url, headers: {"fluster": "fluster!2020"});
    if (location.startsWith('Tür') | location.startsWith('Ro')) {
      country = location;
      Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
      return map["Turkey"]['statusPerc'];
    } else if (location.startsWith('T')) {
      facilty = location;
      Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
      return map["Turkey"]["facilities"]["T3"]["statusPerc"];
    } else {
      Map<dynamic, dynamic> map = jsonDecode(response.body.toString());

      return map["Turkey"]["facilities"][facilty]["machines"][location]
          ['statusPerc'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return new charts.PieChart(
              dataList(snapshot.data),
              defaultRenderer: new charts.ArcRendererConfig(),
              behaviors: [
                new charts.DatumLegend(
                  desiredMaxRows: 5,
                  desiredMaxColumns: 2,
                  position: charts.BehaviorPosition.start,
                  entryTextStyle: charts.TextStyleSpec(
                    fontSize: 12,
                  ),
                )
              ],
            );
          else
            return Center(child: CircularProgressIndicator());
        });
  }

  static List<charts.Series<Productivity, dynamic>> dataList(
      Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();

    for (int i = 0; i < 5; i++) {
      double value = 0.0;
      if (apiData[productivityModeName[i]] == null) {
        value = 0.0;
      } else {
        value = apiData[productivityModeName[i]];
      }
      list.add(new Productivity(productivityModeName[i], value));
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
  final double value;
  Productivity(this.name, this.value);
}

/*
class ChartApp extends StatelessWidget {

  _getData() async{
    final response = await http.get('http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    return map['fakeapi'][0]['T3']['facilityModePerc']['Bekleme'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              return new charts.PieChart(
                  dataList(snapshot.data),
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcRendererDecorators: [new charts.ArcLabelDecorator()])
              );
            else
              return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  static List<charts.Series<Productivity, dynamic>> dataList(Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();

    for(int i=0; i<5; i++)
      list.add(new Productivity(i, apiData['fakeapi'][0]['T3']['facilityModePerc']['Bekleme']));

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
  final int name;
  final double value;
  Productivity(this.name, this.value);
} */
