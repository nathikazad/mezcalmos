// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';

enum ServiceStatus { Open, ClosedTemporarily, ClosedIndefinitely }

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
        orElse: () => ServiceStatus.ClosedIndefinitely);
  }
}

extension ParseLangaugeToString on Language {
  String toLanguageCode() {
    String str = toString().split('.').last;
    if (str[1] == 's') {
      str = "es_MX";
    }
    return "${str.toLowerCase()}";
  }

  // String toFirebaseFormatString() {
  //   final String str = toString().split('.').last;

  //   return str[0].toLowerCase() + str.substring(1).toLowerCase();
  // }

  Language toOpLang() {
    if (this == Language.EN) {
      return Language.ES;
    } else {
      return Language.EN;
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

extension ParseStringToLangauge on String {
  // Language toLanguage() {
  //   return (Language.values.firstWhereOrNull(
  //         (Language e) => e.toFirebaseFormatString().toLowerCase() == this,
  //       )) ??
  //       Language.ES;
  // }

  Language? toNullableLanguageType() {
    return (Language.values.firstWhereOrNull(
          (Language e) => e.toFirebaseFormatString().toLowerCase() == this,
        )) ??
        null;
  }
}

typedef LanguageMap = Map<Language, String>;

LanguageMap convertToLanguageMap(Map data) {
  // mezDbgPrint("@sa@d@: Trying to convert $data convertToLanguageMap !");
  final LanguageMap map = {};
  data.forEach((language, string) {
    if (language == Language.EN.toFirebaseFormatString() ||
        language == Language.ES.toFirebaseFormatString()) {
      map[language.toString().toLanguage()] = string;
    }
  });
  return map;
}

extension LanguageMapToFirebaseFormat on LanguageMap {
  Map<String, String> toFirebaseFormat() {
    final Map<String, String> _tempMap = {};
    keys.forEach((Language key) {
      _tempMap[key.toFirebaseFormatString()] = this[key]!;
    });
    return _tempMap;
  }
}
