import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SettingsController settingsController = Get.find<SettingsController>();
  late bool databaseUserLastSnapshot;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      handleAuthStateChange(Get.find<AuthController>().fireAuthUser);
      Get.find<AuthController>().authStateStream.listen((user) {
        handleAuthStateChange(user);
      });
    });
    super.initState();
  }

  void handleAuthStateChange(fireAuth.User? user) async {
    if (user == null) {
      if (AppType.CustomerApp == settingsController.appType) {
        // if (Get.currentRoute != kSignInRouteOptional) {
        Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      } else {
        Get.offNamedUntil(
            kSignInRouteRequired, ModalRoute.withName(kWrapperRoute));
      }
    } else {
      if (Get.find<AuthController>().user != null) {
        redirectIfUserInfosNotSet();
      } else
        startListeningForUserModelChanges();
    }
  }

  void startListeningForUserModelChanges() {
    Get.find<AuthController>().userInfoStream.first.then((event) {
      redirectIfUserInfosNotSet();
    });
  }

  void redirectIfUserInfosNotSet() {
    if ((!Get.find<AuthController>().isDisplayNameSet() ||
            !Get.find<AuthController>().isUserImgSet()) &&
        Get.currentRoute != kUserProfile) {
      if (Get.currentRoute == kSignInRouteOptional) {
        Get.offNamed(kUserProfile);
      } else
        Get.toNamed(kUserProfile);
    } else {
      checkIfSignInRouteOrRedirectToHome();
    }
  }

  void checkIfSignInRouteOrRedirectToHome() {
    if (Get.currentRoute == kSignInRouteOptional) {
      Get.back();
    } else {
      Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
