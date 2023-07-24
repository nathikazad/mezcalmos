// ignore_for_file: always_specify_types

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/helpers/LocationPermissionHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/routes/sharedRoutes.dart';

class LocationController extends GetxController {
  final LocationPermissionType locationType;
  Rxn<LocationPermissionsStatus> statusSnapshot = Rxn();

  LocationController({required this.locationType});

  Future<LocationPermissionsStatus> serviceIsOff() {
    statusSnapshot.value = LocationPermissionsStatus.ServiceOff;
    return Future.value(statusSnapshot.value);
  }

  Future<LocationData> getCurrentLocation() async {
    logEventToServer("Updating location permission");
    await updateLocationPermission();
    logEventToServer("Location permission ${statusSnapshot.value}");
    if (statusSnapshot.value != LocationPermissionsStatus.Ok) {
      logEventToServer("Redirectin guser to permission page");
      await MezRouter.toNamed(SharedRoutes.kLocationPermissionPage,
          ignoreSamePath: true);
      logEventToServer("getCurrentLocation back from permission page");
    }
    logEventToServer("getting location");
    final LocationData locationData = await Location()
        .getLocation()
        .timeout(Duration(seconds: 3), onTimeout: () {
      logEventToServer("getting location timedout");
      return LocationData.fromMap({
        'latitude': 15.8720.toDouble(),
        'longitude': 97.0767.toDouble(),
      });
    });
    logEventToServer("getting location success ${locationData.toString()}");
    return locationData;
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
        if (kIsWeb) {
          mezDbgPrint("entering is web");
          try {
            final LocationData _locationData =
                await Get.find<LocationController>().getCurrentLocation();
            mezDbgPrint(_locationData.latitude);
            return Future.value(LocationPermissionsStatus.Ok);
          } catch (e) {
            mezDbgPrint("failed web location get");
            return Future.value(statusSnapshot.value);
          }
        }
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

  Future<LocationPermissionsStatus> updateLocationPermission() async {
    switch (locationType) {
      case LocationPermissionType.Foreground:
        return _handleForegroundLocation();
      case LocationPermissionType.ForegroundAndBackground:
        return _handleBackgroundLocation();
      default:
        return Future.value(LocationPermissionsStatus.Ok);
    }
  }

  Stream<LocationPermissionsStatus> locationPermissionChecker(
      {Duration duration = const Duration(seconds: 10)}) {
    // Execute immediately
    final Stream<LocationPermissionsStatus> immediateStream =
        Stream.fromFuture(updateLocationPermission());
    // Execute periodically every 5 seconds
    final Stream<LocationPermissionsStatus> periodicStream =
        Stream.periodic(duration, (_) => updateLocationPermission())
            .asyncMap((future) => future);
    // Concatenate the two streams
    return immediateStream.asyncExpand((_) => periodicStream);
  }
}
