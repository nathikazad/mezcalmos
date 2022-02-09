import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';


class UserInfo {
  String id;
  String name;
  String image;
  LanguageType? language;
  String? email;
  String? phone;
  UserInfo({
    required this.id, 
    required this.name, 
    required this.image, 
    this.language,
    this.email,
    this.phone});

  factory UserInfo.fromData(dynamic data) {
    mezDbgPrint("User info");
    mezDbgPrint(data);
    return UserInfo(
      id: data["id"], 
      name: data["name"], 
      image: data["image"],
      language: data["language"] != null
        ? data["language"].toString().toLanguageType()
        : null,
      phone: data['phone'],
      email: data['email']
      );
  }

  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {
        "uid": id,
        "email": email,
        "name": name,
        "image": image,
        "language": language.toString(),
        "phone": phone
      };
}
