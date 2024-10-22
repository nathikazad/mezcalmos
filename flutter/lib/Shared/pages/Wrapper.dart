// ignore_for_file: unawaited_futures

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/env.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['General'];

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SettingsController settingsController = Get.find<SettingsController>();
  AuthController authController = Get.find<AuthController>();
  final LocationController _locationController = Get.find<LocationController>();
  StreamSubscription<LocationPermissionsStatus>? locationStatusListener;
  Function? internetStatusDialog;
  InternetStatus? previousInternetStatus;
  //String? _previousUserUid = "init";

  @override
  void initState() {
    // this will execute first and much faster since it's a microtask.
    MezRouter.registerReturnToViewCallback(SharedRoutes.kWrapperRoute, () {
      mezDbgPrint("back in wrapper");
      authController.userRedirectFinish = false;
      handleAuthStateChange(authController.fireAuthUser);
    });
    Future<void>.microtask(() {
      mezDbgPrint(authController.fireAuthUser);
      mezDbgPrint("NOOOOOT stream auth state ======== ");
      handleAuthStateChange(authController.fireAuthUser);

      authController.authStateStream.listen((fireAuth.User? user) {
        mezDbgPrint("Frpm stream auth state ======== ");
        handleAuthStateChange(user);
      });
    }).then((_) {
      // only when we use location permissions
      if (_locationController.locationType != LocationPermissionType.None) {
        startListeningOnLocationPermission();
      }
    });
    Future.microtask(() => checkConnectivity());
    super.initState();
  }

  void checkConnectivity() {
    ConnectivityHelper.internetStatusStream
        .listen((InternetStatus currentInternetStatus) {
      // mezDbgPrint("Inside check connectivity");
      // if (internetStatus == InternetStatus.Offline) {
      //   if (!MezRouter.isCurrentRoute(SharedRoutes.kNoInternetRoute)) {
      //     mezDbgPrint("No internet going so going to no internet page");
      //     unawaited(MezRouter.toNamed(SharedRoutes.kNoInternetRoute));
      //   }
      // } else {
      //   if (MezRouter.isCurrentRoute(SharedRoutes.kNoInternetRoute)) {
      //     mezDbgPrint("Internet is back so going to back");
      //     MezRouter.back();
      //   }
      // }
      if (previousInternetStatus != currentInternetStatus) {
        if (internetStatusDialog != null) {
          internetStatusDialog!.call();
          internetStatusDialog = null;
        }
        if (currentInternetStatus == InternetStatus.Slow) {
          internetStatusDialog = BotToast.showText(
              text: _i18n()['slowInternet'], duration: Duration(days: 1));
        } else if (currentInternetStatus == InternetStatus.Offline) {
          internetStatusDialog = BotToast.showText(
              text: _i18n()['noInternet'], duration: Duration(days: 1));
        }
        previousInternetStatus = currentInternetStatus;
      }
    });
  }

  void startListeningOnLocationPermission() {
    locationStatusListener = _locationController
        .locationPermissionChecker()
        .distinct()
        .listen((LocationPermissionsStatus event) {
      mezDbgPrint("Wrapper lvl => $event");
      if (event != LocationPermissionsStatus.Ok) {
        //  bool preventDuplicates = true (byDefault om GetX)
        Future<void>.delayed(
          Duration(milliseconds: 500),
          () => MezRouter.toNamed(SharedRoutes.kLocationPermissionPage),
        );
      }
    });
  }

  @override
  void dispose() {
    locationStatusListener?.cancel();
    locationStatusListener = null;
    super.dispose();
  }

  // get FireAuth USer -> add _authStream
  //        ----
  //    -> getch user from hasura

  Future<void> handleAuthStateChange(fireAuth.User? user) async {
    // We should Priotorize the AppNeedsUpdate router to force users to update
    // if (!MezRouter.isCurrentRoute(SharedRoutes.kAppNeedsUpdate)) {
    mezDbgPrint(
        " 🔥 User redirect :=========>${authController.userRedirectFinish}");
    if (authController.userRedirectFinish == true) {
      return;
    }
    if (user == null) {
      mezDbgPrint("[777] user == null");
      if (AppType.Customer == MezEnv.appType) {
        mezDbgPrint("current route ======>>>>${MezRouter.currentRoute().name}");
        mezDbgPrint("[777] app = customerApp .. routing to home!");
        await MezRouter.popEverythingTillBeforeWrapper();

        MezRouter.toPath(SharedRoutes.kHomeRoute);

        Future.microtask(() async {
          mezDbgPrint("🈚️🈚️🈚️🈚️🈚️ ${GetStorage().read('uniqueId')}");

          if (GetStorage().read("uniqueId") != null &&
              GetStorage().read("redirected") == false) {
            final String? route = await get_service_provider_route(
                uniqueId: GetStorage().read("uniqueId"));
            if (route != null) {
              GetStorage().write("redirected", true);
              MezRouter.toPath(route);
            }
          }
        });
        // todo @sanchit
        // we check if unique id is set in local storage and redirected to false
        //    if yes we fetch the sp info and redirect the user the sp page and set redirected to true
      } else {
        mezDbgPrint(
            "😌😌😌😌😌😌 user is not signed to use the app user should sign in 😌😌😌😌");

        await MezRouter.popEverythingTillBeforeWrapper();
        await MezRouter.toPath(SharedRoutes.kSignInRoute);
      }
    } else {
      mezDbgPrint("[777] user != null");

      redirectIfUserInfosNotSet();
    }
    authController.userRedirectFinish = true;

    // }
  }

  void redirectIfUserInfosNotSet() {
    if ((!Get.find<AuthController>().isDisplayNameSet() ||
            !Get.find<AuthController>().isUserImgSet()) &&
        !MezRouter.isCurrentRoute(SharedRoutes.kUserWelcomeRoute)) {
      /* KEEEP THIS HERE FOR FUTURE REFRENCE
        We have so far 3 Scenarios here : 
        - The Current router is kOtpConfirmRoute :
          > this is basically when user Signs In using OTP and confirm :
            > the Navigation Stack is : kWrapper > kSignInRouteOptional > OtpSmsScreen > OtpConfirmationScreen
        - The Current router is kSignInRouteOptional :
          > this is basically when the user clicks signIn using Facebook / Apple :
            > the navigation Stack is : kWrapper > kSignInRouteOptional
        - The Current router is kWrapper:
          > this is when the user already was SignedIn and was on ProfileScreen but closes the App and re-open it or a upon a hot Restart
            > Nav stack is : kWrapper

        In All three Cases we should inject that kHomeRoute right after kWrapper then pop the rest off and push kUserProfile
        Where the nav stack should look like this : kWrapper > kHomeRoute > kUserProfile
        and since kUserProfile will gets poped only and only if the infos are well set, that way we are 100% sure to return to
        kHomeRoute with a valid User infos.

      */
      // We pop everything till wrapper and push kHomeRoute
      // MezRouter.offNamedUntil<void>(
      //     kHomeRoute, ModalRoute.withName(kWrapperRoute));

      // then we push kUserProfile on top of kHomeRoute
      MezRouter.toNamed(SharedRoutes.kUserWelcomeRoute);
      // now the Nav Stack is correct and looks like this :  wrapper > kuserwelcome
    } else {
      // if user has all infos set and a successfull SignIn then we proceed with the usual.
      checkIfSignInRouteOrRedirectToHome();
    }
  }

  void checkIfSignInRouteOrRedirectToHome() {
    if (MezRouter.isRouteInStack(SharedRoutes.kSignInAtOrderTimeRoute)) {
      mezDbgPrint("Trying to go back toooo");
      MezRouter.popTillInclusive(SharedRoutes.kSignInAtOrderTimeRoute);
    } else {
      if (!Get.currentRoute.contains('/messages/'))
        MezRouter.popEverythingTillBeforeWrapper().then((_) {
          mezDbgPrint("Going to home now");
          MezRouter.toNamed(SharedRoutes.kHomeRoute);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
