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
    return AuthorizationStatus.values
        .firstWhere((e) => e.toFirebaseFormatString() == this);
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
    return LanguageType.values
        .firstWhere((e) => e.toFirebaseFormatString().toLowerCase() == this);
  }
}

Map<LanguageType, String> convertToLanguageMap(dynamic data) {
  Map<LanguageType, String> map = {};
  data.forEach((dynamic language, dynamic string) {
    if (language == LanguageType.EN.toFirebaseFormatString() ||
        language == LanguageType.ES.toFirebaseFormatString()) {
      map[language.toString().toLanguageType()] = string;
    }
  });
  return map;
}
