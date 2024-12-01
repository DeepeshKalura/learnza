import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/app_enums.dart';

class FirebaseService {
  final Environment environment;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;
  final FirebaseDatabase extradb = FirebaseDatabase.instance;

  FirebaseService({required this.environment}) {
    if (environment == Environment.development) _connectToEmulator();
  }

  void _connectToEmulator() {
    auth.useAuthEmulator('localhost', 9099);
    database.useFirestoreEmulator('localhost', 8080);
    extradb.useDatabaseEmulator('localhost', 9000);
    storage.useStorageEmulator('localhost', 9199);
  }
}
