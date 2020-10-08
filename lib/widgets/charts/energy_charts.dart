
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnergyChart extends StatelessWidget {

  final String location;
  
  const EnergyChart({Key key, this.location}) : super(key: key);

  static Map<dynamic, String> productivityModeName = {0: 'Günlük', 1: 'Haftalık'} ;
  static Map<dynamic, String> productivityModeCharacters = {0: 'D', 1: 'W'} ;

  static String facilty;

  _getData() async {

    if (location.startsWith('Tür')|location.startsWith('Ro')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][location]['Energy'].toString());
    return map['fakeapi'][0][location]['Energy'];
    }else if (location.startsWith('T')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][location]['Energy'].toString());
    return map['fakeapi'][0][location]['Energy'];
    } else {
      final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][facilty]['machines'][location]['Energy'].toString());
    return map['fakeapi'][0][facilty]['machines'][location]['Energy'];
    }
    
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
                    arcWidth: 20,
                    startAngle: 9 / 10 * 3.14,
                    arcLength: 6 / 5 * 3.14,
                      arcRendererDecorators: [new charts.ArcLabelDecorator()]),
                      behaviors: [
            new charts.DatumLegend(
              desiredMaxRows: 5,
              desiredMaxColumns: 2,
              position: charts.BehaviorPosition.bottom,
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

    for(int i=0; i<2; i++)
      list.add(new Productivity(productivityModeName[i], apiData[productivityModeName[i]]));

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