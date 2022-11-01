import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDb {
  final FirebaseDatabase firebaseDatabase;
  final FirebaseApp firebaseApp;
  final String dbUrl;

  FirebaseDb({
    required this.dbUrl,
    required this.firebaseDatabase,
    required this.firebaseApp,
  });
}
