import 'package:flatform/models/user.dart';
import 'package:flatform/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = '123412312312';
  @override
  Future<AppUser> currentUser() async{
    return await Future.value(AppUser(userID: userID));
  }

  @override
  Future<AppUser> signInEmail(String email, password) async{
    return await Future.delayed(Duration(seconds: 2), () => AppUser(userID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<AppUser> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

}