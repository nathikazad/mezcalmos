import 'dart:async';
import 'dart:io';

// import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:permission_handler/permission_handler.dart';

typedef void OnLocationPermissionChange(LocationPermissionsStatus? status);
typedef String? LangValueRefGetter();

class LocationPermissionController {
  final LocationController locationController = Get.find<LocationController>();
  StreamSubscription<LocationPermissionsStatus?>? locationStatusListener;

  // AndroidSdkVersion in case OS is android.
  int? androidSdkVersion;
  // LocationPermissionsStatus? _statusSnapshot;

  // inti of our controller.
  void init(
      {required OnLocationPermissionChange onLocationPermissionsStatusChange,
      required Function initialAndroidBodyTextSetter,
      required Function initialIosBodyTextSetter,
      required Function initialWebBodyTextSetter}) {
    // first time execution.
    _setInitialPermissionsAskingText(initialIosBodyTextSetter,
            initialAndroidBodyTextSetter, initialWebBodyTextSetter)
        .then((_) {
      onLocationPermissionsStatusChange(
        locationController.statusSnapshot.value,
      );
    });
    // then start listening on snapshot.
    locationStatusListener = locationController.statusSnapshot.stream
        .listen((LocationPermissionsStatus? statusEvent) async {
      if (statusEvent == LocationPermissionsStatus.Ok) {
        dispose();
        Future<void>.delayed(Duration.zero, () => MezRouter.back());
      }

      onLocationPermissionsStatusChange(statusEvent);
    });
  }

  /// Checks OS tpye if iOS [_updateIosPermissionAskingText] / Android [_updateAndroidPermissionAskingText].
  ///
  /// Then sets Text Depending on SDK version if android.
  Future<void> _setInitialPermissionsAskingText(Function iosTextSetter,
      Function androidTextSetter, Function webTextSetter) async {
    if (kIsWeb) {
      webTextSetter();
    } else {
      if (Platform.isAndroid) {
        // Handling if Android android
        if (androidSdkVersion == null) {
          androidSdkVersion = await getAndroidSdkVersion();
          mezDbgPrint("viewController@adnroidSdkVersion => $androidSdkVersion");
          androidTextSetter();
        }
      } else if (Platform.isIOS) {
        // Handling if Android android
        iosTextSetter();
      }
    }
  }

  void dispose() {
    locationStatusListener?.cancel();
    locationStatusListener = null;
  }

  Future<void> onGivePermissionsClick() async {
    final Location _loc = Location();
    mezDbgPrint(
        "locationController.statusSnapshot.value ==> ${locationController.statusSnapshot.value}");
    // cehcking service first
    if (locationController.statusSnapshot.value ==
        LocationPermissionsStatus.ServiceOff) {
      if (!await _loc.requestService())
        return;
      else {
        Future<void>.delayed(Duration(milliseconds: 500), () {
          mezDbgPrint(
              "New Status : ${locationController.statusSnapshot.value}");
        });
      }
    }

    if (locationController.statusSnapshot.value ==
        LocationPermissionsStatus.ForeverDenied) {
      await openAppSettings();
      // await AppSettings.openLocationSettings();

      return;
    }

    final bool _isAndroid11 =
        androidSdkVersion != null && androidSdkVersion! >= 30;
    // in iOS or Android 11+ case if the user clicks Dont allow which is (Denied) , when user re-clicks button,
    // he does not get the dialog poped up again, natively hadnled, thus we add this line :

    // if ((Platform.isIOS || _isAndroid11) &&
    //     locationController.statusSnapshot.value ==
    //         LocationPermissionsStatus.Denied) {
    //   await openAppSettings();
    //   return;
    // }

    // Checking if android
    if (!kIsWeb && Platform.isAndroid) {
      if (locationController.locationType ==
              LocationPermissionType.ForegroundAndBackground &&
          _isAndroid11) {
        // check if sdk 11 - background location needs manual accept
        // we redirect to
        await openAppSettings();
        // await AppSettings.openLocationSettings();
        return;
      }
    }

    // rest just request is enough.
    await _loc.requestPermission();
  }
}
