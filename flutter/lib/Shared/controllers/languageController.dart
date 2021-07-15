import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class LanguageController extends GetxController {
  // default is english
  RxBool isAppInitialized = false.obs;
  RxString _userLanguageKey = tDefaultLanguage.obs;
  RxString _langFullName = "Español".obs;
  RxString _langImage = mexicoFlagAsset.obs;
  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}.obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController({String? lang}) {
    if (lang != null) this._userLanguageKey.value = lang;

    if (lang == "en") {
      _langFullName.value = "English";
      _langImage.value = mexicoFlagAsset;
    }
 
    // and :
    // we also set  jsonStrings depending on {this._userLanguageKey} value
  }

  String get userLanguageKey => _userLanguageKey.value;
  String get langFullName => _langFullName.value;
  String get langImage => _langImage.value;
  dynamic get strings => _jsonStrings[_userLanguageKey.value];
  String get oppositToLang => _userLanguageKey.value == "en" ? "A Español" : "To English";
  String get oppositFlag => _userLanguageKey.value == "en" ? mexicoFlagAsset : usaFlagAsset;

  void changeLang() {
    // This is not scalable XD  , when we add other languages must be changed.
    // but for simplicity reasons  i went for  this .
    if (_userLanguageKey.value == "es") {
      print("Language changed to English !");
      _userLanguageKey.value = "en";
      _langFullName.value = "English";
      _langImage.value = usaFlagAsset;
    }
    // in case  en or other languages set it always to english
    else {
      print("Language changed to Spanish !");
      _userLanguageKey.value = "es";
      _langFullName.value = "Español";
      _langImage.value = mexicoFlagAsset;
    }
  }

  @override
  void onInit() async {
    super.onInit();
     String enJson=  await rootBundle.loadString(enLang);
     String esJson= await rootBundle.loadString(esLang);
   _jsonStrings = <String,dynamic> {"en":jsonDecode(enJson)as Map<String,dynamic> ,"es":jsonDecode(esJson)as Map<String,dynamic>};
  }

  @override
  void dispose() {
    super.dispose();
  }
}
