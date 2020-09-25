import '../models/user.dart';

abstract class AuthBase {
  Future<AppUser> currentUser();
  Future<AppUser> signInEmail(String email, password);
  Future<AppUser> registerEmail(String email, password);
  Future<bool> signOut();
  Future<AppUser> signInWithGoogle();
}