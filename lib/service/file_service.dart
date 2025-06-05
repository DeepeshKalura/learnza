import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart'; // For generating unique file names
import 'firebase_service.dart';
import 'errors/file_service_errors.dart'; // Ensure this path is correct

class FileService {
  final FirebaseService _firebaseService;
  static const int maxFileSizeMB = 15;
  static const int maxFileSizeBytes = maxFileSizeMB * 1024 * 1024;

  FileService({required FirebaseService firebaseService})
      : _firebaseService = firebaseService;

  Future<String> uploadFile(File file, String basePath) async {
    final int fileSize = await file.length();
    if (fileSize > maxFileSizeBytes) {
      throw FileSizeLimitExceededException(
          'File exceeds the $maxFileSizeMB MB limit.');
    }

    try {
      final fileName = const Uuid().v4() + '.' + file.path.split('.').last;
      final String filePath = '$basePath/$fileName';

      Reference storageRef = _firebaseService.storage.ref().child(filePath);
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      // Handle Firebase-specific errors (e.g., permission denied)
      throw Exception('Failed to upload file: ${e.message}');
    } catch (e) {
      // Handle other errors
      throw Exception('An unexpected error occurred during file upload: $e');
    }
  }
}
