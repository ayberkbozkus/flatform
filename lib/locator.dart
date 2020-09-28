import 'package:flatform/repository/user_repository.dart';
import 'package:flatform/services/firestore_db_service.dart';
import 'services/fake_auth_service.dart';
import 'package:get_it/get_it.dart';
import 'services/firebase_auth_services.dart';

GetIt locator= GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => UserRepository());
}