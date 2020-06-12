import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flatform'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40.0,0.0,40.0,40.0),
        margin: EdgeInsets.fromLTRB(50.0, 60.0, 50.0, 100.0),
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Flatform',
              style: TextStyle(
                color: Colors.blue,
                letterSpacing: 2.0,
                fontSize: 32.0,
              ),
              ),
          ),
          Container(
            child: Text('İsim'),
          ),
          Container(
          padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
          child: TextFormField(),
          ), //Text Input
          Container(
            child: Text('Soyisim'),
          ),
          Container(
          padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
          child: TextFormField(),
          ), //Text Input
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_box_outline_blank),
                  ),
                ),
                Container(
                  child: Text('Beni Hatırla1'),
                ),
              ],
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Giriş'),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Menü'),
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}
