import 'package:get_it/get_it.dart';

import '../../features/Auth/data/repos/auth_repo_impl.dart';
import '../../features/Auth/domain/repos/auth_repo.dart';
import 'firebase_auth_services.dart';
import 'shared_prefrences_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<FirebaseAuthServices>(
    () => FirebaseAuthServices(),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(firebaseAuthServices: getIt<FirebaseAuthServices>()),
  );
  getIt.registerLazySingleton<SharedPreferencesService>(
    () => SharedPreferencesService(),
  );
}
