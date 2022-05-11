import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

enum AuthorizationStatus { InReview, Authorized, Unauthorized }

extension ParseAuthorizationStatusToString on AuthorizationStatus {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToAuthorizationStatus on String {
  AuthorizationStatus toAuthorizationStatus() {
    return AuthorizationStatus.values.firstWhere(
        (e) => e.toFirebaseFormatString() == this,
        orElse: () => AuthorizationStatus.Unauthorized);
  }
}

enum LanguageType { EN, ES }

extension ParseLanugaugeTypeToString on LanguageType {
  String toFirebaseFormatString() {
    String str = this.toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }
}

extension ParseStringToLanugaugeType on String {
  LanguageType toLanguageType() {
    return LanguageType.values.firstWhere(
        (e) => e.toFirebaseFormatString().toLowerCase() == this,
        orElse: () => LanguageType.ES);
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
    Map<String, String> _tempMap = {};
    keys.forEach((key) {
      _tempMap[key.toFirebaseFormatString()] = this[key]!;
    });
    return _tempMap;
  }
}
