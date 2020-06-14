import 'dart:ffi';

import 'package:flatform/screens/notification.dart';
import 'package:flatform/screens/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

/// Donut chart example. This is a simple pie chart with a hole in the middle.

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

class _HomeState extends State {
  List<charts.Series<Task, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      new Task('Work', 35.8, Color(0xff3366cc)),
      new Task('Eat', 8.3, Color(0xff990099)),
      new Task('Commute', 10.8, Color(0xff109618)),
      new Task('TV', 15.6, Color(0xfffdbe19)),
      new Task('Sleep', 19.2, Color(0xffff9900)),
      new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Dailiy Task',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        title: Text('Flatform Ana Sayfa'),
      ),
      body: Container(
        padding: EdgeInsets.all(1.0),
        color: Colors.grey[300],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(children: <Widget>[
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
                      margin: EdgeInsets.fromLTRB(0.0, 0, 10, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bubble_chart),
                      )),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                    child: new Container(
                      width: 150.0,
                      height: 50.0,
                      child: new Sparkline(
                        data: data,
                        pointsMode: PointsMode.all,
                        pointSize: 8.0,
                        pointColor: Colors.amber,
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(200, 60, 200, 60),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bubble_chart),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                child: Row(children: <Widget>[
                  Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
                      margin: EdgeInsets.fromLTRB(0.0, 0, 10, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.bubble_chart),
                      )),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70, 50, 70, 50),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bubble_chart),
                    ),
                  )
                ]),
              ), //Text Input
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: Row(children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    margin: EdgeInsets.fromLTRB(0.0, 0, 1, 0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Person()));
                      },
                      child: Text('Profil'),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonNotification()));
                      },
                      child: Text('Bildirimler'),
                    ),
                  )
                ]),
              ),
            ]),
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
