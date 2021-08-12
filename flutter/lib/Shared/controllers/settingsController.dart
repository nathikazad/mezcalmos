import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  RxBool showCustomersMessages = true.obs;
  RxBool hasLocationPermissions = false.obs;

  @override
  void onInit() async {
    // TODO : ADD CHECK IF THERE IS STORED LANGUAGE IN LOCAL ALREADY
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDraweController(), permanent: false);

    // this is to make sure that the use already Granted the App the permission to use the location !
    PermissionStatus _tempLoca = await Location().hasPermission();
    print(
        "-------------> SettingsController :: onInit :: LocationPermissionStatus :: $_tempLoca");
    if (_tempLoca == PermissionStatus.granted ||
        _tempLoca == PermissionStatus.grantedLimited) {
      hasLocationPermissions.value = true;
    }

    super.onInit();
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
