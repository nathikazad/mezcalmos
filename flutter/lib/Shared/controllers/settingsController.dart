import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';

class SettingsController extends GetxController {

  RxBool _isAppInitialized  = false.obs;

  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;


  ThemeController get appTheme              => _appTheme; 
  LanguageController get appLanguage        => _appLanguage; 

  bool get isAppInitialized                 => _isAppInitialized.value;
  void set isAppInitialized(bool newValue)  => _isAppInitialized.value = newValue;

  @override
  void onInit() {
    super.onInit();
    _appTheme     = Get.put(ThemeController() , permanent: true);
    _appLanguage  = Get.put(LanguageController() , permanent: true);
  }


  
  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
