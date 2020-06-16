import 'package:flatform/screens/bottomNavScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Login(),
    ));

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatfom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BottomNavScreen(),  
    );
  }
}
