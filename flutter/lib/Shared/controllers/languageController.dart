import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class LanguageController extends GetxController {
  // default is english
  RxBool isAppInitialized = false.obs;
  RxString _userLanguageKey = tDefaultLanguage.obs;
  RxString _langFullName = "English".obs;
  RxString _langImage = usaFlagAsset.obs;
  // jsonStrings will have:
  // {en : {}, es : {}}  <- so we avoid loading up each one onchanging lang
  dynamic _jsonStrings = {}.obs; // language Object by default  must be set to en if no lang given  in constructor.

  LanguageController({String? lang}) {
    if (lang != null) this._userLanguageKey.value = lang;

    if (lang == "es") {
      _langFullName.value = "Español";
      _langImage.value = mexicoFlagAsset;
    }
    // and :
    // we also set  jsonStrings depending on {this._userLanguageKey} value
  }

  String get userLanguageKey => _userLanguageKey.value;
  String get langFullName => _langFullName.value;
  String get langImage => _langImage.value;
  String get strings => _jsonStrings[_userLanguageKey.value];
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
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
