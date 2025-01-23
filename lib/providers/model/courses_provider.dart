import '../../model/course/courses_model.dart';
import '../../service/firebase_service.dart';

class CourseProvider {
  final FirebaseService firebaseService;
  CourseProvider({required this.firebaseService});

  Future<List<CoursesModel>> getCourse() {
    return firebaseService.database.collection('courses').get().then((value) {
      return value.docs.map((e) => CoursesModel.fromJson(e.data())).toList();
    });
  }
}
