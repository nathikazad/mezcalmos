import 'dart:async';
import 'dart:convert';
import 'dart:io' as dartIO;
//import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class LanguageController extends GetxController {
  // default is english
  RxBool isLamgInitialized = false.obs;
  Rx<Language> _userLanguageKey = sDefaultLanguage.obs;
  Rx<bool> controllerHasInitialized = false.obs;

  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}
      .obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController() {
    final Language? lang = GetStorage().read("lang")?.toString().toLanguage();
    if (lang == null) {
      _userLanguageKey.value = _getSystemLanguage();
      GetStorage()
          .write("lang", _userLanguageKey.value.toFirebaseFormatString());
    } else {
      _userLanguageKey.value = lang;
    }

    mezDbgPrint(" 🗿🗿🗿🗿🗿 USER LANGUAGE [[ $lang ]]🗿🗿🗿🗿🗿🗿🗿🗿");
  }

  Map<Language, dynamic> languageDetails = {
    Language.EN: {"fullName": "English", "langImage": usaFlagAsset},
    Language.ES: {"fullName": "Español", "langImage": mexicoFlagAsset}
  };

  Language get userLanguageKey => _userLanguageKey.value;
  String get langFullName =>
      languageDetails[_userLanguageKey.value]['fullName'];
  String get langImage => languageDetails[_userLanguageKey.value]['langImage'];
  dynamic get strings =>
      _jsonStrings[_userLanguageKey.value.toFirebaseFormatString()];

  /// fileLocation: customerApp/notificationHandler
  dynamic getLMap(String fileLocation) {
    try {
      dynamic map =
          _jsonStrings[_userLanguageKey.value.toFirebaseFormatString()];
      fileLocation.split('/').forEach((String element) {
        map = map[element];
      });
      return map;
    } on Exception {
      // TODO
    }
  }

  Language get oppositLangKey =>
      _userLanguageKey.value == Language.EN ? Language.ES : Language.EN;
  String get oppositToLang =>
      _userLanguageKey.value == Language.EN ? "A Español" : "To English";
  String get oppositFlag =>
      _userLanguageKey.value == Language.EN ? mexicoFlagAsset : usaFlagAsset;

  Future<void> changeUserLanguage(
      {Language? language = null, bool saveToDatabase = true}) async {
    if (saveToDatabase && Get.find<AuthController>().isUserSignedIn) {
      await Get.find<AuthController>()
          .changeLanguage(language ?? _userLanguageKey.value.toOpLang())
          .then((Language value) => _userLanguageKey.value = value);
    } else {
      _userLanguageKey.value = language ?? _userLanguageKey.value.toOpLang();
    }
    await GetStorage()
        .write("lang", _userLanguageKey.value.toFirebaseFormatString());
    _userLanguageKey.refresh();

    // if (language == null) {
    //   if (Get.find<AuthController>().user?.language == Language.ES) {
    //     language = Language.EN;
    //   } else {
    //     language = Language.ES;
    //   }
    //   if (Get.find<AuthController>().user != null) {
    //     Get.find<AuthController>().user!.language = language;

    //     unawaited(Get.find<AuthController>().changeLanguage(language));
    //     _userLanguageKey.value = language;
    //   } else {
    //     mezDbgPrint("[=] INSIDE (else)");

    //     // welse so we can still update the user language locally but not in db!
    //     _userLanguageKey.value = oppositLangKey;
    //   }
    // } else if (Get.find<AuthController>().user == null) {
    //   mezDbgPrint("[=] INSIDE (else if)");

    //   _userLanguageKey.value = language;
    // }
  }

  ///this function [changeLangForWeb] used only for web
  void changeLangForWeb(Language? language) {
    _userLanguageKey.value = language ?? Language.EN;
  }

  void setLanguage(Language language) {
    _userLanguageKey.value = language;
  }

  @override
  void onInit() {
    super.onInit();
    Future<dynamic>.microtask(() async {
      final String enJson = await rootBundle.loadString(enLang);
      final String esJson = await rootBundle.loadString(esLang);
      _jsonStrings = <String, dynamic>{
        "en": jsonDecode(enJson) as Map<String, dynamic>,
        "es": jsonDecode(esJson) as Map<String, dynamic>
      };
    }).then((_) {
      isLamgInitialized.value = true;
      if (_jsonStrings[Language.EN.toFirebaseFormatString()].toString() != "" &&
          _jsonStrings[Language.EN.toFirebaseFormatString()] != null &&
          _jsonStrings[Language.ES.toFirebaseFormatString()].toString() != "" &&
          _jsonStrings[Language.ES.toFirebaseFormatString()] != null) {
        controllerHasInitialized.value = true;
      } else {
        controllerHasInitialized.value = false;
      }
    });
  }

  Language _getSystemLanguage() {
    if (kIsWeb) return Language.EN;
    return dartIO.Platform.localeName.substring(0, 2) == 'es'
        ? Language.ES
        : Language.EN;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
