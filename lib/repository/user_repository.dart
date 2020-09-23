import 'package:flatform/locator.dart';
import 'package:flatform/models/user.dart';
import 'package:flatform/services/auth_base.dart';
import 'package:flatform/services/fake_auth_service.dart';
import 'package:flatform/services/firebase_auth_services.dart';

enum AppMode {DEBUG, RELEASE}

class UserRepository implements AuthBase {

  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthenticationService _fakeAuthenticationService = locator<FakeAuthenticationService>();

  AppMode appMode = AppMode.DEBUG;

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
  Future<bool> signOut() async{
    if(appMode == AppMode.DEBUG)  {
      return await _fakeAuthenticationService.signOut();
    }else{
      return await _firebaseAuthService.signOut();
    }
  }

}