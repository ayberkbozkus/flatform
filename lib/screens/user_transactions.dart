import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Makine',
      amount: '8.45-8.50 arasında 1. makineden veri alınamadı',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Server',
      amount: 'Kibana Belleği Doldu',
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, String txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
