import 'dart:ui';

import 'package:flutter/material.dart';
import './NavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

Widget showLogo() {
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 52.0,
        child: Image.asset('assets/images/flutter-icon.png'),
      ),
    ),
  );
}

class Login extends StatefulWidget {
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email,_password;
  bool _autocontrol = false;
  bool _loginFailed = true;

  final formKey=GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    _auth.onAuthStateChanged.listen((user) {
      setState(() {
        if(user != null) {
          print('kullanıcı oturum acti');
        }
        else {
          print('kullanıcı oturumu kapattı');
        }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(

            primaryColor: Colors.blue),
        child: Scaffold(
          
          
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              autovalidate: _autocontrol,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  showLogo(),
                  SizedBox(height: 80,),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                    hintText: 'Eposta',
                    icon: new Icon(
                      Icons.mail,
                      color: Colors.grey,
                    )),
                    validator: _emailKontrol,
                    onSaved: (value) => _email = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                    hintText: 'Şifre',
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )),
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _loginFailed ? Text('') : Center(child: Text('Email veya Şifre Hatalı',style: TextStyle(color: Colors.red),)),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text('Giriş',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    color: Colors.blue,
                    onPressed: _loginFunc,
                  ),
                  RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text('Şifremi Unuttum',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    color: Colors.blue,
                    onPressed: _forgetPassword,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _forgetPassword() async {
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      print('\n\n$_email\n\n'); 

    String mail = _email;
    _auth.sendPasswordResetEmail(email: mail).then((v){
      setState(() {

        print("\nSıfırlama maili gönderildi");
      });
    }).catchError((hata){

      setState(() {
        print("\nŞifremi unuttum mailinde hata $hata");
        
      });
    });
    
  }}

  void _loginFunc() async {
    
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      print('\n\n$_email\n\n'); 

      _auth.signInWithEmailAndPassword(email: _email, password: _password).then((loginUserAuthResult){
      
      var loginUser= loginUserAuthResult.user;
      
      if(loginUser.emailVerified){
        setState(() {
          _loginFailed = false;
        });
        Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );  
      }else{
        print('Giriş yapılamadı');
        
        _auth.signOut();
      }
      setState(() {

      });

    }).catchError((hata){
      setState(() {
        _loginFailed = false;
      });
      print('hata geldi');
      debugPrint(hata.toString());

      

    });

    }else{
      setState(() {
        _autocontrol=true;
      });
    }
    
    

  }


  String _emailKontrol(String mail){

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }


}




