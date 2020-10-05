
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacilityT1Chart extends StatelessWidget {

  static Map<dynamic, String> facilityModeName = {0: 'Bekleme', 1: 'Manuel', 2: 'Seri Üretim', 3: 'Setup', 4: 'Yarı Otomatik'} ;
  static Map<dynamic, String> facilityModeCharacters = {0: 'B', 1: 'M', 2: 'S', 3: 'S', 4: 'Y'} ;

  _getData() async {
    final response = await http.get(
        'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    return map['fakeapi'][0]['T3']['facilityModePerc'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              return new charts.PieChart(
                  dataList(snapshot.data),
                  defaultRenderer: new charts.ArcRendererConfig(
                      arcRendererDecorators: [new charts.ArcLabelDecorator()]),
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
          }
      ),
    );
  }

  

  static List<charts.Series<Productivity, dynamic>> dataList(Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();

    for(int i=0; i<5; i++)
      list.add(new Productivity(facilityModeName[i], apiData[facilityModeName[i]]));

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