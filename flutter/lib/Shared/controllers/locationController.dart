// ignore_for_file: always_specify_types

import 'dart:async';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class LocationController extends GetxController {
  final LocationPermissionType locationType;
  Rxn<LocationPermissionsStatus> statusSnapshot = Rxn();

  LocationController({required this.locationType});

  Future<LocationPermissionsStatus> serviceIsOff() {
    statusSnapshot.value = LocationPermissionsStatus.ServiceOff;
    return Future.value(statusSnapshot.value);
  }

  // handle foreground Cases.
  Future<LocationPermissionsStatus> _handleForegroundLocation() async {
    // Allow while in app use.

    // if Service is not enabled , we request Service and check the result if service is anabled or not.
    if (!await Location().serviceEnabled()) {
      return serviceIsOff();
    }
    // Checking if app has permissions
    final PermissionStatus _status = await Location().hasPermission();

    switch (_status) {
      case PermissionStatus.denied:
        statusSnapshot.value = LocationPermissionsStatus.Denied;
        mezDbgPrint(statusSnapshot.value);
        return Future.value(statusSnapshot.value);
      case PermissionStatus.deniedForever:
        statusSnapshot.value = LocationPermissionsStatus.ForeeverDenied;
        mezDbgPrint(statusSnapshot.value);

        return Future.value(statusSnapshot.value);
      case PermissionStatus.grantedLimited:
        statusSnapshot.value = LocationPermissionsStatus.Ok;
        mezDbgPrint(statusSnapshot.value);

        return Future.value(statusSnapshot.value);
      case PermissionStatus.granted:
        statusSnapshot.value = LocationPermissionsStatus.Ok;
        mezDbgPrint(statusSnapshot.value);

        return Future.value(statusSnapshot.value);
    }
  }

  Future<LocationPermissionsStatus> _handleBackgroundLocation() async {
    // if Service is not enabled , we request Service and check the result if service is anabled or not.
    if (!await Location().serviceEnabled()) {
      return serviceIsOff();
    }
    // Checking if app has permissions
    final PermissionStatus _status = await Location().hasPermission();
    switch (_status) {
      case PermissionStatus.denied:
        statusSnapshot.value = LocationPermissionsStatus.Denied;
        return Future.value(statusSnapshot.value);
      case PermissionStatus.deniedForever:
        statusSnapshot.value = LocationPermissionsStatus.ForeeverDenied;
        return Future.value(statusSnapshot.value);
      // We can not use background location if it's limited
      case PermissionStatus.grantedLimited:
        mezDbgPrint("@loc@saad : PermissionStatus.grantedLimited");
        statusSnapshot.value = LocationPermissionsStatus.BackgroundAccessDenied;
        return Future.value(statusSnapshot.value);
      case PermissionStatus.granted:
        mezDbgPrint("@loc@saad : PermissionStatus.granted");
        statusSnapshot.value = LocationPermissionsStatus.Ok;
        return Future.value(statusSnapshot.value);
    }

    // Android :
    //  - Android =+11 => User Gives permissions manually.
    //  - Android =-10 || iOS => Programatically get it.

    // Message:
    //  - Android 11+ => Please Click [Always Allow].
    //  - Android =-10 =>
  }

  Stream<LocationPermissionsStatus> locationPermissionChecker(
      {Duration duration = const Duration(seconds: 1)}) async* {
    yield* Stream<Future<LocationPermissionsStatus>>.periodic(
      duration,
      (_) {
        switch (locationType) {
          case LocationPermissionType.Foreground:
            return _handleForegroundLocation();
          case LocationPermissionType.ForegroundAndBackground:
            return _handleBackgroundLocation();
          default:
            return Future.value(LocationPermissionsStatus.Ok);
        }
      },
    ).asyncMap<LocationPermissionsStatus>(
      (Future<LocationPermissionsStatus> locPermission) async => locPermission,
    );
  }
}
