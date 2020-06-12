import 'package:flatform/screens/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    onPressed: () {},
                    child: Text('Önceliğe Göre'),
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40,10,40,10),
                    child: RaisedButton(
                    onPressed: () {},
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
                    '8.45-8.50 arasında 1. makineden veri alınamadı.'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.fromLTRB(75,20,75,20),
                  child: Text(
                    '2. Makine Çalışmayı durdurdu'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(100,20,100,20),
                  child: Text(
                    'Kibana Belleği Doldu'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.fromLTRB(85,20,85,20),
                  child: Text(
                    'Kibana Çalışmayı Durdurdu'
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                margin: EdgeInsets.fromLTRB(0, 150.0, 0, 0),
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
