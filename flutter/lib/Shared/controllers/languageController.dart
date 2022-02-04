import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class LanguageController extends GetxController {
  AuthController _authController = Get.find<AuthController>();

  // default is english
  RxBool isAppInitialized = false.obs;
  Rx<LanguageType> _userLanguageKey = tDefaultLanguage.obs;

  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}
      .obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController() {
    final LanguageType? lang =
        Platform.localeName.substring(0, 2).toLanguageType();

    // mezDbgPrint("\n\n\n\n\nUSER LANGUAGE [[ $lang ]]\n\n\n\n\n");
    if (lang == LanguageType.EN)
      _userLanguageKey.value = LanguageType
          .EN; // to avoid diffrent other languages diffrent than en and es
  }

  Map<LanguageType, dynamic> languageDetails = {
    LanguageType.EN: {"fullName": "English", "langImage": usaFlagAsset},
    LanguageType.ES: {"fullName": "Español", "langImage": mexicoFlagAsset}
  };
  LanguageType get userLanguageKey => _userLanguageKey.value;
  String get langFullName => languageDetails[_userLanguageKey.value].fullName;
  String get langImage => languageDetails[_userLanguageKey.value].langImage;
  dynamic get strings =>
      _jsonStrings[_userLanguageKey.value.toFirebaseFormatString()];

  LanguageType get oppositLangKey => _userLanguageKey.value == LanguageType.EN
      ? LanguageType.ES
      : LanguageType.EN;
  String get oppositToLang =>
      _userLanguageKey.value == LanguageType.EN ? "A Español" : "To English";
  String get oppositFlag => _userLanguageKey.value == LanguageType.EN
      ? mexicoFlagAsset
      : usaFlagAsset;

  void changeUserLanguage([LanguageType? language]) {
    if (language == null) {
      if (_authController.user?.language == LanguageType.ES) {
        language = LanguageType.EN;
      } else {
        language = LanguageType.ES;
      }
      if (_authController.user != null) {
        // we need that because in case user clicked change lang from SideMenu , we really don't
        // need to execute that one because there is no user SIgnedIn yet!
        // we have to make some kind of queue that will handle stuff once the user SignedIn.
        _authController.changeLanguage(language);
      } else {
        // welse so we can still update the user language locally but not in db!
        _userLanguageKey.value = oppositLangKey;
      }
    } else if (_authController.user == null) {
      _userLanguageKey.value = language;
    }
  }

  void userLanguageChanged(LanguageType language) {
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
