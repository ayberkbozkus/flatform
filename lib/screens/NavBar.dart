import 'package:flatform/config/styles.dart';
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
  static var donutchartdisplay;
  String location = "Tesis 1";
  TabController tabController;

  var headerAppBar;

  List<charts.Series<Task, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      new Task('Planlı', 3, Color(0xff3366cc)),
      new Task('Arıza', 1, Color(0xff3366cc)),
      new Task('Plansız', 4, Color(0xff3366cc)),
      new Task('Bilinmeyen', 2, Color(0xff3366cc)),
    ];
    var donutData = [
      new Task('Planlı', 3, Color(0xff3366cc)),
      new Task('Bilinmeyen', 2, Color(0xff3366cc)),
    ];
    var gaugeData = [
      new Task('Planlı', 3, Color(0xff3366cc)),
      new Task('Arıza', 1, Color(0xff3366cc)),
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

  List<charts.Series<Task, String>> _seriesGaugeData;
  _generateGaugeData() {
    var gaugeData = [
      new Task('Planlı', 3, Color(0xff3366cc)),
      new Task('Arıza', 1, Color(0xff3366cc)),
    ];
    _seriesGaugeData.add(
      charts.Series(
        data: gaugeData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Çalışan Makine Sayısı',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  List<charts.Series<Task, String>> _seriesDonutData;
  _generateDonutData() {
    var donutData = [
      new Task('Planlı', 18, Color(0xff3366cc)),
      new Task('Arıza', 80, Color(0xff3366cc)),
    ];
    _seriesDonutData.add(
      charts.Series(
        data: donutData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Çalışan Makine Sayısı',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  void initState() {
    setState(
      () {
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
          addCharts("Planlı", 13),
          addCharts("Plansız", 23),
          addCharts("Arıza", 27),
          addCharts("Bilinmeyen", 9),
        ];
        var gdata = [
          addCharts("Hatalı", 13),
          addCharts("Hatasız", 23),
        ];
        var ddata = [
          addCharts("Çalışan", 18),
          addCharts("Çalışmayan", 80),
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
        var gseries = [
          charts.Series(
            domainFn: (addCharts addCharts, _) => addCharts.label,
            measureFn: (addCharts addCharts, _) => addCharts.values,
            id: 'gaddcharts',
            data: gdata,
          ),
        ];
        var dseries = [
          charts.Series(
            domainFn: (addCharts addCharts, _) => addCharts.label,
            measureFn: (addCharts addCharts, _) => addCharts.values,
            id: 'gaddcharts',
            data: ddata,
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
          behaviors: [
            new charts.DatumLegend(
              desiredMaxRows: 2,
              desiredMaxColumns: 2,
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 8,
              ),
            )
          ],
        );
        gaugechartdisplay = charts.PieChart(
          gseries,
          animationDuration: Duration(microseconds: 2000),
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 30,
            startAngle: 9 / 10 * 3.14,
            arcLength: 6 / 5 * 3.14,
          ),
          behaviors: [
            new charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 8,
              ),
            )
          ],
        );
        donutchartdisplay = charts.PieChart(
          dseries,
          animationDuration: Duration(microseconds: 2000),
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 30,
          ),
          behaviors: [
            new charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 8,
              ),
            ),
          ],
        );
      },
    );
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesGaugeData = List<charts.Series<Task, String>>();
    _seriesDonutData = List<charts.Series<Task, String>>();
    _generateData();
    _generateGaugeData();
    _generateDonutData();
    tabController = TabController(length: 3, vsync: this);
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
                              "Planlanan",
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
                                            fontSize: 24,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Üretilen",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
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
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  "Kalan Zaman",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
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
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            "Gereken Zaman",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                        height: 160,
                        width:
                            160, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    donutchartdisplay   gaugechartdisplay
                        child: donutchartdisplay),
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
                        height: 160,
                        width:
                            160, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay    donutchartdisplay   gaugechartdisplay
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
                        height: 160,
                        width:
                            160, //piechartdisplay    barchartdisplay     sfRadialGaugedisplay
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

  Material myTabBar() {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.white54,
                      child: Text(
                        "Günlük",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.white54,
                      child: Text(
                        "Haftalık",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FlatButton(
                      onPressed: () {},
                      color: Colors.white54,
                      child: Text(
                        "Aylık",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
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
        appBar: headerAppBar = AppBar(
          title: Text('$location'),
          centerTitle: true,
        ),
        drawer: new Drawer(
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
              new ListTile(
                title: new Text(
                  "Ülke",
                ),
                onTap: () {
                  alertDialogshowCountry(context);
                },
              ),
              new ListTile(
                title: new Text("Tesis"),
                onTap: () {
                  alertDialogshowFacility(context);
                },
              ),
              new ListTile(
                title: new Text("Makine"),
                onTap: () {
                  alertDialogshowMachine(context);
                },
              ),
              new ListTile(
                title: new Text("Kalıp"),
                onTap: () {
                  alertDialogshowMold(context);
                },
              )
            ],
          ),
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
                  myTabBar(),
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
                  StaggeredTile.extent(2, 40.0),
                  StaggeredTile.extent(1, 220.0),
                  StaggeredTile.extent(1, 220.0),
                  StaggeredTile.extent(2, 200.0),
                  StaggeredTile.extent(1, 220.0),
                  StaggeredTile.extent(1, 220.0),
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

  void alertDialogshowCountry(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Ülke Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Turkiye"),
                value: "Turkiye",
              ),
              DropdownMenuItem(
                child: Text("Romanya"),
                value: "Romanya",
              ),
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
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowFacility(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Tesis Seçiniz"),
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
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowMachine(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Makine Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Makine1"),
                value: "Makine1",
              ),
              DropdownMenuItem(
                child: Text("Makine2"),
                value: "Makine2",
              ),
              DropdownMenuItem(
                child: Text("Makine3"),
                value: "Makine3",
              ),
              DropdownMenuItem(
                child: Text("Makine4"),
                value: "Makine4",
              ),
              DropdownMenuItem(
                child: Text("Makine5"),
                value: "Makine5",
              ),
              DropdownMenuItem(
                child: Text("Makine6"),
                value: "Makine6",
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
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void alertDialogshowMold(BuildContext ctx) {
    showDialog(
      context: ctx,
      // barrierDismissible: true, // dışarıya tıklayınca kapatma
      builder: (ctx) {
        return AlertDialog(
          title: Text("Kalıp Seçiniz"),
          content: DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Kalıp1"),
                value: "Kalıp1",
              ),
              DropdownMenuItem(
                child: Text("Kalıp2"),
                value: "Kalıp2",
              ),
              DropdownMenuItem(
                child: Text("Kalıp3"),
                value: "Kalıp3",
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
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("Tamam"),
                  color: Colors.green,
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
