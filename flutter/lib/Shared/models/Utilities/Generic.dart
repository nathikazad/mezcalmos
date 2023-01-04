// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';

enum ServiceStatus { Open, Closed_temporarily, Closed_indefinitely }

extension ParseServiceStatusToString on ServiceStatus {
  String toFirebaseFormatString() {
    final String str = toString().split('.').last;
    return str[0].toLowerCase() + str.substring(1);
  }
}

extension ParseStringToServiceStatusStatus on String {
  ServiceStatus toServiceStatus() {
    return ServiceStatus.values.firstWhere(
        (ServiceStatus e) => e.toFirebaseFormatString() == this,
        orElse: () => ServiceStatus.Closed_indefinitely);
  }
}

enum LanguageType {
  EN,
  ES,
}

extension ParseLanugaugeTypeToString on LanguageType {
  String toLanguageCode() {
    String str = toString().split('.').last;
    if (str[1] == 's') {
      str = "es_MX";
    }
    return "${str.toLowerCase()}";
  }

  String toFirebaseFormatString() {
    final String str = toString().split('.').last;

    return str[0].toLowerCase() + str.substring(1).toLowerCase();
  }

  LanguageType toOpLang() {
    if (this == LanguageType.EN) {
      return LanguageType.ES;
    } else {
      return LanguageType.EN;
    }
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
  final LanguageMap map = {};
  data.forEach((language, string) {
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
