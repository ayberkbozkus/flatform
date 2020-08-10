import 'package:flutter/material.dart';

class login extends StatelessWidget {
  final appBar = AppBar(
    title: Text('Flatform'),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () => null,
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
