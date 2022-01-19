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

  @override
  void dispose() {
    super.dispose();
  }

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
    });
    super.initState();
  }

  void handleAuthStateChange(fireAuth.User? user) async {
    mezDbgPrint(
        "Wrapper: handleAuthStateChange ${user?.displayName} and the app type is ${settingsController.appType}");
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

      mezDbgPrint(
          "~~~~+++++===>>>> the first condition ${!Get.find<AuthController>().isDisplayNameSet()} and the second condition ${Get.find<AuthController>().user?.image == "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d"} ");
      if (!Get.find<AuthController>().isDisplayNameSet() ||
          Get.find<AuthController>().user?.image ==
              "https://firebasestorage.googleapis.com/v0/b/mezcalmos-31f1c.appspot.com/o/logo%402x.png?alt=media&token=4a18a710-e267-40fd-8da7-8c12423cc56d") {
        await Get.toNamed(kUserProfile);
      }
      if (Get.currentRoute == kSignInRouteOptional) {
        Get.back();
      } else {
        Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
