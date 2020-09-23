import 'package:flatform/screens/landing_page.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flatform/tabBar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './notification.dart';
import './user_transactions.dart';
import '../functions/function.dart';
import 'MaterialItems.dart';



class HomePage extends StatefulWidget {
  final AuthBase authService;
  final Function onSignOut;

  const HomePage({Key key,@required this.authService, this.onSignOut}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  static var barchartdisplay;
  static var gaugechartdisplayenergy;
  static var piechartdisplay;
  static var gaugechartdisplay;
  static var donutchartdisplay;

  String location = "Tesis 1";
  String tesis = 'Tesis Seçin';
  String makine = 'Makine Seçin';
  int situation = 0;
  Color themeColor = Colors.blue;
  bool selected;
  TabController tabController;

  var headerAppBar;

  List<charts.Series<Task, String>> _seriesPieData;

  

  
  _generateData() {
    var pieData = [
      new Task('Planlı', 3,),
      new Task('Arıza', 1,),
      new Task('Plansız', 4,),
      new Task('Bilinmeyen', 2),
    ];
    var donutData = [
      new Task('Planlı', 3,),
      new Task('Bilinmeyen', 2,),
    ];
    var gaugeData = [
      new Task('Planlı', 3,),
      new Task('Arıza', 1,),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
        id: 'Tesis Verimliliği',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  List<charts.Series<Task, String>> _seriesGaugeData;
  _generateGaugeData() {
    var gaugeData = [
      new Task('Planlı', 3,),
      new Task('Arıza', 1,),
    ];
    _seriesGaugeData.add(
      charts.Series(
        data: gaugeData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
        id: 'Çalışan Makine Sayısı',
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  List<charts.Series<Task, String>> _seriesDonutData;
  _generateDonutData() {
    var donutData = [
      new Task('Planlı', 18,),
      new Task('Arıza', 80,),
    ];
    _seriesDonutData.add(
      charts.Series(
        data: donutData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
        
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
          addCharts("Hatalı", 7),
          addCharts("Hatasız", 33),
        ];
        var edata = [
          addCharts("Tüketim", 33),
          addCharts("Toplam", 23),
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
        var eseries = [
          charts.Series(
            domainFn: (addCharts addCharts, _) => addCharts.label,
            measureFn: (addCharts addCharts, _) => addCharts.values,
            id: 'eaddcharts',
            data: edata,
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
        gaugechartdisplay = Stack(children : [charts.PieChart(
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
        ),Center(
        child: Container(
          margin: EdgeInsets.only(bottom:25),
          child: Text(
            "34",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),]);
        gaugechartdisplayenergy = Stack(
                  children: [ charts.PieChart(
            eseries,
            animationDuration: Duration(microseconds: 2000),
            defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 20,
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
          ),
          Center(

        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(bottom: 15,),
              child: Text(
                "200",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text('Teorik Tüketim 200kwh',
                style: TextStyle(
                  fontSize: 9.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),)
          ],
        ),
      ),
          ],
        );
        donutchartdisplay = Stack(children:[charts.PieChart(
          dseries,
          animationDuration: Duration(microseconds: 2000),
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 25,
          ),
          behaviors: [
            new charts.DatumLegend(
              position: charts.BehaviorPosition.bottom,
              entryTextStyle: charts.TextStyleSpec(
                fontSize: 8,
              ),
            ),
          ],
        ),
        Center(
        child: Container(
          margin: EdgeInsets.only(bottom:25),
          child: Text(
            "8",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      )]); 
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

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
theme: ThemeData(

    primaryColor: themeColor,
    accentColor: themeColor,),
              home: Scaffold(
          appBar: headerAppBar = AppBar(
            title: Text('$location'),
            centerTitle: true,
            actions: [IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {

              widget.authService.signOut();
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LandingPage(authService: widget.authService,),
              ),
            ); 
            })],
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
                
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(onPressed: () {
                        location = 'Türkiye';
                        setState(() {
                          selected = false;
                          tesis = 'Tesis Seçiniz';
                          situation = 1;
                          themeColor = Colors.blue;
                        });
                      }, child: Image.asset('assets/icons/turkey.png', width: 50,),),
                      FlatButton(onPressed: () {
                        location = 'Romanya';
                        setState(() {
                          selected = null;
                          tesis = 'Tesis Seçiniz';
                          situation = 2;
                          themeColor = Colors.blue;
                        });
                        
                      }, child: Image.asset('assets/icons/romania.png', width: 50,),)
                    ],
                  ),
                ),
                selected != null ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
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
                            ): Padding(padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),),
                selected == true ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: DropdownButton(
                                hint: Text(makine),
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
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine7"),
                                    value: "Makine7",
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Makine8"),
                                    value: "Makine8",
                                  )
                                ],
                                onChanged: (String value) {
                                  setState(() {
                                    makine = value;
                                    location = value;
                                    situation = 4;
                                    switch(makine) { 
                                      case 'Makine1': { 
                                          themeColor = Colors.green;
                                      } 
                                      break; 
                                      
                                      case 'Makine2': { 
                                          themeColor = Colors.grey;
                                      } 
                                      break; 

                                      case 'Makine3': { 
                                          themeColor = Colors.red;
                                      } 
                                      break; 
                                          
                                      default: { 
                                          themeColor = Colors.blue;
                                      }
                                      break; 
                                    } 
                                  });
                                },
                              ),
                            ): Padding(padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),),
                
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
                   // String heading, Color themeColor, Stack piechartdisplay, int situation
                    myradialItems(
                        "Çalışan Makine Sayısı", themeColor, donutchartdisplay, situation, context),
                    mywbarItems("Enerji Tüketimi", themeColor, gaugechartdisplayenergy, situation, context),
                    mybarItems("Toplam Üretim", themeColor, barchartdisplay, situation, context),
                    myradialItemsP("Hatalı Parça", themeColor, gaugechartdisplay, situation, context),
                    mypieItems("Tesis Verimliliği", themeColor, piechartdisplay, situation, context),
                  ],
                  staggeredTiles: [
                    
                    StaggeredTile.extent(1, 220.0),
                    StaggeredTile.extent(1, 220.0),
                    StaggeredTile.extent(2, 240.0),
                    StaggeredTile.extent(1, 280.0),
                    StaggeredTile.extent(1, 280.0),
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
          bottomNavigationBar: TabBars(tabController, themeColor),
          backgroundColor: Colors.grey[200],
        ),
      ),
    );
  }
  Future<bool> _logOut( ) async {
    bool result = await widget.authService.signOut();
    widget.onSignOut();
    return result;
  }
}
/*


onTap: () {
                  alertDialogshow(context);
                },


         */
