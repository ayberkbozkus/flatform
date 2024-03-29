import 'dart:ui';
import 'package:flatform/errors/errors.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/viewmodel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


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

enum FormType {Register, LogIn}

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  String _email,_password,buttonText,registerText;
  String team = 'Takım Seçiniz';
  String title = 'Ünvan Seçiniz';
  bool _autocontrol = false;
  bool _loginFailed = true;
  var formType = FormType.LogIn;

  void _login(String _email, String _password, String team, String title) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (formType == FormType.LogIn) {
      AppUser loginUser = await _userModel.signInEmail(_email, _password);
    if(loginUser != null){
        setState(() {
          
          _loginFailed = true;
        });
        print('Giriş YAPILDI');
      }else{
        print('Giriş yapılamadı');
        _loginFailed = false;
        
        _userModel.signOut();
      }
    } else {
      try {
        AppUser newUser = await _userModel.registerEmail(_email, _password,team,title);
      } catch (e) {
        debugPrint(Errors.show(e.code));
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Kullanıcı Oluşturma Hata'),
              content: Text(Errors.show(e.code)),
              actions: <Widget>[
                FlatButton(onPressed: () {Navigator.pop(context);}, child: Text('Tamam'))
              ],
            );  
          }
        ); 
        }
      
    }
  }
  void _loginwithGoogle() async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    AppUser loginUser = await _userModel.signInWithGoogle();
    if(loginUser != null){
        setState(() {
          
          _loginFailed = true;
        });
        print('Giriş YAPILDI');
      }else{
        print('Giriş yapılamadı');
        _loginFailed = false;
        
        _userModel.signOut();
      }
    
  }

  final formKey=GlobalKey<FormState>();

  
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    buttonText = formType == FormType.LogIn ? 'Giriş Yap' : 'Kayıt Ol';
    registerText = formType == FormType.LogIn ? 'Hesabınız yok mu? Kayıt Olun' : 'Hesabınız Var Mı? Giriş Yapın';
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
                    border: OutlineInputBorder(),
                    labelText: 'Eposta',
                    hintText: 'Eposta',
                    prefixIcon: new Icon(
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
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Şifre',
                    prefixIcon: new Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )),
                    onSaved: (value) => _password = value,
                  ),
                  
                  _loginFailed ? Text('') : Center(child: Text('Email veya Şifre Hatalı',style: TextStyle(color: Colors.red),)),

                  formType == FormType.LogIn ? SizedBox() : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                            Container(
                              
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: DropdownButton(
                                elevation: 8,
                                isDense: false,
                                isExpanded: true,
                                hint: Text(team),
                                items: [
                                  DropdownMenuItem(
                                child: Text("Personel"),
                                value: 'Personel',
                              ),
                              DropdownMenuItem(
                                child: Text("Takım Lideri"),
                                value: 'Takım Lideri',
                              ),
                              DropdownMenuItem(
                                child: Text("Bölüm Başkanı"),
                                value: 'Bölüm Başkanı'
                              ),
                              DropdownMenuItem(
                                  child: Text("Genel Müdür Yardımcısı"),
                                  value: 'Genel Müdür Yardımcısı'
                              )
                                ],
                                onChanged: (String value) {
                                  setState(() {
                                    team = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(title),
                                items: [
                                  DropdownMenuItem(
                                child: Text("Üretim"),
                                value: 'Üretim',
                              ),
                              DropdownMenuItem(
                                child: Text("Büyük Veri"),
                                value: 'Büyük Veri',
                              ),
                              DropdownMenuItem(
                                child: Text("Satış/Pazarlama"),
                                value: 'Satış/Pazarlama'
                              ),
                              DropdownMenuItem(
                                  child: Text("İK"),
                                  value: 'İK')
                                ],
                                onChanged: (String value) {
                                  setState(() {
                                    title = value;
                                  });
                                },
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                                    RaisedButton(
                                      elevation: 5.0,
                                      shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0)),
                                      child: new Text(buttonText,
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(onPressed: () => change(), child: Text(registerText,style: TextStyle(color: Colors.black45),)),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }
                  
                    void _forgetPassword() async {
                      if(formKey.currentState.validate()){
                        formKey.currentState.save();
                  
                      String mail = _email;
                      // _auth.sendPasswordResetEmail(email: mail).then((v){
                      //   setState(() {
                  
                      //     print("\nSıfırlama maili gönderildi");
                      //   });
                      // }).catchError((hata){
                  
                      //   setState(() {
                      //     print("\nŞifremi unuttum mailinde hata $hata");
                          
                      //   });
                      // });
                      
                    }}
                  
                    void _loginFunc() async {
                      
                      if(formKey.currentState.validate()){
                        formKey.currentState.save();
                        _login(_email,_password, team, title);
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
                  
                    change() {
                      setState(() {
                        formType = formType == FormType.LogIn ? FormType.Register : FormType.LogIn;
                      });
                    }
}