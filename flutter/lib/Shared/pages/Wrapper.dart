import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SettingsController settingsController = Get.find<SettingsController>();
  StreamSubscription? userInfoChangeListener;
  @override
  void dispose() {
    userInfoChangeListener?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    mezDbgPrint("Wrapper: (::initState::)");
    Future.delayed(Duration.zero, () {
      mezDbgPrint("Wrapper: calling handleAuthStateChange first time");
      handleAuthStateChange(Get.find<AuthController>().fireAuthUser);
      Get.find<AuthController>().authStateStream.listen((user) {
        mezDbgPrint("Wrapper: calling handleAuthStateChange in listener");
        handleAuthStateChange(user);
      });
    });
    super.initState();
  }

  void handleAuthStateChange(fireAuth.User? user) async {
    mezDbgPrint(
        "Wrapper: handleAuthStateChange $user and the app type is ${settingsController.appType}");
    if (user == null) {
      if (AppType.CustomerApp == settingsController.appType) {
        // if (Get.currentRoute != kSignInRouteOptional) {
        Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      } else {
        mezDbgPrint("Wrapper::handleAuthStateChange:: going to sign in route");
        Get.offNamedUntil(
            kSignInRouteRequired, ModalRoute.withName(kWrapperRoute));
      }
    } else {
      mezDbgPrint(
          "Wrapper::handleAuthStateChange:: signed in, Checking if User name are Set !");

      if (Get.currentRoute == kSignInRouteOptional) {
        Get.back();
      } else {
        Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      }

      // if (Get.find<AuthController>().user != null) {
      //   if (!Get.find<AuthController>().isDisplayNameSet()) {
      //     await Get.toNamed(kUserProfile);
      //   }
      // }

      userInfoChangeListener =
          Get.find<AuthController>().userInfoStream.listen((event) {
        if (!Get.find<AuthController>().isDisplayNameSet()) {
          Get.toNamed(kUserProfile);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
