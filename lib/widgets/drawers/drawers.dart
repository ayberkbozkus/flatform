import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainDrawer extends StatefulWidget {
  String location;
  bool selected;
  String tesis;
  int situation;
  Color themeColor;
  String makine;
  MainDrawer(
      this.themeColor, this.makine, this.selected, this.tesis, this.situation,
      {this.location = 'tesis1'});
  @override
  _MainDrawerState createState() => _MainDrawerState(
        themeColor,
        makine,
        selected,
        tesis,
        situation,
        location: location,
      );
}

class _MainDrawerState extends State<MainDrawer> {
  String location;
  bool selected;
  String tesis;
  int situation;
  Color themeColor;

  _getData(facility, location) async {
    String url = "http://45.130.13.92:4340/dash_api?section=5sec&device=mobile";
    var response = await http.get(url, headers: {"fluster": "fluster!2020"});
    Map<dynamic, dynamic> map = jsonDecode(response.body.toString());
    return map[facility]["machines"][location]["mode"];
  }

  _colorSelect(mode) async {
    if (mode == "Seri Üretim") {
      return Color(0xFF32cd32);
    } else if (mode == "Yarı Otomatik") {
      return Color(0xFFff8c00);
    } else if (mode == "Manuel") {
      return Color(0xFFccff00);
    } else if (mode == "Setup") {
      return Color(0xFF1e90ff);
    } else if (mode == "Bekleme") {
      return Color(0xFF21d6ff);
    } else if (mode == "Bakım") {
      return Color(0xFFff9292);
    } else {
      return Colors.blue;
    }
  }

  String makine;
  _MainDrawerState(
      this.themeColor, this.makine, this.selected, this.tesis, this.situation,
      {this.location = 'tesis1'});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Seçiniz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      location:
                      'Türkiye';
                      selected = false;
                      tesis = 'Tesis Seçiniz';
                      situation = 1;
                      themeColor = Colors.blue;
                    });
                  },
                  child: Image.asset(
                    'assets/icons/turkey.png',
                    width: 50,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    location = 'Romanya';
                    setState(() {
                      selected = null;
                      tesis = 'Tesis Seçiniz';
                      situation = 2;
                      themeColor = Colors.blue;
                    });
                  },
                  child: Image.asset(
                    'assets/icons/romania.png',
                    width: 50,
                  ),
                )
              ],
            ),
          ),
          selected != null
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: DropdownButton(
                    hint: Text(tesis),
                    items: [
                      DropdownMenuItem(
                        child: Text("T1"),
                        value: "T1",
                      ),
                      DropdownMenuItem(
                        child: Text("T2"),
                        value: "T2",
                      ),
                      DropdownMenuItem(
                        child: Text("T3"),
                        value: "T3",
                      )
                    ],
                    onChanged: (String value) {
                      setState(() {
                        tesis = value;
                        location = value;
                        selected = true;
                        makine = 'Makine Seçiniz';
                        situation = 3;
                        themeColor = Colors.blue;
                      });
                    },
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
          selected == true
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: DropdownButton(
                    hint: Text(makine),
                    items: [
                      DropdownMenuItem(
                        child: Text("E053"),
                        value: "E053",
                      ),
                      DropdownMenuItem(
                        child: Text("E114"),
                        value: "E114",
                      ),
                      DropdownMenuItem(
                        child: Text("E102"),
                        value: "E117",
                      ),
                      DropdownMenuItem(
                        child: Text("E059"),
                        value: "E059",
                      ),
                      DropdownMenuItem(
                        child: Text("E083"),
                        value: "E083",
                      ),
                      DropdownMenuItem(
                        child: Text("E096"),
                        value: "E096",
                      ),
                      DropdownMenuItem(
                        child: Text("E104"),
                        value: "E104",
                      ),
                      DropdownMenuItem(
                        child: Text("E109"),
                        value: "E109",
                      ),
                      DropdownMenuItem(
                        child: Text("E115"),
                        value: "E115",
                      ),
                      DropdownMenuItem(
                        child: Text("E009"),
                        value: "E009",
                      ),
                      DropdownMenuItem(
                        child: Text("E018"),
                        value: "E018",
                      ),
                      DropdownMenuItem(
                        child: Text("E034"),
                        value: "E034",
                      ),
                      DropdownMenuItem(
                        child: Text("E080"),
                        value: "E080",
                      )
                    ],
                    onChanged: (String value) {
                      setState(() {
                        makine = value;
                        location = value;
                        situation = 4;
                        debugPrint(makine + tesis);
                        themeColor =
                            _colorSelect(_getData(tesis, makine)) == null
                                ? Colors.red
                                : _colorSelect(_getData(tesis, makine));
                      });
                    },
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
        ],
      ),
    );
  }

  String hello() {
    return 'deneme';
  }
}
