import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnergyChart extends StatelessWidget {
  final String location;

  const EnergyChart({Key key, this.location}) : super(key: key);
  static Map<dynamic, String> productivityModeName = {
    0: 'Günlük',
    1: 'Haftalık'
  };
  static Map<dynamic, String> productivityModeCharacters = {0: 'D', 1: 'W'};
  static String facilty;
  static String country;
  static String daily;

  Future _api() async {
    String url = "http://45.130.13.92:4340/dash_api?section=5min&device=mobile";
    var response = await http.get(url, headers: {"fluster": "fluster!2020"});
    Map<dynamic, dynamic> test = json.decode(response.body);
    if (location.startsWith('Tür') | location.startsWith('Ro')) {
      country = "Turkey";

      if (response.statusCode == 200) {
        return test[location]["energy"];
      } else {
        throw Exception("Not response ${response.statusCode}");
      }
    } else if (location.startsWith('T')) {
      facilty = location;
      if (response.statusCode == 200) {
        return test[country][facilty]["energy"];
      } else {
        throw Exception("Not response ${response.statusCode}");
      }
    } else {
      if (response.statusCode == 200) {
        var value = test[country][facilty]["machines"][location]["energy"];
        Map<String, dynamic> machineEnergy = {
          "dailyMean": value["energyMeanDay"],
          "weeklyMean": value["energyMeanInterval"]
        };
        return machineEnergy;
      } else {
        throw Exception("Not response ${response.statusCode}");
      }
    }
  }

  // void initState() {
  //   super.initState();
  //   _api().then((value) {
  //     var data = value;
  //     debugPrint(data.toString());
  //   });
  // }

  static String weakly;

  _getData() async {
    String url = "http://45.130.13.92:4340/dash_api?section=5min&device=mobile";
    var response = await http.get(url, headers: {"fluster": "fluster!2020"});
    Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
    if (location.startsWith('Tür') | location.startsWith('Ro')) {
      country = "Turkey";
      return map[country]["energy"];
    } else if (location.startsWith('T')) {
      facilty = location;
      return map[country]["facilities"][facilty]["energy"];
    } else {
      return map[country]["facilities"][facilty]["machines"][location];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Stack(children: [
            new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'Günlük Ortalama',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data["dailyMean"] != null
                              ? snapshot.data["dailyMean"].toString()
                              : snapshot.data["energyMeanDay"].toString(),
                          style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '  kWh/saat',
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Haftalık Ortalama',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Text(
                      '${snapshot.data["weeklyMean"] != null ? snapshot.data["dailyMean"].toString() : snapshot.data["energyMeanInterval"].toString()} kwh/saat',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
