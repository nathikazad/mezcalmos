import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
// import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/controllers/themeContoller.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

enum AppName { TaxiApp, CustomerApp, RestaurantApp }
AppName convertStringToAppName(String str) {
  return AppName.values.firstWhere((e) => e.toString().split('.').last == str);
}

class SettingsController extends GetxController {
  late final ThemeController _appTheme;
  late final LanguageController _appLanguage;
  // String appName;
  late AppName appName;
  ThemeController get appTheme => _appTheme;
  LanguageController get appLanguage => _appLanguage;

  StreamController<bool> _hasLocationPermissionStreamController =
      StreamController<bool>();

  Stream<bool> get locationPermissionStream =>
      _hasLocationPermissionStreamController.stream;

  SettingsController(String appName) {
    this.appName = convertStringToAppName(appName);
  }
  
  @override
  void onInit() async {
    super.onInit();

    // here --------
    // FOR NOW WE SET IT TO EN (default  if not passed to LangController)
    _appTheme = Get.put(ThemeController(), permanent: true);
    _appLanguage = Get.put(LanguageController(), permanent: true);
    Get.put(SideMenuDraweController(), permanent: false);

    bool locationPermission = await _getLocationPermission();
    _hasLocationPermissionStreamController.add(locationPermission);
    mezDbgPrint(
        "SettingsController::Checking LocationPermissions .. $locationPermission!");

    Timer.periodic(Duration(seconds: 5), (timer) async {
      bool locationPermission = await _getLocationPermission();
      _hasLocationPermissionStreamController.add(locationPermission);
      // mezDbgPrint(
      //     "SettingsController::Checking LocationPermissions .. ${locationPermission}!");
    });

    // this is to make sure that the use already Granted the App the permission to use the location !
  }

  Future<bool> _getLocationPermission() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) return false;
    PermissionStatus _tempLoca = await Location().hasPermission();
    // mezDbgPrint(_tempLoca);
    return _tempLoca == PermissionStatus.granted;
  }

  @override
  void dispose() {
    _appTheme.dispose();
    _appLanguage.dispose();
    super.dispose();
  }
}
