import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PlatformOSHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:permission_handler/permission_handler.dart'
    show openAppSettings;

typedef void OnLocationPermissionChange(LocationPermissionsStatus? status);
typedef String? LangValueRefGetter();

class LocationPermissionController {
  final LocationController locationController = Get.find<LocationController>();
  StreamSubscription<LocationPermissionsStatus?>? locationStatusListener;

  // Text Shown to the user in the center of the body
  Rxn<LangValueRefGetter> _askPermissionsText = Rxn<LangValueRefGetter>();
  String? get askPermissionsText => _askPermissionsText.value?.call();
  void setAskPermissionsTextByRefrence(LangValueRefGetter? textPointer) {
    _askPermissionsText.value = Rxn<LangValueRefGetter>(textPointer).value;
  }

  // Text Shown to the user when there is an error granting permissions to app
  Rxn<LangValueRefGetter> _errorText = Rxn<LangValueRefGetter>();
  String? get errorText => _errorText.value?.call();
  void setErrorTextByRefrence(LangValueRefGetter? errorPtr) {
    _errorText.value = Rxn<LangValueRefGetter>(errorPtr).value;
  }

  // AndroidSdkVersion in case OS is android.
  int? adnroidSdkVersion;
  // LocationPermissionsStatus? _statusSnapshot;

  // inti of our controller.
  void init({
    required OnLocationPermissionChange onLocationPermissionsStatusChange,
    required Function initialAndroidBodyTextSetter,
    required Function initialIosBodyTextSetter,
  }) {
    // first time execution.
    _setInitialPermissionsAskingText(
      initialIosBodyTextSetter,
      initialAndroidBodyTextSetter,
    ).then((_) {
      onLocationPermissionsStatusChange(
        locationController.statusSnapshot.value,
      );
    });
    // then start listening on snapshot.
    locationStatusListener = locationController.statusSnapshot.stream
        .listen((LocationPermissionsStatus? statusEvent) async {
      if (statusEvent == LocationPermissionsStatus.Ok) {
        dispose();
        Future<void>.delayed(Duration.zero, () => Get.back<void>());
      }

      // _statusSnapshot = statusEvent;
      // we check if Initial Text is not set , we set it depending on OS and Type of Permissions asked.
      if (_askPermissionsText == null)
        await _setInitialPermissionsAskingText(
          initialIosBodyTextSetter,
          initialAndroidBodyTextSetter,
        );

      onLocationPermissionsStatusChange(statusEvent);
    });
  }

  /// Checks OS tpye if iOS [_updateIosPermissionAskingText] / Android [_updateAndroidPermissionAskingText].
  ///
  /// Then sets Text Depending on SDK version if android.
  Future<void> _setInitialPermissionsAskingText(
      Function iosTextSetter, Function androidTextSetter) async {
    if (Platform.isAndroid) {
      // Handling if Android android
      if (adnroidSdkVersion == null) {
        adnroidSdkVersion = await getAndroidSdkVersion();
        mezDbgPrint("viewController@adnroidSdkVersion => $adnroidSdkVersion");
        androidTextSetter();
      }
    } else if (Platform.isIOS) {
      // Handling if Android android
      iosTextSetter();
    }
  }

  void dispose() {
    locationStatusListener?.cancel();
    locationStatusListener = null;
  }

  Future<void> onGivePermissionsClick() async {
    final Location _loc = Location();

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
        LocationPermissionsStatus.ForeeverDenied) {
      await openAppSettings();
      return;
    }

    // Checking if android
    if (Platform.isAndroid) {
      if (locationController.locationType ==
              LocationPermissionType.ForegroundAndBackground &&
          adnroidSdkVersion == 30) {
        // check if sdk 11 - background location needs manual accept
        // we redirect to
        await openAppSettings();
        return;
      }
    }
    // rest just request is enough.
    await _loc.requestPermission();

    // in iOS case if the user clicks Dont allow which is (Denied) , when user re-clicks button, he does not get the dialog poped up again.
    // natively hadnled, thus we add this line :
    if (Platform.isIOS &&
        locationController.statusSnapshot.value ==
            LocationPermissionsStatus.Denied) {
      await openAppSettings();
    }
  }
}
