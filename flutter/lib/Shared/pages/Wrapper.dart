import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthController _authController = Get.find<AuthController>();

  @override
  void dispose() {
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

  void handleAuthStateChange(fireAuth.User? user) async {
    mezDbgPrint("Wrapper: handleAuthStateChange $user");
    if (user == null) {
      mezDbgPrint("Wrapper::handleAuthStateChange:: going to sign in route");
      Get.offNamedUntil(kSignInRoute, ModalRoute.withName(kWrapperRoute));
    } else {
      mezDbgPrint(
          "Wrapper::handleAuthStateChange:: signed in, Checking if User name are Set !");
      mezDbgPrint(Get.find<AuthController>().user?.displayName);
      mezDbgPrint("--------------------------------");
      mezDbgPrint(Get.find<AuthController>().fireAuthUser?.displayName);

      if (!Get.find<AuthController>().isDisplayNameSet()) {
        mezDbgPrint(
            "User Signed in but Name or image are null , so  heading to UserInfo Page !");
        await Get.toNamed(kUserProfile);
        // Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      }
      Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
