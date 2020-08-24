import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import './notification.dart';
import './user_transactions.dart';
import 'GaugeChart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static var barchartdisplay;
  static var wbarchartdisplay;
  static var piechartdisplay;
  static var gaugechartdisplay;
  TabController tabController;
  TabController tabControllerup;
  String location = "Tesis 1";

  List<charts.Series<Task, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      new Task('Planlı', 3, Color(0xff3366cc)),
      new Task('Arıza', 1, Color(0xff3366cc)),
      new Task('Plansız', 4, Color(0xff3366cc)),
      new Task('Bilinmeyen', 2, Color(0xff3366cc)),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Tesis Verimliliği',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  List<charts.Series<GaugeSegment, String>> _seriesGaugeData;
  _generateGaugeData() {
    final gdata = [
      new GaugeSegment('Low', 75),
      new GaugeSegment('Acceptable', 100),
      new GaugeSegment('High', 50),
      new GaugeSegment('Highly Unusual', 5),
    ];

    _seriesGaugeData.add(
      charts.Series(
        data: gdata,
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        id: 'Çalışan Makine Sayısı',
      ),
    );
  }

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
      gaugechartdisplay = charts.PieChart(
        tseries,
        animationDuration: Duration(microseconds: 2000),
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 30,
          startAngle: 4 / 5 * 3.14,
          arcLength: 7 / 5 * 3.14,
        ),
      );
    });
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesGaugeData = List<charts.Series<GaugeSegment, String>>();
    _generateData();
    _generateGaugeData();
    tabController = TabController(length: 3, vsync: this);
    tabControllerup = TabController(length: 3, vsync: this);
  }

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
                              "Üretilen",
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
                                        "3.22",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        "Kalan Zaman",
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
                            ),
                          ),
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
                        child: gaugechartdisplay),
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
                        child: gaugechartdisplay),
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
          title: Text('$location'),
          leading: IconButton(
            icon: Icon(
              Icons.location_on,
              size: 36,
              color: Colors.white,
            ),
            onPressed: () {
              alertDialogshow(context);
            },
          ),
          centerTitle: true,
          bottom: TabBar(controller: tabControllerup, tabs: <Widget>[
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
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: <Widget>[
                  myradialItems(
                      Icons.graphic_eq, "Çalışan Makine Sayısı", 0xff7297ff),
                  mywbarItems(Icons.bookmark, "Toplam Üretim\nHatalı/Hatasız",
                      0xff7297ff),
                  mybarItems(Icons.notifications, "Toplam Üretim", 0xff7297ff),
                  myradialItemsP(
                      Icons.attach_money, "Hatalı Parça", 0xff7297ff),
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
            ),
            Container(
              child: PersonNotification(),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    UserTransactions(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue[600],
          unselectedLabelColor: Colors.blue,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.notifications),
            ),
            Tab(
              icon: Icon(Icons.message),
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  void alertDialogshow(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Bölge Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Tesis1"),
                value: "Tesis1",
              ),
              DropdownMenuItem(
                child: Text("Tesis2"),
                value: "Tesis2",
              ),
              DropdownMenuItem(
                child: Text("Tesis3"),
                value: "Tesis3",
              )
            ],
            onChanged: (String selected) {
              setState(() {
                location = selected;
              });
              debugPrint("$location");
            },
          ),
          actions: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Kapat"),
                  color: Colors.red,
                ),
              ],
            )
          ],
        );
      },
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
  double taskvalue;
  Color colorval;
  Task(this.task, this.taskvalue, this.colorval);
}

class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
/*


onTap: () {
                  alertDialogshow(context);
                },


         */
