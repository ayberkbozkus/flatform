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
import 'package:flatform/services/firebase_auth_services.dart';
import './screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: LandingPage(),
    ));
  }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flatform Login',
//       debugShowCheckedModeBanner: false,
//       theme: new ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: new LandingPage(authService: FirebaseAuthService(),),
//     );
//   }
// }
