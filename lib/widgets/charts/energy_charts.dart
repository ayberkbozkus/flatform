
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
  static String daily;

  _getData() async {

    if (location.startsWith('Tür')|location.startsWith('Ro')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    daily = map['fakeapi'][0][location]['Energy']['Günlük'].toString();
    return map['fakeapi'][0][location]['Energy'];
    }else if (location.startsWith('T')) {
    facilty = location;
    final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    daily = map['fakeapi'][0][location]['Energy']['Günlük'].toString();
    return map['fakeapi'][0][location]['Energy'];
    } else {
      final response = await http.get(
      'http://flatformapi.herokuapp.com/users/fakeapi');
    Map<dynamic,dynamic> map = jsonDecode(response.body.toString());
    daily = map['fakeapi'][0][facilty]['machines'][location]['Energy']['Günlük'].toString();
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
              return Stack(children: [
                new charts.PieChart(
                  dataList(snapshot.data),
                  defaultRenderer:  new charts.ArcRendererConfig(
                    arcWidth: 20,
                    startAngle: 9 / 10 * 3.14,
                    arcLength: 6 / 5 * 3.14,
                      ),
                      behaviors: [
            
          ],
              ),
              Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:100),
              child: Text(
                'Günlük Ortalama',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:0),
              child: Text(
                daily+' kwh/saat',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:0),
              child: Text(
                'Haftalık Ortalama',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:0),
              child: Text(
                daily+' kwh/saat',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
              ]);
              
            else
              return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  

  static List<charts.Series<Productivity, dynamic>> dataList(Map<dynamic, dynamic> apiData) {
    List<Productivity> list = new List();

    for(int i=0; i<1; i++){
      list.add(new Productivity(productivityModeName[i], apiData[productivityModeName[i]]) );
      list.add(new Productivity(productivityModeName[i+1], 600-apiData[productivityModeName[i]]) );
    }
      

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