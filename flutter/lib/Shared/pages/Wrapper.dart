import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/appVersionController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/MezUpdateHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezUpgrader/MezUpgraderWidget.dart';
import 'package:new_version/new_version.dart';

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
      authController.authStateStream.listen((user) {
        handleAuthStateChange(user);
      });
    }).then((_) {
      // only when we use location permissions
      if (_locationController.locationType != LocationPermissionType.Null) {
        startListeningOnLocationPermission();
      }

      // then check if we're in prod - check appUpdate
      if (GetStorage().read<String>(getxLmodeKey) == "prod") {
        // Create instance of our Singleton AappVersionController class.
        _appVersionController = AppVersionController.instance(
          onNewUpdateAvailable: _onNewUpdateAvailable,
        );
        // Delayed init of the appVersionController - that way we make sure that the NavigationStack is correct,
        // Which makes it easy for us to push NeedUpdateScreen on top in case there is update.
        Future<void>.delayed(Duration(seconds: 2), _appVersionController!.init);
      }
    });

    super.initState();
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
          () => Get.toNamed<void>(kLocationPermissionPage),
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
      case UpdateType.Major:
        Get.toNamed<void>(
          kAppNeedsUpdate,
          arguments: <String, dynamic>{
            "updateType": updateType,
            "versionStatus": status,
          },
        );
        break;
      case UpdateType.Minor:
        if (Platform.isAndroid) {
          Get.toNamed<void>(
            kAppNeedsUpdate,
            arguments: <String, dynamic>{
              "updateType": updateType,
              "versionStatus": status,
            },
          );
        } else if (Platform.isIOS) {
          MezUpgrade.show(
            releaseNotes: status.releaseNotes!,
            appName: getAppName(),
            packageName: getPackageName()!,
            currentAppStoreVersion: status.storeVersion,
            currentInstalledVersion: status.localVersion,
          );
        }
        break;
      case UpdateType.Patches:
        if (Platform.isIOS) {
          MezUpgrade.show(
            releaseNotes: status.releaseNotes!,
            appName: getAppName(),
            packageName: getPackageName()!,
            currentAppStoreVersion: status.storeVersion,
            currentInstalledVersion: status.localVersion,
          );
        } else if (Platform.isAndroid) {
          MezInAppUpdate.startFlexibleUpdate().then((_) {
            MezInAppUpdate.completeFlexibleUpdate();
            debugPrint("Success!");
          }).catchError((Object? e) {
            debugPrint("Error:completeFlexibleUpdate ${e.toString()}");
          });
        }
        break;
      case UpdateType.Null:
      default:
    }
  }

  void handleAuthStateChange(fireAuth.User? user) {
    // We should Priotorize the AppNeedsUpdate route to force users to update
    if (Get.currentRoute != kAppNeedsUpdate) {
      if (user == null) {
        if (AppType.CustomerApp == settingsController.appType) {
          // if (Get.currentRoute != kSignInRouteOptional) {
          Get.offNamedUntil<void>(
              kHomeRoute, ModalRoute.withName(kWrapperRoute));
        } else {
          Get.offNamedUntil<void>(
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
      Get.offNamedUntil<void>(kHomeRoute, ModalRoute.withName(kWrapperRoute));
      // then we push kUserProfile on top of kHomeRoute
      Get.toNamed<void>(kUserProfile);
      // now the Nav Stack is correct and looks like this :  wrapper > kHomeRoute > kUserProfile
    } else {
      // if user has all infos set and a successfull SignIn then we proceed with the usual.
      checkIfSignInRouteOrRedirectToHome();
    }
  }

  void checkIfSignInRouteOrRedirectToHome() {
    if (Get.currentRoute == kSignInRouteOptional) {
      Get.back<void>();
    } else {
      Get.offNamedUntil<void>(kHomeRoute, ModalRoute.withName(kWrapperRoute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MezLogoAnimation(centered: true));
  }
}
