import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart'; // For FirebaseException
import 'package:learnza/service/file_service.dart'; // Adjusted import path
import 'package:learnza/service/errors/file_service_errors.dart'; // Adjusted import path
import 'package:learnza/service/firebase_service.dart'; // Adjusted import path

// Create mocks
class MockFirebaseService extends Mock implements FirebaseService {}
class MockFirebaseStorage extends Mock implements firebase_storage.FirebaseStorage {}
class MockReference extends Mock implements firebase_storage.Reference {}
class MockUploadTask extends Mock implements firebase_storage.UploadTask {}
class MockTaskSnapshot extends Mock implements firebase_storage.TaskSnapshot {}
class MockFile extends Mock implements File {}

// Helper for firebase core initialization in tests
// Not strictly needed here as FirebaseService is mocked, but good practice if direct Firebase calls were made.
Future<void> setupMockFirebaseCore() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // If Firebase.initializeApp() was part of the service, you might mock it:
  // MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
  //   if (call.method == 'Firebase#initializeCore') {
  //     return [/* mock app data */];
  //   }
  //   if (call.method == 'Firebase#initializeApp') {
  //     return { 'name': call.arguments['appName'], /* other mock data */ };
  //   }
  //   return null;
  // });
}

void main() {
  late FileService fileService;
  late MockFirebaseService mockFirebaseService;
  late MockFirebaseStorage mockFirebaseStorage;
  late MockReference mockStorageReference; // Renamed to avoid conflict with firebase_storage.Reference
  late MockUploadTask mockUploadTask;
  late MockTaskSnapshot mockTaskSnapshot;
  late MockFile mockFile;

  setUp(() async {
    // await setupMockFirebaseCore(); // Call if direct Firebase initialization is needed

    mockFirebaseService = MockFirebaseService();
    mockFirebaseStorage = MockFirebaseStorage();
    mockStorageReference = MockReference(); // Use the renamed mock
    mockUploadTask = MockUploadTask();
    mockTaskSnapshot = MockTaskSnapshot();
    mockFile = MockFile();

    // Stub the FirebaseService to return the mock FirebaseStorage
    when(mockFirebaseService.storage).thenReturn(mockFirebaseStorage);

    // Default stub for storage.ref()
    when(mockFirebaseStorage.ref()).thenReturn(mockStorageReference);
    // Default stub for ref.child(any)
    when(mockStorageReference.child(any)).thenReturn(mockStorageReference);

    // Default stub for putFile(any) - using thenAnswer for Future as UploadTask is a Future<TaskSnapshot>
    when(mockStorageReference.putFile(any)).thenAnswer((_) async => mockTaskSnapshot);

    // Default stub for snapshot.ref (to get the reference again for getDownloadURL)
    when(mockTaskSnapshot.ref).thenReturn(mockStorageReference);
    // Default stub for ref.getDownloadURL()
    when(mockStorageReference.getDownloadURL()).thenAnswer((_) async => 'http://fakeurl.com/file.jpg');

    fileService = FileService(firebaseService: mockFirebaseService);
  });

  group('uploadFile', () {
    test('should upload file successfully if size is within limit', () async {
      // Arrange
      when(mockFile.path).thenReturn('/tmp/some/file.jpg');
      when(mockFile.length()).thenAnswer((_) async => 10 * 1024 * 1024); // 10MB

      // Act
      final result = await fileService.uploadFile(mockFile, 'test_path');

      // Assert
      expect(result, 'http://fakeurl.com/file.jpg');
      verify(mockStorageReference.putFile(mockFile)).called(1);
      verify(mockStorageReference.getDownloadURL()).called(1);
    });

    test('should throw FileSizeLimitExceededException if file size is over limit', () async {
      // Arrange
      when(mockFile.path).thenReturn('/tmp/some/largefile.jpg');
      // 16MB > 15MB limit (maxFileSizeMB is 15)
      when(mockFile.length()).thenAnswer((_) async => (FileService.maxFileSizeMB + 1) * 1024 * 1024);

      // Act & Assert
      expect(
        () => fileService.uploadFile(mockFile, 'test_path'),
        throwsA(isA<FileSizeLimitExceededException>()),
      );
      verifyNever(mockStorageReference.putFile(any));
    });

    test('should accept file if size is exactly at the limit (maxFileSizeBytes)', () async {
      // Arrange
      when(mockFile.path).thenReturn('/tmp/some/exactlimitfile.jpg');
      when(mockFile.length()).thenAnswer((_) async => FileService.maxFileSizeBytes); // Exactly 15MB

      // Act
      final result = await fileService.uploadFile(mockFile, 'test_path');

      // Assert
      expect(result, 'http://fakeurl.com/file.jpg');
      verify(mockStorageReference.putFile(mockFile)).called(1);
    });

    test('should throw an Exception if FirebaseStorage.putFile fails', () async {
      // Arrange
      when(mockFile.path).thenReturn('/tmp/some/file.jpg');
      when(mockFile.length()).thenAnswer((_) async => 5 * 1024 * 1024); // 5MB
      // Simulate Firebase error during putFile
      when(mockStorageReference.putFile(any)).thenThrow(firebase_storage.FirebaseException(plugin: 'storage', message: 'Permission denied'));

      // Act & Assert
      expect(
        () => fileService.uploadFile(mockFile, 'test_path'),
        throwsA(isA<Exception>()), // The service wraps FirebaseException into a generic Exception
      );
    });

    test('should throw an Exception if getDownloadURL fails', () async {
      // Arrange
      when(mockFile.path).thenReturn('/tmp/some/file.jpg');
      when(mockFile.length()).thenAnswer((_) async => 5 * 1024 * 1024); // 5MB

      // putFile works fine
      when(mockStorageReference.putFile(any)).thenAnswer((_) async => mockTaskSnapshot);
      when(mockTaskSnapshot.ref).thenReturn(mockStorageReference);
      // Simulate Firebase error during getDownloadURL
      when(mockStorageReference.getDownloadURL()).thenThrow(firebase_storage.FirebaseException(plugin: 'storage', message: 'Network error'));

      // Act & Assert
      expect(
        () => fileService.uploadFile(mockFile, 'test_path'),
        throwsA(isA<Exception>()), // The service wraps FirebaseException
      );
    });

    test('should use a unique file name based on Uuid and original extension', () async {
      // Arrange
      when(mockFile.path).thenReturn('/user/files/document.pdf');
      when(mockFile.length()).thenAnswer((_) async => 1 * 1024 * 1024); // 1MB

      // Act
      await fileService.uploadFile(mockFile, 'attachments');

      // Assert
      // Verify that child() was called with a path matching "attachments/" followed by a UUID-like string and ".pdf"
      verify(mockStorageReference.child(argThat(matches(r'^attachments\/[0-9a-fA-F-]{36}\.pdf$')))).called(1);
    });
  });
}
