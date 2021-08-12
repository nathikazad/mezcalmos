import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class LanguageController extends GetxController {
  AuthController _authController = Get.find<AuthController>();

  // default is english
  RxBool isAppInitialized = false.obs;
  RxString _userLanguageKey = tDefaultLanguage.obs;

  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}
      .obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController() {
    final lang = Platform.localeName.substring(0, 2);

    // print("\n\n\n\n\nUSER LANGUAGE [[ $lang ]]\n\n\n\n\n");
    if (lang == "en")
      _userLanguageKey.value =
          lang; // to avoid diffrent other languages diffrent than en and es
  }

  Map<String, dynamic> languageDetails = {
    "en": {"fullName": "English", "langImage": usaFlagAsset},
    "es": {"fullName": "Español", "langImage": mexicoFlagAsset}
  };
  String get userLanguageKey => _userLanguageKey.value;
  String get langFullName => languageDetails[_userLanguageKey.value].fullName;
  String get langImage => languageDetails[_userLanguageKey.value].langImage;
  dynamic get strings => _jsonStrings[_userLanguageKey.value];

  String get oppositToLang =>
      _userLanguageKey.value == "en" ? "A Español" : "To English";
  String get oppositFlag =>
      _userLanguageKey.value == "en" ? mexicoFlagAsset : usaFlagAsset;

  void changeUserLanguage([String? language]) {
    if (language == null) {
      if (_authController.user!.language == "es") {
        language = "en";
      } else {
        language = "es";
      }
      _authController.changeLanguage(language);
    } else if (_authController.user == null) {
      _userLanguageKey.value = language;
    }
  }

  void userLanguageChanged(String language) {
    _userLanguageKey.value = language;
  }

  @override
  void onInit() async {
    super.onInit();
    String enJson = await rootBundle.loadString(enLang);
    String esJson = await rootBundle.loadString(esLang);
    _jsonStrings = <String, dynamic>{
      "en": jsonDecode(enJson) as Map<String, dynamic>,
      "es": jsonDecode(esJson) as Map<String, dynamic>
    };
  }

  @override
  void dispose() {
    super.dispose();
  }
}
