import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var barchartdisplay;
  static var wbarchartdisplay;
  static var piechartdisplay;
  void initState() {
    setState(() {
      var data = [
        addCharts("1", 13),
        addCharts("2", 23),
        addCharts("3", 27),
        addCharts("4", 9),
        addCharts("5", 17),
        addCharts("6", 31),
        addCharts("7", 18),
        addCharts("8", 25),
        addCharts("9", 15),
        addCharts("10", 25),
        addCharts("11", 12),
        addCharts("12", 35),
      ];
      var tdata = [
        addCharts("1", 13),
        addCharts("2", 23),
        addCharts("3", 27),
        addCharts("4", 9),
        addCharts("5", 17),
      ];
      var wdata = [
        addCharts("P", 13),
        addCharts("S", 23),
        addCharts("C", 27),
        addCharts("P", 9),
        addCharts("C", 17),
        addCharts("C", 31),
        addCharts("P", 18),
      ];
      var series = [
        charts.Series(
          domainFn: (addCharts addCharts, _) => addCharts.label,
          measureFn: (addCharts addCharts, _) => addCharts.values,
          id: 'addcharts',
          data: data,
        ),
      ];
      var wseries = [
        charts.Series(
          domainFn: (addCharts addCharts, _) => addCharts.label,
          measureFn: (addCharts addCharts, _) => addCharts.values,
          id: 'waddcharts',
          data: wdata,
        ),
      ];
      var tseries = [
        charts.Series(
          domainFn: (addCharts addCharts, _) => addCharts.label,
          measureFn: (addCharts addCharts, _) => addCharts.values,
          id: 'taddcharts',
          data: tdata,
        ),
      ];
      barchartdisplay = charts.BarChart(
        series,
        animationDuration: Duration(microseconds: 2000),
      );
      wbarchartdisplay = charts.BarChart(
        wseries,
        animationDuration: Duration(microseconds: 2000),
      );
      piechartdisplay = charts.PieChart(
        tseries,
        animationDuration: Duration(microseconds: 2000),
      );
    });
  }

  Widget sfRadialGaugedisplay = SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 80,
        interval: 10,
        ranges: <GaugeRange>[
          GaugeRange(
            startValue: 0,
            endValue: 25,
            color: Colors.orange,
          ),
          GaugeRange(
            startValue: 25,
            endValue: 55,
            color: Colors.yellow,
          ),
          GaugeRange(
            startValue: 55,
            endValue: 80,
            color: Colors.green,
          ),
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
            value: 12,
            enableAnimation: true,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Text(
              "12",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            positionFactor: 0.5,
            angle: 90,
          )
        ],
      ),
    ],
  );

  Widget sfRadialGaugedisplayP = SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 300,
        interval: 50,
        ranges: <GaugeRange>[
          GaugeRange(
            startValue: 0,
            endValue: 50,
            color: Colors.green,
          ),
          GaugeRange(
            startValue: 50,
            endValue: 100,
            color: Colors.yellow,
          ),
          GaugeRange(
            startValue: 100,
            endValue: 150,
            color: Colors.orange,
          ),
          GaugeRange(
            startValue: 150,
            endValue: 300,
            color: Colors.red,
          ),
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
            value: 42,
            enableAnimation: true,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Text(
              "42",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            positionFactor: 0.5,
            angle: 90,
          )
        ],
      ),
    ],
  );

  var data = [0.0, 1.0, 1.5, 2.0];
  int _currentIndex = 0;

  Material mybarItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blue[200],
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
                  Row(
                    children: <Widget>[
                      Center(
                        child: new Container(
                            height: 150,
                            width:
                                200, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                            child: barchartdisplay),
                      ),
                      Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "42.332 adet",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Toplam",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          Center(
                              child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "%69",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Üretilen",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "3.22",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "Gereken Zaman",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mywbarItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blue[200],
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
                        height: 150,
                        width: 150,
                        //piechartdisplay    barchartdisplay     sfRadialGaugedisplay      wbarchartdisplay
                        child: wbarchartdisplay),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myradialItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blue[200],
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
                        height: 150,
                        width:
                            150, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    sfRadialGaugedisplayP
                        child: sfRadialGaugedisplay),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myradialItemsP(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blue[200],
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
                        height: 150,
                        width:
                            150, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    sfRadialGaugedisplayP
                        child: sfRadialGaugedisplayP),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mypieItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.blue[200],
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
                        height: 150,
                        width:
                            150, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
                        child: piechartdisplay),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flatform - Tesis 1'),
          centerTitle: true,
          bottom: TabBar(tabs: <Widget>[
            Tab(
              text: 'Günlük',
            ),
            Tab(
              text: 'Haftalık',
            ),
            Tab(
              text: 'Aylık',
            ),
          ]),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            myradialItems(
                Icons.graphic_eq, "Çalışan Makine Sayısı", 0xff7297ff),
            mywbarItems(
                Icons.bookmark, "Toplam Üretim\nHatalı/Hatasız", 0xff7297ff),
            mybarItems(Icons.notifications, "Toplam Üretim", 0xff7297ff),
            myradialItemsP(Icons.attach_money, "Hatalı Parça", 0xff7297ff),
            mypieItems(Icons.settings, "Tesis Verimliliği", 0xff7297ff),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 220.0),
            StaggeredTile.extent(1, 220.0),
            StaggeredTile.extent(2, 200.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(1, 200.0),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Anasayfa'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Bildirimler'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('Mesajlar'),
              backgroundColor: Colors.blue,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class addCharts {
  final String label;
  final int values;
  addCharts(this.label, this.values);
}

class Task {
  String task;
  String taskvalue;
  Color colorval;
  Task(this.task, this.taskvalue, this.colorval);
}
