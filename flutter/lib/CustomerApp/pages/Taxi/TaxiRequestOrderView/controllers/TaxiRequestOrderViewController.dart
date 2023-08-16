import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiRequestOrderViewController {
  AuthController _authController = Get.find<AuthController>();
  final LocationPickerController locationPickerController =
      LocationPickerController();

  void init() {
    locationPickerController.recenterButtonEnabled.value = false;
    // locationPickerController.myLocationButtonEnabled.value = false;

    _getAndSetCurrentLocation();
  }

  void setNewLocationOnController({required LatLng latlng, String? address}) {
    locationPickerController.setLocation(MezLocation.fromFirebaseData({
      "address": address ??
          latlng.latitude.toString() + ', ' + latlng.longitude.toString(),
      "lat": latlng.latitude,
      "lng": latlng.longitude,
    }));
  }

  void _getAndSetCurrentLocation() {
    Get.find<LocationController>()
        .getCurrentLocation()
        .then((GeoLoc.LocationData locData) {
      setNewLocationOnController(
          latlng: LatLng(locData.latitude!, locData.longitude!));
      mezDbgPrint("Geting current location ==========>>>$locData");
      geoCodeAndSetControllerLocation(
          LatLng(locData.latitude!, locData.longitude!));
    });
  }

  Future<void> geoCodeAndSetLocation(LatLng currentLoc) async {
    final String? address = await getAdressFromLatLng(currentLoc);

    locationPickerController.setLocation(MezLocation.fromFirebaseData({
      "address": address ??
          currentLoc.latitude.toString() + ", ${currentLoc.longitude}",
      "lat": currentLoc.latitude,
      "lng": currentLoc.longitude,
    }));
  }

  void geoCodeAndSetControllerLocation(LatLng latLng) {
    getAdressFromLatLng(latLng).then((String? addrs) {
      mezDbgPrint("+ Done resolving user's Address $addrs !");
      setNewLocationOnController(latlng: latLng, address: addrs);
    }).catchError((e) {
      mezDbgPrint("Failed to get address of User's Lat Lng $latLng");
    });
  }

  Future<void> awaitGeoCodeAndSetControllerLocation(LatLng latLng) async {
    final String? addrs = await getAdressFromLatLng(latLng);
    setNewLocationOnController(latlng: latLng, address: addrs);
  }
}
