import 'package:get_it/get_it.dart';

import '../providers/state/user_preference_provider.dart';

// import '../providers/post_provider.dart';
// TODO: I still don't know what to do with provider and manage the service provider with it [PR#26]
void setup(GetIt getIt) {
//   getIt.registerLazySingleton<PostProvider>(
//     () => PostProvider()
//   )

  getIt.registerSingleton<UserPreferenceProvider>(UserPreferenceProvider());
}
