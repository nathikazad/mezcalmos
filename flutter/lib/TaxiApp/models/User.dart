import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';

class User {
  String uid;
  String email;
  String displayName;
  String image;
  String language;

  User(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.image,
      required this.language});

  // Get props as list.
  List<Object> get props => [uid, email, displayName, image];

  // Removed parse from json , Since we will be working with Snapshots
  User.fromSnapshot(fireAuth.User user, DataSnapshot snapshot)
      : uid = user.uid,
        email = user.email!,
        displayName = user.displayName!,
        image = user.photoURL!,
        language = snapshot.value['language'];

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() =>
      {
        "uid": uid,
        "email": email,
        "displayName": displayName,
        "image": image,
        "language": language
      };
}
