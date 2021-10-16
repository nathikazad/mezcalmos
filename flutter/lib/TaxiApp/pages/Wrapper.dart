import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
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
    mezDbgPrint("Inside Wrapper(::initState::)");
    Future.delayed(Duration.zero, () {
      Get.find<AuthController>().authStateChange.listen((user) {
        mezDbgPrint("Inside Wrapper(::authStateChangeListener::) => $user");
        handleSignIn(user);
      });
      Get.find<SettingsController>()
          .locationPermissionStream
          .distinct()
          .listen((locationPermission) {
        mezDbgPrint(
            "Inside Wrapper(::locationListener::) => $locationPermission");
        if (locationPermission == false &&
            Get.currentRoute != kLocationPermissionPage) {
          Get.toNamed(kLocationPermissionPage);
        }
      });
    });
    super.initState();
  }

  void handleSignIn(User? user) {
    mezDbgPrint("Handling user sign in");
    if (user == null) {
      mezDbgPrint("going to sign in route");
      Get.offNamedUntil(kSignInRoute, ModalRoute.withName(kMainWrapper));
    } else {
      mezDbgPrint("going to taxi wrapper");
      Get.offNamedUntil(kTaxiWrapperRoute, ModalRoute.withName(kMainWrapper));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
