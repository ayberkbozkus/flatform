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

  final formKey=GlobalKey<FormState>();
  
  
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
                    validator: (String girilenVeri) {
                      if(girilenVeri.length<6){
                        return "En az 6 karakter gereki";
                      }
                    },
                    onSaved: (value) => _password = value,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    elevation: 5.0,
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text('Giriş',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                    color: Colors.blue,
                    onPressed: _signInWithEmailAndPassword,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _loginFunc() {
    
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("Girilen mail: $_email şifre:$_password");
    }else{
      setState(() {
        _autocontrol=true;
      });
    }

    _auth.signInWithEmailAndPassword(email: _email, password: _password).then((oturumAcmisKullaniciAuthResult){

      var oturumAcmisKullanici= oturumAcmisKullaniciAuthResult.user;
      if(oturumAcmisKullanici.emailVerified){
        print('Giriş yapıldı');
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
      debugPrint(hata.toString());

      setState(() {
        
      });

    });

  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      ))
          .user;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} signed in"),
      ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
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