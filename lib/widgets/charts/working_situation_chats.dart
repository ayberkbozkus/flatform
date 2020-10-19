import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorkingSituationChart extends StatelessWidget {
  final String location;
  
  const WorkingSituationChart({Key key, this.location}) : super(key: key);

  static Map<dynamic, String> productivityModeName = {0: 'Çalışan', 1: 'Toplam'} ;
  static Map<dynamic, String> productivityModeCharacters = {0: 'Ç', 1: 'T'} ;

  static String facilty;

  _getData() async {

    if (location.startsWith('Tür')|location.startsWith('Ro')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][location]['workmachines'].toString());
    return map['fakeapi'][0][location]['workmachines'];
    }else if (location.startsWith('T')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][location]['workmachines'].toString());
    return map['fakeapi'][0][location]['machines']['workmachines'];
    } else {
      final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    debugPrint(map['fakeapi'][0][facilty]['machines'][location]['modePerc'].toString());
    return map['fakeapi'][0]['Türkiye'];
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
  final int value;
  Productivity(this.name, this.value);
}
