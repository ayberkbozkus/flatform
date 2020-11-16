import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flatform/functions/function.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Material totalManufacturingItems(String heading, Color themeColor,
    int situation, BuildContext ctx, String location) {
  return Material(
    color: Colors.grey[50],
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Center(
                  child: new Container(
                      height: 140,
                      width:
                          340, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                      child: totalmanufacturingChart(location)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material energyItems(String heading, Color themeColor, int situation,
    BuildContext ctx, String location) {
  return Material(
    color: Colors.grey[50],
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Center(
                  child: new Container(
                      height: 160,
                      width: 150,
                      //piechartdisplay    barchartdisplay  wbarchartdisplay
                      child: energychartselector(location)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Material workingSituationItems(String heading, Color themeColor, int situation,
    BuildContext ctx, String location) {
  return Material(
    color: situation == 4 ? Colors.transparent : Colors.grey[50],
    elevation: situation == 4 ? 0 : 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            situation == 4
                ? Column(children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                            elevation: 5,
                            shadowColor: themeColor,
                            color: themeColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 14),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Kalıp No',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      'EK' + mold,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                          elevation: 5,
                          shadowColor: themeColor,
                          color: themeColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    'Toplam Parça Sayısı',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    partCount,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(ctx).size.width / 2.3,
                        child: Card(
                            elevation: 5,
                            shadowColor: themeColor,
                            color: themeColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 14),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Ortalama Çevrim',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      averageMold,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // text
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          heading,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      //Icon

                      Center(
                        child: new Container(
                            height: 160,
                            width:
                                160, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    donutchartdisplay   gaugechartdisplay
                            child: workingsituationchartselector(location)),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    ),
  );
}

Material productivityItems(
    String heading, Color themeColor, int situation, ctx, String location) {
  return Material(
    color: Colors.grey[50],
    elevation: 5.0,
    shadowColor: themeColor,
    borderRadius: BorderRadius.circular(10.0),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                //Icon

                Center(
                  child: new Container(
                      height: 190,
                      width:
                          350, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                      child: productivitychartselector(location)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

String mold = '2888';
String averageMold = '113.51';
String partCount = '232';
_getData(location, sit) async {
  String url = "http://45.130.13.92:4340/dash_api?section=5min&device=mobile";
  var response = await http.get(url, headers: {"fluster": "fluster!2020"});
  Map<dynamic, dynamic> map = jsonDecode(response.body.toString());

  if (sit == '2888') {
    return map["Turkey"]['facilities']["T1"]['machines'][location]["lastMold"]
        .toString();
  } else if (sit == '113.51') {
    return map['fakeapi'][0]['T1']['machines'][location]['cycleMeanMold']
        .toString();
  } else {
    return map['fakeapi'][0]['T1']['machines'][location]['partCount']['mold']
        .toString();
  }
}
