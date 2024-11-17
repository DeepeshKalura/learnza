import 'package:get_it/get_it.dart';

import '../service/firebase_service.dart';

void setup(GetIt getIt) {
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseService(),
  );
}
