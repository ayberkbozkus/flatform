import 'package:flatform/locator.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/screens/NavBar.dart';
import 'package:flatform/screens/login.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flatform/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  

  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AppUser _user;
  AuthBase authService = locator<FirebaseAuthService>();
  @override
  void initState() {
    super.initState();
    _checkUser();
  }
  @override
  Widget build(BuildContext context) {
    if(_user == null) {
      return Login(
        onSignIn: (user) {updateUser(user);}
      );
    } else {
      return HomePage(
        onSignOut: () {
          updateUser(null);
        });
    }
  }
  Future<void> _checkUser() async {
    _user = await authService.currentUser();
    if(_user != null ){
      var uid = _user.userID;
      setState(() {
    });}
  }
  void updateUser(AppUser user) {
    setState(() {
      _user = user;
    });
  }
}