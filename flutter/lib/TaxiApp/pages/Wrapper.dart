import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';

// import 'package:mezcalmos/TaxiApp/pages/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/UnauthorizedScreen.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    // Locale userLocale = Localizations.localeOf(context);
    // print(userLocale.toString());
    SettingsController _settingsController = Get.find<SettingsController>();
    return Obx(() {
      if (controller.user != null) {
        Get.put(SideMenuDraweController(), permanent: false);

        if (_settingsController.hasLocationPermissions.value == false &&
            Get.arguments != true)
          _settingsController.hasLocationPermissions.value = true;

        return _settingsController.hasLocationPermissions.value
            ? TaxiWrapper()
            : LocationPermissionScreen();
      } else
        return SignIn();
    });
  }
}
