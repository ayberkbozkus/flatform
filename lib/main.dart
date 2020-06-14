import 'package:flatform/screens/home.dart';
import 'package:flatform/screens/person.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

void main() => runApp(MaterialApp(
      home: Login(),
    ));

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 40.0),
        margin: EdgeInsets.fromLTRB(50.0, 90.0, 50.0, 180.0),
        color: Colors.grey[300],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  'Flatform',
                  
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: '@farplas.com',
                    labelText: 'Mail *',
                  ),
                ),
              ), //Text Input

              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                ),
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
                      child: Text('Beni Hatırla'),
                    ),
                  ],
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Text('Giriş'),
                ),
              ),
            ]),
      ),
    );
  }
}
