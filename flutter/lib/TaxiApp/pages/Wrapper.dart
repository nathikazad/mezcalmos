import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsController _settingsController = Get.find<SettingsController>();
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (_, AsyncSnapshot<User?> snapUser) {
              if (snapUser.data == null) {
                return SignIn();
              } else {
                // return Obx(() {
                  if (_settingsController.hasLocationPermissions.value == false)
                    return LocationPermissionScreen();
                  else {
                    mezDbgPrint("Init Taxi Wrapper");
                    return TaxiWrapper();
                  }
                // });
              }
            }));
  }
}
