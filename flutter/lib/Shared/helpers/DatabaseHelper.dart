import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseHelper {
  final FirebaseDatabase firebaseDatabase;
  final FirebaseApp firebaseApp;
  final String dbUrl;

  DatabaseHelper(
      {required this.dbUrl,
      required this.firebaseDatabase,
      required this.firebaseApp});
}
