import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
// import 'package:mezcalmos/TaxiApp/pages/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/UnauthorizedScreen.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // Locale userLocale = Localizations.localeOf(context);
    // print(userLocale.toString());
    // Get.find<LanguageController>().changeUserLanguage(userLocale.languageCode);
    Get.lazyPut(() => TaxiAuthController());
    Get.lazyPut(() => DeviceNotificationsController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBNotificationsController());
    SettingsController _settingsController = Get.find<SettingsController>();

    return Obx(() {
      if (controller.user != null) {
        // Injecting TaxiAuthController Here so we can get it as Widget in TaxiWrapper
        return _settingsController.hasLocationPermissions.value == false
            ? LocationPermissionScreen()
            : TaxiWrapper();
      } else
        return SignIn();
    });
  }
}
