import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/ConnectivityHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SettingsController settingsController = Get.find<SettingsController>();
  AuthController authController = Get.find<AuthController>();
  AppVersionController? _appVersionController;
  late bool databaseUserLastSnapshot;
  final LocationController _locationController = Get.find<LocationController>();
  StreamSubscription<LocationPermissionsStatus>? locationStatusListener;

  @override
  void initState() {
    // this will execute first and much faster since it's a microtask.
    Future<void>.microtask(() {
      handleAuthStateChange(authController.fireAuthUser);
      authController.authStateStream.listen((fireAuth.User? user) {
        handleAuthStateChange(user);
      });
    }).then((_) {
      // only when we use location permissions
      if (_locationController.locationType != LocationPermissionType.None) {
        startListeningOnLocationPermission();
      }

      // then check if we're in prod - check appUpdate
      if (getAppLaunchMode() == AppLaunchMode.prod) {
        // Create instance of our Singleton AappVersionController class.
        _appVersionController = AppVersionController.instance(
          onNewUpdateAvailable: _onNewUpdateAvailable,
        );
        // Delayed init of the appVersionController - that way we make sure that the NavigationStack is correct,
        // Which makes it easy for us to push NeedUpdateScreen on top in case there is update.
        Future<void>.delayed(Duration(seconds: 2), _appVersionController!.init);
      }
    });
    Future.delayed(Duration.zero, checkConnectivity);
    super.initState();
  }

  void checkConnectivity() {
    ConnectivityHelper.instance.networkCheck();
    ConnectivityHelper.internetStatusStream
        .listen((InternetStatus internetStatus) {
      // mezDbgPrint(internetStatus);
      if (internetStatus == InternetStatus.Offline) {
        if (!isCurrentRoute(kNoInternetRoute)) {
          mezDbgPrint("No internet going so going to no internet page");
          unawaited(MezRouter.toNamed<void>(kNoInternetRoute));
        }
      } else {
        if (isCurrentRoute(kNoInternetRoute)) {
          mezDbgPrint("Internet is back so going to back");
          MezRouter.back<Null>();
        }
      }

      if (internetStatus == InternetStatus.Slow) {
        mezDbgPrint("Slow Internet");
        // @montasarre
        // show temporary slow internet bar
      } else {
        // unshow temporary slow internet bar
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
          () => MezRouter.toNamed<void>(kLocationPermissionPage),
        );
      }
    });
  }

  @override
  void dispose() {
    _appVersionController?.dispose();
    locationStatusListener?.cancel();
    locationStatusListener = null;
    super.dispose();
  }

  /// Called each time there is a new update.
  void _onNewUpdateAvailable(UpdateType updateType, VersionStatus status) {
    switch (updateType) {
      case UpdateType.Null:
      case UpdateType.Patches:
        MezUpdaterDialog.show(
          context: context,
          onUpdateClicked: _appVersionController!.openStoreAppPage,
        );
        break;
      default:
        // Major/Minor - forcing the app to stay in AppNeedsUpdate
        MezRouter.toNamed<void>(
          kAppNeedsUpdate,
          arguments: <String, dynamic>{
            "versionStatus": status,
          },
        );
    }
  }

  // get FireAuth USer -> add _authStream
  //        ----
  //    -> getch user from hasura

  Future<void> handleAuthStateChange(fireAuth.User? user) async {
    // We should Priotorize the AppNeedsUpdate route to force users to update
    if (!isCurrentRoute(kAppNeedsUpdate)) {
      if (user == null) {
        mezDbgPrint("[777] user == null");
        if (AppType.CustomerApp == settingsController.appType) {
          mezDbgPrint("[777] app = customerApp .. routing to home!");
          await MezRouter.offNamedUntil<void>(
              kHomeRoute, ModalRoute.withName(kWrapperRoute));
        } else {
          await MezRouter.offNamedUntil<void>(
            kSignInRouteRequired,
            ModalRoute.withName(kWrapperRoute),
          );
        }
      } else {
        mezDbgPrint("[777] user != null");

        redirectIfUserInfosNotSet();
      }
    }
  }

  void redirectIfUserInfosNotSet() {
    if ((!Get.find<AuthController>().isDisplayNameSet() ||
            !Get.find<AuthController>().isUserImgSet()) &&
        !isCurrentRoute(kUserWelcomeRoute)) {
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
      // MezRouter.offNamedUntil<void>(
      //     kHomeRoute, ModalRoute.withName(kWrapperRoute));

      // then we push kUserProfile on top of kHomeRoute
      MezRouter.toNamed<void>(kUserWelcomeRoute);
      // now the Nav Stack is correct and looks like this :  wrapper > kuserwelcome
    } else {
      // if user has all infos set and a successfull SignIn then we proceed with the usual.
      checkIfSignInRouteOrRedirectToHome();
    }
  }

  void checkIfSignInRouteOrRedirectToHome() {
    if (authController.preserveNavigationStackAfterSignIn)
      MezRouter.untill((Route<dynamic> route) =>
          route.settings.name == kSignInRouteOptional);

    if (isCurrentRoute(kSignInRouteOptional)) {
      MezRouter.back<void>();
    } else {
      if (!Get.currentRoute.contains('/messages/'))
        MezRouter.offNamedUntil<void>(
            kHomeRoute, ModalRoute.withName(kWrapperRoute));
    }
    authController.preserveNavigationStackAfterSignIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
