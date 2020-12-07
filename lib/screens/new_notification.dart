import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewNotification extends StatefulWidget {
  final Function addTx;

  NewNotification(this.addTx);

  @override
  _NewNotificationState createState() => _NewNotificationState();
}

class _NewNotificationState extends State<NewNotification> {
  final title = TextEditingController();

  final message = TextEditingController();

  String toWho = 'Kime';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownButton(
                isExpanded: true,
                hint: Text(toWho),
                items: [
                  DropdownMenuItem(
                    child: Text("Tesis Sorumluları"),
                    value: "Tesis Sorumluları",
                  ),
                  DropdownMenuItem(
                    child: Text("Üretim Mühendisleri"),
                    value: "Üretim Mühendisleri",
                  ),
                  DropdownMenuItem(
                    child: Text("Takım Liderleri"),
                    value: "Takım Liderleri",
                  )
                ],
                onChanged: (String value) {
                  setState(() {
                    toWho = value;
                  });
                },
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Konu'),
              controller: title,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Mesaj'),
              controller: message,
              // onChanged: (val) => amountInput = val,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: FlatButton(
                child: Text('Bildirim Gönder'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: bildirimAtma,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bildirimAtma() async {
    widget.addTx(title.text, message.text, toWho);

    var url = 'http://flatformapi.herokuapp.com/users/notifications';
    var response = await http.post(url, body: {
      'email': 'o.akin@farplas.com',
      'issue': title.text,
      'message': message.text,
      'toWho': toWho,
      'color': 'blue'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
