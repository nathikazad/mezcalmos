import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseHelper {

  late final FirebaseDatabase firebaseDatabase;
  late final FirebaseApp firebaseApp;
  final String dbUrl;

  DatabaseHelper(FirebaseDatabase? firebaseDatabase , FirebaseApp? fapp , this.dbUrl)
  {
    this.firebaseApp      = fapp ?? Firebase.apps.first;
    this.firebaseDatabase = firebaseDatabase ?? FirebaseDatabase(app: this.firebaseApp , databaseURL: this.dbUrl);
  }
  
}


