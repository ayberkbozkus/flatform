
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class TotalManufacturingChart extends StatelessWidget {

  final String location;

  const TotalManufacturingChart({Key key, this.location}) : super(key: key);

  static Map<dynamic, String> facilityModeName = {0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7', 8: '8', 9: '9'} ;
  static Map<dynamic, String> facilityModeNamee = {0: 'T1', 1: 'T2', 2: 'T3'} ;
  static Map<dynamic, String> facilityModeCharacters = {0: 'B', 1: 'M', 2: 'S', 3: 'S', 4: 'Y'} ;

  static String facilty;

  _getData() async {

    if (location.startsWith('Tür')|location.startsWith('Ro')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    return map['fakeapi'][0][location]['hourlyPartCount'];
    }else if (location.startsWith('T')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    return map['fakeapi'][0][location]['hourlyPartCount'];
    } else {
      final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    return map['fakeapi'][0][facilty]['machines'][location]['hourlyPartCount'];
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              return new charts.BarChart(
                  dataList(snapshot.data),
          animationDuration: Duration(microseconds: 2000),
              );
            else
              return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  

        

  static List<charts.Series<Productivity, String>> dataList(Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();
    if(apiData[facilityModeNamee[0]]!=null){
      for(int i=0; i<3; i++)
      list.add(new Productivity(facilityModeNamee[i], apiData[facilityModeNamee[i]]));
    }else{
      for(int i=0; i<9; i++)
      list.add(new Productivity(facilityModeName[i], apiData[facilityModeName[i]]));
    }
    

    return [
      new charts.Series(
        id: 'Tesis Verimliligi',
        domainFn: (Productivity productivity, _) => productivity.name,
        measureFn: (Productivity productivity, _) => productivity.value,
        data: list,
      )
    ];
  }
}

class Productivity {
  final String name;
  final int value;
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