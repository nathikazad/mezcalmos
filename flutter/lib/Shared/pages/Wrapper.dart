import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  StreamSubscription<bool>? _locationStreamSub;
  StreamSubscription<fireAuth.User?>? _userStreamSub;

  @override
  void dispose() {
    _locationStreamSub?.cancel();
    _userStreamSub?.cancel();
    super.dispose();
  }

  void initState() {
    mezDbgPrint("Wrapper: (::initState::)");
    Future.delayed(Duration.zero, () {
      mezDbgPrint("Wrapper: calling handleAuthStateChange first time");
      handleAuthStateChange(Get.find<AuthController>().fireAuthUser);
      Get.find<AuthController>().authStateChange.listen((user) {
        mezDbgPrint("Wrapper: calling handleAuthStateChange in listener");
        handleAuthStateChange(user);
      });
    });
    super.initState();
  }

  void handleAuthStateChange(fireAuth.User? user) {
    mezDbgPrint("Wrapper: handleAuthStateChange $user");
    if (user == null) {
      _locationStreamSub?.cancel();
      _locationStreamSub = null;
      mezDbgPrint("Wrapper::handleAuthStateChange:: going to sign in route");
      Get.offNamedUntil(kSignInRoute, ModalRoute.withName(kWrapperRoute));
    } else {
      mezDbgPrint(
          "Wrapper::handleAuthStateChange:: signed in, so going to taxi wrapper !");
      Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      mezDbgPrint(
          "Wrapper::handleAuthStateChange:: setting location handler !");
      _locationStreamSub?.cancel();
      _locationStreamSub = Get.find<SettingsController>()
          .locationPermissionStream
          .distinct()
          .listen((locationPermission) {
        mezDbgPrint("Wrapper: location permission => $locationPermission");
        if (locationPermission == false &&
            Get.currentRoute != kLocationPermissionPage) {
          Get.toNamed(kLocationPermissionPage);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
