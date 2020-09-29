import '../models/user.dart';

abstract class DBBase {
  Future<bool> saveUser(AppUser user);
  Future<AppUser> readUser(String userID);
}