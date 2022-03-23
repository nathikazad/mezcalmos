import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/AppUpdate.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SettingsController settingsController = Get.find<SettingsController>();
  AuthController authController = Get.find<AuthController>();
  // AppVersionController _appVersionController = Get.find<AppVersionController>();

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
      // handleAppVersionUpdatesAndStartListener();
    });
    super.initState();
  }

  /// This parts Checks the snapshot at [AppVersionController.isNewVersionOut] if it is not null
  ///
  /// and then start a listener in case there there is updates.
  // void handleAppVersionUpdatesAndStartListener() {
  //   // first we check the snapshot
  //   checkIfNotInUpdateScreenAndPush(_appVersionController.appVersionInfos.value)
  //       .then((_) {
  //     // this listenr is distinct by the way.
  //     _appVersionController.appVersionInfos.stream.listen((updateType) async {
  //       await checkIfNotInUpdateScreenAndPush(updateType);
  //     });
  //   });
  // }

  Future<void> checkIfNotInUpdateScreenAndPush(
      AppUpdate? appVersionInfos) async {
    bool _diff = appVersionInfos?.areLocalAndRemoteVersionsDiffrent() == true;
    if (Get.currentRoute == kAppNeedsUpdate && !_diff) {
      Get.back();
    } else if (Get.currentRoute != kAppNeedsUpdate && _diff) {
      await Get.toNamed(kAppNeedsUpdate);
    }
  }

  void handleAuthStateChange(fireAuth.User? user) async {
    // We should Priotorize the AppNeedsUpdate route to force users to update
    if (Get.currentRoute != kAppNeedsUpdate) {
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
    } else {
      if (authController.user != null) {
        redirectIfUserInfosNotSet();
      } else {
        startListeningForUserModelChanges();
      }
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
      /* KEEEP THIS HERE FOR FUTURE REFRENCE
      
        We have so far 3 Scenarios here : 
        - The Current route is kOtpConfirmRoute :
          > this is basically when user Signs In using OTP and confirm :
            > the Navigation Stack is : kWrapper > kSignInRouteOptional > OtpSmsScreen > OtpConfirmationScreen
        - The Current route is kSignInRouteOptional :
          > this is basically when the user clicks signIn using Facebook / Apple :
            > the navigation Stack is : kWrapper > kSignInRouteOptional
        - The Current route is kWrapper:
          > this is when the user already was SignedIn and was on ProfileScreen but closes the App and re-open it or a upon a hot Restart
            > Nav stack is : kWrapper


        In All three Cases we should inject that kHomeRoute right after kWrapper then pop the rest off and push kUserProfile
        Where the nav stack should look like this : kWrapper > kHomeRoute > kUserProfile
        and since kUserProfile will gets poped only and only if the infos are well set, that way we are 100% sure to return to
        kHomeRoute with a valid User infos.

       */
      // We pop everything till wrapper and push kHomeRoute
      Get.offNamedUntil(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      // then we push kUserProfile on top of kHomeRoute
      Get.toNamed(kUserProfile);
      // now the Nav Stack is correct and looks like this :  wrapper > kHomeRoute > kUserProfile
    } else {
      // if user has all infos set and a successfull SignIn then we proceed with the usual.
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
