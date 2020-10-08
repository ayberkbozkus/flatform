import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class NotificationList extends StatelessWidget {
  final List<Transaction> notification;

  NotificationList(this.notification);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: notification.map((tx) {
            return Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 400,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          tx.amount,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[300],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
