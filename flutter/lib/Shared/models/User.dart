import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class UserInfo {
  String firebaseId;
  int hasuraId;
  String? _name;
  String? _image;
  LanguageType? language;
  String get name => _name ?? "Unknown User";
  bool get isNameSet => _name != null;
  String get image => _image ?? defaultUserImgUrl;
  bool get isImageSet => _image != null;

  UserInfo(
      {required this.hasuraId,
      required this.firebaseId,
      required String? name,
      required String? image,
      this.language}) {
    _name = name;
    _image = image;
  }

  // factory UserInfo.fromData(data) {
  //   return UserInfo(
  //       id: data["id"],
  //       name: data["name"],
  //       image: data["image"],
  //       language: data["language"] != null
  //           ? data["language"].toString().toLanguageType()
  //           : null);
  // }

  // factory UserInfo.fromHasura(Query$getUserByFirebaseId$user user) {
  //   return UserInfo(
  //     firebaseId: user.firebase_id,
  //     hasuraId: user.id,
  //     name: user.name,
  //     image: user.image,
  //     language: user.language_id.toLanguageType(),
  //   );
  // }

  Map<String, dynamic> toFirebaseFormatJson() => {
        "id": firebaseId,
        "name": name,
        "image": image,
        "language":
            language?.toString() ?? LanguageType.EN.toFirebaseFormatString(),
      };
}

class MainUserInfo {
  int id;
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
  factory MainUserInfo.fromHasura(data) {
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

  // UserInfo constructUserInfo() {
  //   return UserInfo(
  //       id: id,
  //       name: name ?? "Not available",
  //       image: image ?? defaultUserImgUrl);
  // }

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
  int? descriptionId;

  ServiceInfo({
    required this.location,
    required super.firebaseId,
    required super.hasuraId,
    required super.image,
    this.descriptionId,
    required super.name,
    LanguageType? lang,
  }) : super(language: lang);

  factory ServiceInfo.fromData(data) {
    mezDbgPrint(" 👋👋👋👋 Service info data $data");
    return ServiceInfo(
      location: Location.fromFirebaseData(data['location']),
      firebaseId: data['firebase_id'],
      hasuraId: data['id'],
      image: data['image'],
      name: data['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "uid": firebaseId,
        "name": name,
        "image": image,
        "location": location.toFirebaseFormattedJson(),
      };
}
