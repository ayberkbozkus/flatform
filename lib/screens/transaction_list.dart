import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tx) {
            return Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
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
                            color: Colors.green,
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
