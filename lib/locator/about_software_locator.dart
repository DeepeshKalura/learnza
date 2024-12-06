import 'package:get_it/get_it.dart';

import '../app_config.dart';

void setup(GetIt getIt) {
  getIt.registerLazySingleton<AppConfig>(() => AppConfig());
}
