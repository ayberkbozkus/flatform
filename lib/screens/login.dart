import 'package:flutter/material.dart';
import './NavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

String _email;
String _password;
bool _isLoginForm = true;
String _errorMessage;
bool _isLoginMode;
// bool _isLoading = false;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flatform'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            showForm(context),
            //showCircularProgress(),
          ],
        ));
  }
}

// Widget showCircularProgress() {
//   if (_isLoading) {
//     return Center(child: CircularProgressIndicator());
//   }
//   return Container(
//     height: 0.0,
//     width: 0.0,
//   );
// }

Widget showLogo() {
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/flutter-icon.png'),
      ),
    ),
  );
}

Widget showEmailInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Eposta',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value.trim(),
    ),
  );
}

Widget showPasswordInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Şifre',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value.trim(),
    ),
  );
}

Widget showPrimaryButton(context) {
  return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: new Text(_isLoginForm ? 'Giriş' : '',
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ));
}

// Widget showSecondaryButton() {
//   return new FlatButton(
//       child: new Text(_isLoginForm ? ' ' : 'Have an account? Sign in',
//           style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
//       onPressed: () {
//         print('hello');
//       });
// }

// void toggleFormMode() {
//   resetForm();
//   setState(() {
//     _isLoginForm = !_isLoginForm;
//   });
// }

Widget showErrorMessage() {
  if (_errorMessage.length > 0 && _errorMessage != null) {
    return new Text(
      _errorMessage,
      style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300),
    );
  } else {
    return new Container(
      height: 0.0,
    );
  }
}

final _formKey = new GlobalKey<FormState>();

Widget showForm(context) {
  return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(context),
            // showSecondaryButton(),
            //showErrorMessage(),
          ],
        ),
      ));
}
