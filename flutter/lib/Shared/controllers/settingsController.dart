import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;

  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  late Rx<bool> hasLocationPermissions;

  @override
  void onInit() async {
    // TODO : ADD CHECK IF THERE IS STORED LANGUAGE IN LOCAL ALREADY
    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDraweController(), permanent: false);

    PermissionStatus _tempLoca = await Location().hasPermission();
    hasLocationPermissions = Rx(_tempLoca == PermissionStatus.granted ||
        _tempLoca == PermissionStatus.grantedLimited);

    Timer.periodic(Duration(seconds: 5), (t) async {
      PermissionStatus permissionStatus = await Location().hasPermission();
      hasLocationPermissions.value =
          (permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.grantedLimited);

      mezDbgPrint(
          "SettingsController::Checking LocationPermissions .. ${hasLocationPermissions.value}!");
    });

    // this is to make sure that the use already Granted the App the permission to use the location !

    super.onInit();
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
