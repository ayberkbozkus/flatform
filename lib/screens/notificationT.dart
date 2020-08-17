import 'package:flatform/screens/notification.dart';
import 'package:flatform/screens/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonNotificationT extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationTState();
  }
}

class _PersonNotificationTState extends State {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bildirimler'),
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
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20, 20, 150, 20),
                  child: Text('Kibana Çalışmayı Durdurdu 02.02.2020 10.30')),
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
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(20, 20, 130, 20),
                  child: Text('2. Makine Çalışmayı durdurdu 17.03.2020 10.30')),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10, 10),
              child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                      '8.45-8.50 arasında 1. makineden veri alınamadı. 24.03.2020 10.30')),
            ),
          ]),
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
