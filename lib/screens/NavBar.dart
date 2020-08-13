import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var barchartdisplay;
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
      var series = [
        charts.Series(
          domainFn: (addCharts addCharts, _) => addCharts.label,
          measureFn: (addCharts addCharts, _) => addCharts.values,
          id: 'addcharts',
          data: data,
        ),
      ];
      barchartdisplay = charts.BarChart(
        series,
        animationDuration: Duration(microseconds: 2000),
      );
      piechartdisplay = charts.PieChart(
        series,
        animationDuration: Duration(microseconds: 2000),
      );
    });
  }

  var data = [0.0, 1.0, 1.5, 2.0];
  int _currentIndex = 0;
  Material myItems(IconData icon, String heading, int color) {
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
                          height: 200,
                          width: 200,
                          child: piechartdisplay,
                        ),
                      ),
                      Center(
                        child: Text("denemedenemedeneme"),
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
            myItems(Icons.graphic_eq, "Çalışan Makine Sayısı", 0xff7297ff),
            myItems(Icons.bookmark, "Toplam Üretim Hatalı/Hatasız", 0xff7297ff),
            myItems(Icons.notifications, "Toplam Üretim", 0xff7297ff),
            myItems(Icons.attach_money, "Hatalı Parça", 0xff7297ff),
            myItems(Icons.settings, "Tesis Verimliliği", 0xff7297ff),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 250.0),
            StaggeredTile.extent(2, 250.0),
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
              icon: Icon(Icons.person),
              title: Text('Profil'),
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
