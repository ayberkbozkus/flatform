import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<AppUser> currentUser() async{
    try{
      User user = await _firebaseAuth.currentUser;
      return _userFromFirebase(user);
    }catch(e){
      print('Hata current user: ' +e.toString());
      return null;
    }
    
  }

  AppUser _userFromFirebase(User user, {String team, String title}) {
    if (user == null) 
      return null;
    return AppUser(userID: user.uid,email: user.email, team: team, title: title);
  }

  @override
  Future<AppUser> signInEmail(String email, password) async{
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (result.user.emailVerified) { return _userFromFirebase(result.user);}
      else {return null;}
    }catch(e){
      print('Hata email giriş: ' +e.toString());
      return null;
    }
  }

  @override
  Future<AppUser> registerEmail(String email, password, team, title) async {
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      result.user.sendEmailVerification();
      return _userFromFirebase(result.user, team:team, title:title);
    
  }

  @override
  Future<bool> signOut() async{
    try{
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      print(_firebaseAuth.signOut().toString() + 'HELLO');
      return true;
    }catch(e){
      print('Hata signout: ' +e.toString());
      return false;
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if(_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential result = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken));
      User _user = result.user;
      return _userFromFirebase(_user);
      }
      else{
        return null;
      }
    }else {
      return null;
    }
    
  }

}