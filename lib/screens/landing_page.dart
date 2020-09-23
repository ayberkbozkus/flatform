import 'package:flatform/models/user.dart';
import 'package:flatform/screens/NavBar.dart';
import 'package:flatform/screens/login.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  final AuthBase authService;

  const LandingPage({Key key,@required this.authService}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AppUser _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }
  @override
  Widget build(BuildContext context) {
    if(_user == null) {
      return Login(
        authService: widget.authService,
        onSignIn: (user) {updateUser(user);}
      );
    } else {
      return HomePage(
        authService: widget.authService,
        onSignOut: () {
          updateUser(null);
        });
    }
  }
  Future<void> _checkUser() async {
    _user = await widget.authService.currentUser();
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