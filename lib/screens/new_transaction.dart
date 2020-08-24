import 'package:flutter/material.dart';

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
                onPressed: () {
                  addTx(
                    titleController.text,
                    amountController.text,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
