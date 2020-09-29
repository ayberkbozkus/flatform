import 'package:flatform/screens/basic_page.dart';
import 'package:flatform/screens/login.dart';
import 'package:flatform/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    if(_userModel.state == ViewState.Idle) {
      print(_userModel.user);
      if(_userModel.user == null) {
        return Login();
      } else {
        return BasicPage();
      }
    } else{
      return Scaffold(
        body: Center(child: CircularProgressIndicator(),)
      );
    }
    
  }
}