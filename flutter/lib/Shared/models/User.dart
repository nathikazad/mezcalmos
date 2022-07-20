import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class UserInfo {
  String id;
  String name;
  String image;
  LanguageType? language;

  UserInfo(
      {required this.id,
      required this.name,
      required this.image,
      this.language});

  factory UserInfo.fromData(data) {
    return UserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        language: data["language"] != null
            ? data["language"].toString().toLanguageType()
            : null);
  }

  Map<String, dynamic> toFirebaseFormatJson() => {
        "id": id,
        "name": name,
        "image": image,
        "language":
            language?.toString() ?? LanguageType.EN.toFirebaseFormatString(),
      };
}

class MainUserInfo {
  String id;
  String? name;
  String? image;
  LanguageType? language;
  String? email;

  /// Original version of image that was uploaded by the user with some light compression.
  String? bigImage;

  String? phone;
  MainUserInfo(
      {required this.id,
      required this.name,
      required this.image,
      this.language,
      this.email,
      this.phone});

  factory MainUserInfo.fromData(data) {
    return MainUserInfo(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        language: data["language"] != null
            ? data["language"].toString().toLanguageType()
            : null,
        phone: data['phone'],
        email: data['email']);
  }

  UserInfo constructUserInfo() {
    return UserInfo(
        id: id,
        name: name ?? "Not available",
        image: image ?? defaultUserImgUrl);
  }

  Map<String, dynamic> toFirebaseFormatJson() => {
        "id": id,
        "email": email,
        "name": name,
        "image": image,
        "language": language.toString(),
        "phone": phone,
        "bigImage": bigImage,
      };
}

class ServiceInfo extends UserInfo {
  Location location;

  ServiceInfo({
    required this.location,
    required String id,
    required String image,
    required String name,
    LanguageType? lang,
  }) : super(id: id, image: image, name: name, language: lang);

  factory ServiceInfo.fromData(data) {
    return ServiceInfo(
        location: Location.fromFirebaseData(data['location']),
        id: data['id'],
        image: data['image'],
        name: data['name']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "uid": id,
        "name": name,
        "image": image,
        "location": location.toFirebaseFormattedJson(),
      };
}
