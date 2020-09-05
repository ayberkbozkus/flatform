import 'package:flatform/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;

class RemoteApi extends StatefulWidget {
  @override
  _RemoteApiState createState() => _RemoteApiState();
}

Ticket deneme;

class _RemoteApiState extends State<RemoteApi> {
  @override
  Widget build(BuildContext context) {
    Future<Ticket> _takeTicket() async {
      var response = await http.get("http://flatformapi.herokuapp.com/users/");
      if (response.statusCode == 200) {
        debugPrint("stattus code 200 okundu");
        return Ticket.fromJsonMap(json.decode(response.body));
      } else {
        throw Exception("Bağlanamadık ${response.statusCode}");
      }
    }

    @override
    void initState() {
      super.initState();
      _takeTicket().then((value) {
        deneme = value;
        debugPrint("gelen deger: " + deneme.email);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanım"),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() async {
                var response = await http.post(
                    "http://flatformapi.herokuapp.com/users/login",
                    body: {
                      'email': 'flatform@flatform.com',
                      'password': 'flatform@flatform2020!'
                    });
                print('Response status: ${response.body.toString()}');
              });
            },
            child: Text("Giriş"),
          ),
          FlatButton(
            onPressed: () {
              setState(() async {
                var responses = await http.get(
                  "http://flatformapi.herokuapp.com/users",
                );
                print('Response status: ${responses.body.toString()}');

                // Await the http get response, then decode the json-formatted response.
              });
            },
            child: Text("Ticket Sorgulama"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Ticket Acma"),
          ),
        ],
      ),
    );
  }
}
