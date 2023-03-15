import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

class PickLocationViewController {
  AuthController _authController = Get.find<AuthController>();
  final LocationPickerController locationPickerController =
      LocationPickerController();

  RxBool isLoading = RxBool(false);
  Rxn<LatLng> passedInLocation = Rxn();
  Future<void> Function({MezLocation location})? onSave;

  bool get isEditingLocation => passedInLocation.value != null;
  bool get isCustomerApp => Get.isRegistered<CustomerAuthController>();

  void init(
      {required LatLng? defaultLocation,
      required Future<void> Function({MezLocation location})? onSave}) {
    passedInLocation.value = defaultLocation;
    this.onSave = onSave;

    mezDbgPrint("==> init pick location view <== ");
    mezDbgPrint("==> user is signed in ${_authController.isUserSignedIn} <== ");
    mezDbgPrint("==> is customer $isCustomerApp <== ");
    mezDbgPrint("==> onSave callBack $onSave <== ");

    mezDbgPrint("==> passed in location $passedInLocation <== ");
    if (isEditingLocation) {
      geoCodeAndSetLocation(passedInLocation.value!);
    } else {
      _getAndSetCurrentLocation();
    }
  }

  void _getAndSetCurrentLocation() {
    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      setNewLocationOnController(
          latlng: LatLng(locData.latitude!, locData.longitude!));

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

  void setNewLocationOnController({required LatLng latlng, String? address}) {
    locationPickerController.setLocation(MezLocation.fromFirebaseData({
      "address": address ??
          latlng.latitude.toString() + ', ' + latlng.longitude.toString(),
      "lat": latlng.latitude,
      "lng": latlng.longitude,
    }));
  }

  Future<void> pickLocationClickAction(BuildContext context) async {
    final LatLng? _pickedLoc = await locationPickerController.getMapCenter();
    if (_pickedLoc != null) {
      await locationPickerController.moveToNewLatLng(
          _pickedLoc.latitude, _pickedLoc.longitude);

      await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
      await onSave?.call(location: locationPickerController.location.value!);

      await MezRouter.back(backResult: locationPickerController.location.value);
    }
  }
}
