import 'package:flatform/screens/notification.dart';
import 'package:flatform/screens/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State {
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
        padding: EdgeInsets.all(1.0),
        color: Colors.grey[300],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                margin: EdgeInsets.fromLTRB(0,10,0,0),
                child: Row(children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70,50,70,50),
                    margin: EdgeInsets.fromLTRB(0.0,0,10,0),
                    child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart),)
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70,50,70,50),
                    child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart),)
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(200,60,200,60),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart),)
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                child: Row(children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70,50,70,50),
                    margin: EdgeInsets.fromLTRB(0.0,0,10,0),
                    child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart),)
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70,50,70,50),
                    child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bubble_chart),
                  ),)
                ]),
              ), //Text Input
              Container(
                padding: EdgeInsets.fromLTRB(10.0,0,10,10),
                margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
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
