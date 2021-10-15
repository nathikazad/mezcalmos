import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/pages/LocationPermissionScreen.dart';

import 'package:mezcalmos/CustomerApp/pages/CustomerWrapper.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    SettingsController _settingsController = Get.find<SettingsController>();
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, AsyncSnapshot<User?> snapUser) {
          if (snapUser.data == null) {
            return SignIn();
          } else {
            if (_settingsController.hasLocationPermissions.value == false)
              return LocationPermissionScreen();
            else {
              print("init customer wrapper");
              return CustomerWrapper();
            }
          }
        });
  }
}
