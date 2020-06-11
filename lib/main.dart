import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flatform1'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        margin: EdgeInsets.fromLTRB(50.0, 60.0, 50.0, 100.0),
        color: Colors.grey[400],
        child: Column(children: <Widget>[
          Container(
            child: Text('Flatform'),
          ),
          Container(
            child: Text('İsim'),
          ),
          Container(), //Text Input
          Container(
            child: Text('Soyisim'),
          ),
          Container(), //Text Input
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
                  child: Text('Beni Hatırla'),
                ),
              ],
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              child: Text('Giriş1S'),
            ),
          ),
          //Container(child: Image.network('https://images.unsplash.com/photo-1531292843150-25556cdc7976?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'))
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
