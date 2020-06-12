import 'package:flatform/screens/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Person extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonState();
  }
}

class _PersonState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('flatform Profil'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(165.0, 10.0, 50.0, 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 40.0),
            margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
            color: Colors.grey[300],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0),
                    child: Text(
                      'Ahmet Gönen',
                      style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 2.0,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(60.0, 10.0, 20.0, 20),
                    child: Text('Sistem Yöneticisi'),
                  ),
                  Container(
                    child: Text('Eposta'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: TextFormField(),
                  ), //Text Input
                  Container(
                    child: Text('Telefon'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: TextFormField(),
                  ),
                  Container(
                    child: Text('Ünvan'),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: TextFormField(),
                  ),
                  Container(
                padding: EdgeInsets.fromLTRB(10.0,20,10,10),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(160,0,160,50),
                  
                ),
              ),
                ]),
          ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
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
              ),]));
  }
}
