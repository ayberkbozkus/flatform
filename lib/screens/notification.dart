import 'package:flatform/screens/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notificationT.dart';

class PersonNotification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonNotificationState();
          }
        
        }
    
    class _PersonNotificationState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('flatform Ana Sayfa'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(1,10,1,1),
        color: Colors.grey[300],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0,0,0,20),
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(40,10,40,10),
                    margin: EdgeInsets.fromLTRB(0.0,0,1,0),
                    child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonNotificationT()));
                    },
                    child: Text('Önceliğe Göre'),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40,10,40,10),
                    child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonNotification()));
                      
                    },
                    child: Text('Tarihe Göre'),
                  ),)
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(20,20,20,20),
                  child: Text(
                    '8.45-8.50 arasında 1. makineden veri alınamadı. 24.03.2020 10.30'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(20,20,130,20),
                  child: Text(
                    '2. Makine Çalışmayı durdurdu 17.03.2020 10.30'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(20,20,180,20),
                  child: Text(
                    'Kibana Belleği Doldu 24.02.2020 10.30'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(20,20,150,20),
                  child: Text(
                    'Kibana Çalışmayı Durdurdu 02.02.2020 10.30'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                margin: EdgeInsets.fromLTRB(0, 80.0, 0, 0),
                child: Row(children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50,10,50,10),
                    margin: EdgeInsets.fromLTRB(0.0,0,1,0),
                    child: RaisedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Person()));},
                    child: Text('Profil'),
                  ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50,10,50,10),
                    child: RaisedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonNotification()));},
                    child: Text('Bildirimler'),
                  ),)
                ]),
              ),
            ]),
      ),
    );
  }
}