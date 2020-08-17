import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notificationT.dart';

class PersonNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationState();
  }
}

class _PersonNotificationState extends State {
  int _currentIndex = 0;

  Material mybarItems(String boxtext, String heading, int color) {
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
                      //piechartdisplay    barchartdisplay     sfRadialGaugedisplay      wbarchartdisplay
                      child: Text(boxtext),
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
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('flatform Ana Sayfa'),
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(1, 10, 1, 1),
          color: Colors.grey[300],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  margin: EdgeInsets.fromLTRB(0.0, 0, 1, 0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonNotificationT()));
                    },
                    child: Text('Önceliğe Göre'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonNotification()));
                    },
                    child: Text('Tarihe Göre'),
                  ),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                      '8.45-8.50 arasında 1. makineden veri alınamadı. 24.03.2020 10.30')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(20, 20, 130, 20),
                  child: Text('2. Makine Çalışmayı durdurdu 17.03.2020 10.30')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(20, 20, 180, 20),
                  child: Text('Kibana Belleği Doldu 24.02.2020 10.30')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20, 20, 150, 20),
                  child: Text('Kibana Çalışmayı Durdurdu 02.02.2020 10.30')),
            ),
          ]),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            mybarItems("Icons.graphic_eq", "Çalışan Makine Sayısı", 0xff7297ff),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 220.0),
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
