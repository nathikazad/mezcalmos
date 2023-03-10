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
  /// Controller for picking location this should handles :
  /// Picking and returning a new location for all the apps
  /// Starting from the passed in location if it's there
  /// handle save and edit saved locations for customer app only

  // instances //
  AuthController _authController = Get.find<AuthController>();
  final LocationPickerController locationPickerController =
      LocationPickerController();

  // state vars //
  RxBool isLoading = RxBool(false);
  Rxn<LatLng> passedInLocation = Rxn();
  // variables //

  int? savedLocationId;

  // getters //
  bool get isEditingLocation => passedInLocation.value != null;
  bool get isCustomerApp => Get.isRegistered<CustomerAuthController>();

  // methods //
  void init({required LatLng? defaultLocation}) {
    passedInLocation.value = defaultLocation;

    mezDbgPrint("==> init pick location view <== ");
    mezDbgPrint("==> user is signed in ${_authController.isUserSignedIn} <== ");
    mezDbgPrint("==> is customer $isCustomerApp <== ");
    mezDbgPrint("==> saved location id $savedLocationId <== ");
    mezDbgPrint("==> passed in location $passedInLocation <== ");
    if (isEditingLocation) {
      geoCodeAndSetLocation(passedInLocation.value!);
    } else {
      _getAndSetCurrentLocation();
    }
  }

  void _getAndSetCurrentLocation() {
    GeoLoc.Location().getLocation().then((GeoLoc.LocationData locData) {
      // first we set Location without GeoCoding the address
      setNewLocationOnController(
          latlng: LatLng(locData.latitude!, locData.longitude!));
      // then we try to get the address
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

  //
  /// Get the related Address to a given [latLng], without awaiting the GeoCoding , mainly used onInit
  ///
  /// To not make the Map dependable on awaiting it to finish and onDone , it sets it to the controller::location.
  void geoCodeAndSetControllerLocation(LatLng latLng) {
    getAdressFromLatLng(latLng).then((String? addrs) {
      mezDbgPrint("+ Done resolving user's Address $addrs !");
      setNewLocationOnController(latlng: latLng, address: addrs);
    }).catchError((e) {
      mezDbgPrint("Failed to get address of User's Lat Lng $latLng");
    });
  }

  /// Get the related Address to a given [latLng],
  /// This is the Same As [geoCodeAndSetControllerLocation] , the only diffrene that this is
  ///
  /// an Awaitable method, wheres the other is not, we use this when user clicks Save/Add new Saved Location
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
    String? _result;
    final LatLng? _pickedLoc = await locationPickerController.getMapCenter();
    if (_pickedLoc != null) {
      await locationPickerController.moveToNewLatLng(
          _pickedLoc.latitude, _pickedLoc.longitude);
      //  locationPickerController.setLocation(_pickedLoc);
      await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
      // ignore: unawaited_futures
      MezRouter.back(backResult: locationPickerController.location.value);

      // if (widget.pickLocationMode == PickLocationMode.NonLoggedInPick) {
      //   await MezRouter.back(
      //       backResult: locationPickerController.location.value);
      // } else if (widget.pickLocationMode == PickLocationMode.EditLocation) {
      //   await MezRouter.back(
      //       backResult: locationPickerController.location.value);
      //   mezDbgPrint(locationPickerController.location.value!.address);
      // } else {
      //   await MezRouter.back(
      //       backResult: locationPickerController.location.value);
      // }
    }
  }
}
