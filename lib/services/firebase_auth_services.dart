import 'package:firebase_auth/firebase_auth.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/services/auth_base.dart';

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

  AppUser _userFromFirebase(User user) {
    if (user == null) 
      return null;
    return AppUser(userID: user.uid);
  }

  @override
  Future<AppUser> signInEmail(String email, password) async{
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result.user);
    }catch(e){
      print('Hata email giriş: ' +e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      print('Hata signout: ' +e.toString());
      return false;
    }
  }
}