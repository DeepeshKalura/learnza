import 'package:get_it/get_it.dart';
import 'package:learnza/model/app_enums.dart';

import '../service/anna_archieve_service.dart';
import '../service/firebase_service.dart';
import '../service/internet_connectivity_service.dart';

void setup(GetIt getIt) {
  getIt.registerLazySingleton<FirebaseService>(
    () => FirebaseService(
      environment: Environment.production,
    ),
  );

  getIt.registerLazySingleton<AnnasArchieveService>(
    () => AnnasArchieveService(),
  );

  getIt.registerLazySingleton<InternetConnectivityService>(
    () => InternetConnectivityService(),
  );
}
