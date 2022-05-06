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

  String? toLanguageName() {
    final String str = toString().split('.').last;
    switch (str) {
      case "EN":
        return "English";
      case "ES":
        return "Spanish";

      default:
        return null;
    }
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

typedef LanguageMap = Map<LanguageType, String>;

LanguageMap convertToLanguageMap(Map data) {
  // mezDbgPrint("@sa@d@: Trying to convert $data convertToLanguageMap !");
  LanguageMap map = {};
  data.forEach((dynamic language, dynamic string) {
    if (language == LanguageType.EN.toFirebaseFormatString() ||
        language == LanguageType.ES.toFirebaseFormatString()) {
      map[language.toString().toLanguageType()] = string;
    }
  });
  return map;
}

extension LanguageMapToFirebaseFormat on LanguageMap {
  Map<String, String> toFirebaseFormat() {
    final Map<String, String> _tempMap = {};
    keys.forEach((LanguageType key) {
      _tempMap[key.toFirebaseFormatString()] = this[key]!;
    });
    return _tempMap;
  }
}
