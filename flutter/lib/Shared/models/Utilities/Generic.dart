// ignore_for_file: constant_identifier_names

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["models"]
    ["Utilities"]["Generic"];

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

extension LanguageHelper on ServiceProviderLanguage {
  Map<String, dynamic> toFirebaseFormattedString() {
    return <String, dynamic>{
      "primary": primary.toFirebaseFormatString(),
      "secondary": secondary?.toFirebaseFormatString(),
    };
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
    return _i18n()["${toFirebaseFormatString()}"];
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

  String? getTranslation(Language userLanguage) {
    if (containsKey(userLanguage)) {
      return this[userLanguage]!;
    } else if (containsKey(Language.EN)) {
      return this[Language.EN]!;
    } else {
      // values.
      return values.firstOrNull;
    }
  }
}
