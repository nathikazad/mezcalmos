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
        statusSnapshot.value = LocationPermissionsStatus.ForeverDenied;
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

  Future<bool> _checkIfBackgroundEnabled() async {
    bool _v = false;

    try {
      _v = await Location().enableBackgroundMode();
    } catch (e) {
      // do nothing
    }
    return _v;
  }

  /// handling the bg location
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
        statusSnapshot.value = LocationPermissionsStatus.ForeverDenied;
        return Future.value(statusSnapshot.value);
      // We can not use background location if it's limited
      case PermissionStatus.grantedLimited:
        // mezDbgPrint("@loc@saad : PermissionStatus.grantedLimited");
        if (await _checkIfBackgroundEnabled()) {
          statusSnapshot.value = LocationPermissionsStatus.Ok;
          return Future.value(statusSnapshot.value);
        } else {
          statusSnapshot.value =
              LocationPermissionsStatus.BackgroundAccessDenied;
          return Future.value(statusSnapshot.value);
        }
      case PermissionStatus.granted:
        if (await _checkIfBackgroundEnabled()) {
          //mezDbgPrint("@loc@saad : PermissionStatus.granted");
          statusSnapshot.value = LocationPermissionsStatus.Ok;
          return Future.value(statusSnapshot.value);
        } else {
          //mezDbgPrint("@loc@saad : PermissionStatus.granted");

          statusSnapshot.value =
              LocationPermissionsStatus.BackgroundAccessDenied;
          return Future.value(statusSnapshot.value);
        }
    }
  }

  Stream<LocationPermissionsStatus> locationPermissionChecker(
      {Duration duration = const Duration(seconds: 5)}) async* {
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
