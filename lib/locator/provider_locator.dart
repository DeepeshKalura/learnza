import 'package:get_it/get_it.dart';

import '../providers/model/books_provider.dart';
import '../providers/model/courses_provider.dart';
import '../providers/model/groups_provider.dart';
import '../providers/model/users_provider.dart';
import '../providers/state/user_preference_provider.dart';
import '../service/firebase_service.dart';

// import '../providers/post_provider.dart';
// TODO: I still don't know what to do with provider and manage the service provider with it [PR#26]
void setup(GetIt getIt) {
//   getIt.registerLazySingleton<PostProvider>(
//     () => PostProvider()
//   )

  getIt.registerSingleton<UserPreferenceProvider>(
    UserPreferenceProvider(),
  );

  getIt.registerLazySingleton<GroupsProvider>(
    () => GroupsProvider(
      firebaseService: getIt.get<FirebaseService>(),
    ),
  );

  getIt.registerLazySingleton<CourseProvider>(
    () => CourseProvider(
      firebaseService: getIt.get<FirebaseService>(),
    ),
  );

  getIt.registerLazySingleton<UsersProvider>(
    () => UsersProvider(
      firebaseService: getIt.get<FirebaseService>(),
    ),
  );

  getIt.registerLazySingleton<BooksProvider>(
    () => BooksProvider(
      firebaseService: getIt.get<FirebaseService>(),
    ),
  );
}
