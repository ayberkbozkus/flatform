import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Konu'),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mesaj'),
              controller: amountController,
              // onChanged: (val) => amountInput = val,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: FlatButton(
                child: Text('Ticket Aç'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: ticketacma,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ticketacma() async {
    addTx(
      titleController.text,
      amountController.text,
    );

    var url = 'http://flatformapi.herokuapp.com/users/ticket';
    var response = await http.post(url, body: {
      'email': 'o.akin@farplas.com',
      'issue': titleController.text,
      'message': amountController.text,
      'color': 'blue'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
