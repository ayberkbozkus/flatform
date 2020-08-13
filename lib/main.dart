// import 'package:flatform/screens/bottomNavScreen.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(
//       home: Login(),
//     ));

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flatfom',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: BottomNavScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import './screens/login.dart';

void main() => runApp(MaterialApp(
      home: Login(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flatform Login',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Login(),
    );
  }
}
