import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  @override
  void onInit() {
    super.onInit();
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
