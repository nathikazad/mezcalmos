import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    mezDbgPrint("Wrapper: (::initState::)");
    Future.delayed(Duration.zero, () {
      mezDbgPrint("Wrapper: calling handleAuthStateChange first time");
      handleAuthStateChange(Get.find<AuthController>().fireAuthUser);
      Get.find<AuthController>().authStateChange.listen((user) {
        mezDbgPrint("Wrapper: calling handleAuthStateChange in listener");
        handleAuthStateChange(user);
      });
      Get.find<SettingsController>()
          .locationPermissionStream
          .distinct()
          .listen((locationPermission) {
        mezDbgPrint(
            "Wrapper: location permission => $locationPermission");
        if (locationPermission == false &&
            Get.currentRoute != kLocationPermissionPage) {
          Get.toNamed(kLocationPermissionPage);
        }
      });
    });
    super.initState();
  }

  void handleAuthStateChange(User? user) {
    mezDbgPrint("Wrapper: handleAuthStateChange $user");
    if (user == null) {
      mezDbgPrint("Wrapper::handleAuthStateChange:: going to sign in route");
      Get.offNamedUntil(kSignInRoute, ModalRoute.withName(kMainWrapper));
    } else {
      mezDbgPrint("Wrapper::handleAuthStateChange:: going to taxi wrapper");
      Get.offNamedUntil(kTaxiWrapperRoute, ModalRoute.withName(kMainWrapper));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
