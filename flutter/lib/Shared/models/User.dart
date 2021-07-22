import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';

class User {
  /** 
   * changed these fields to String? , 
   * cuz a new user authenticated using OTP will have only : 
   * {phoneNumber: +216xxxxxxx, phoneNumberType: SMS} , 
   * thus errors gets thrown in authController ,
   * to avoid that its better to make them Nullable String
  **/

  String uid;
  String? email;
  String? displayName;
  String? image;
  String language;
  String? phone;

  User(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.image,
      required this.language,
      this.phone});

  // Get props as list.
  List<dynamic> get props => [uid, email, displayName, image];

  // Removed parse from json , Since we will be working with Snapshots
  User.fromSnapshot(fireAuth.User user, DataSnapshot snapshot)
      : uid = user.uid,
        email = user.email,
        displayName = snapshot.value['displayName'],
        image = snapshot.value['photo'],
        language = snapshot.value['language'] == null
            ? "es"
            : snapshot.value['language'],
        phone = snapshot.value['phone'];

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "displayName": displayName,
        "image": image,
        "language": language
      };
}
