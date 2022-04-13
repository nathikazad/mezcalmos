import 'package:collection/collection.dart';

enum AuthorizationStatus { InReview, Authorized, Unauthorized }

extension ParseAuthorizationStatusToString on AuthorizationStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthorizationStatus on String {
  AuthorizationStatus toAuthorizationStatus() {
    return AuthorizationStatus.values.firstWhere(
        (AuthorizationStatus e) => e.toFirebaseFormatString() == this,
        orElse: () => AuthorizationStatus.Unauthorized);
  }
}

enum LanguageType { EN, ES }

extension ParseLanugaugeTypeToString on LanguageType {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;

    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToLanugaugeType on String {
  LanguageType toLanguageType() {
    return (LanguageType.values.firstWhereOrNull(
          (LanguageType e) => e.toFirebaseFormatString().toLowerCase() == this,
        )) ??
        LanguageType.ES;
  }

  LanguageType? toNullableLanguageType() {
    return (LanguageType.values.firstWhereOrNull(
          (LanguageType e) => e.toFirebaseFormatString().toLowerCase() == this,
        )) ??
        null;
  }
}

Map<LanguageType, String> convertToLanguageMap(Map data) {
  // mezDbgPrint("@sa@d@: Trying to convert $data convertToLanguageMap !");
  final Map<LanguageType, String> map = {};
  data.forEach((language, string) {
    if (language == LanguageType.EN.toFirebaseFormatString() ||
        language == LanguageType.ES.toFirebaseFormatString()) {
      map[language.toString().toLanguageType()] = string;
    }
  });
  return map;
}

extension LanguageMapToFirebaseFormat on Map<LanguageType, String> {
  Map<String, String> toFirebaseFormat() {
    final Map<String, String> _tempMap = {};
    keys.forEach((LanguageType key) {
      _tempMap[key.toFirebaseFormatString()] = this[key]!;
    });
    return _tempMap;
  }
}
