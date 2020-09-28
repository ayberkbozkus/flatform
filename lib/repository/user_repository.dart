import 'package:flatform/locator.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flatform/services/fake_auth_service.dart';
import 'package:flatform/services/firebase_auth_services.dart';
import 'package:flatform/services/firestore_db_service.dart';

enum AppMode {DEBUG, RELEASE}

class UserRepository implements AuthBase {

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService = locator<FakeAuthenticationService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<AppUser> currentUser() async{
    if(appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    }else{
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<AppUser> signInEmail(String email, password) async{
    if(appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInEmail(email,password);
    }else{
      return await _firebaseAuthService.signInEmail(email,password);
    }
  }

  @override
  Future<AppUser> registerEmail(String email, password) async{
    if(appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.registerEmail(email,password);
    }else{
      AppUser _user = await _firebaseAuthService.registerEmail(email,password);
      bool _result = await _firestoreDBService.saveUser(_user);
      if(_result){
        return _user;
      }else return null;
    }
  }

  @override
  Future<AppUser> signInWithGoogle() async{
    if(appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithGoogle();
    }else{
      AppUser _user = await _firebaseAuthService.signInWithGoogle();
      bool _result = await _firestoreDBService.saveUser(_user);
      if(_result){
        return _user;
      }else return null;
    }
  }

  @override
  Future<bool> signOut() async{
    if(appMode == AppMode.DEBUG)  {
      return await _fakeAuthenticationService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }
  }

  

  

}