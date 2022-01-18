import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
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
  String? image;
  LanguageType language;
  String? phone;
  dynamic data;

  User(
      {required this.uid,
      required this.email,
      required this.name,
      required this.image,
      required this.language,
      this.phone});

  // Get props as list.
  List<dynamic> get props => [uid, email, name, image];

  // Removed parse from json , Since we will be working with Snapshots
  User.fromSnapshot(fireAuth.User user, DataSnapshot snapshot)
      : uid = user.uid,
        email = user.email,
        name = snapshot.value['name'],
        image = snapshot.value['image'],
        language = snapshot.value['language'] == null
            ? LanguageType.ES
            : LanguageType.ES,
        // LanguageType.values.firstWhere((element) =>
        //     element.toFirebaseFormatString().toLowerCase() ==
        //     snapshot.value['language']),
        phone = snapshot.value['phone'],
        data = snapshot.value;

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "image": image,
        "language": language.toString()
      };
}
