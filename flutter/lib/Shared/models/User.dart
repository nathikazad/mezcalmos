import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

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
  String? name;

  /// compressed version of [bigImage]
  String? image;

  /// Original version of image that was uploaded by the user with some light compression.
  String? bigImage;
  LanguageType language;
  String? phone;
  dynamic data;

  User(
      {required this.uid,
      required this.email,
      required this.name,
      required this.image,
      this.bigImage,
      required this.language,
      this.phone});

  // Get props as list.
  List<dynamic> get props => [uid, email, name, image, bigImage];

  // Removed parse from json , Since we will be working with Snapshots
  User.fromSnapshot(fireAuth.User user, DataSnapshot snapshot)
      : uid = user.uid,
        email = user.email,
        name = snapshot.value['name'],
        image = snapshot.value['image'],
        bigImage = snapshot.value['bigImage'],
        language = snapshot.value['language'] == null
            ? LanguageType.ES
            : snapshot.value['language'].toString().toLanguageType(),
        phone = snapshot.value['phone'],
        data = snapshot.value;

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "image": image,
        "bigImage": bigImage,
        "language": language.toString()
      };
}
