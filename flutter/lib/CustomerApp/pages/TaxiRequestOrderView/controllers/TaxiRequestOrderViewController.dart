import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as mat;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as GeoLoc;
import 'package:mezcalmos/CustomerApp/models/TaxiRequest.dart';
import 'package:mezcalmos/Shared/controllers/LocationPickerController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/locationController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';

class TaxiRequestOrderViewController {
  AuthController _authController = Get.find<AuthController>();

  final LocationPickerController locationPickerController =
      LocationPickerController(
          enableMezSmartPointer: true, myLocationButtonEnabled: false);
  mat.TextEditingController fromLocText = mat.TextEditingController();
  mat.TextEditingController toLocText = mat.TextEditingController();
  mat.FocusNode fromLocFocusNode = mat.FocusNode();
  mat.FocusNode toLocFocusNode = mat.FocusNode();
// state vars //
  Rxn<MezLocation> fromLoc = Rxn();
  Rxn<MezLocation> toLoc = Rxn();
  Rxn<Route> _route = Rxn<Route>();
  RxList<AutoCompleteResult> _fromSuggestions = RxList.empty();
  List<AutoCompleteResult> get fromSuggestions => _fromSuggestions.value;
  RxList<AutoCompleteResult> _toSuggestions = RxList.empty();
  List<AutoCompleteResult> get toSuggestions => _toSuggestions.value;
  RxBool fromLocLoading = RxBool(false);
  RxBool toLocLoading = RxBool(false);
  RxBool isSettingFromLocation = RxBool(false);
  RxBool isSettingToLocation = RxBool(false);
  RxInt numbOfSeats = RxInt(1);
  RxNum orderCost = RxNum(0);
  //  getters //
  bool get isFromSetted => fromLoc.value != null;
  bool get isToSetted => toLoc.value != null;
  Route? get route => _route.value;
  bool get _canOrder => isFromSetted && isToSetted && route != null;

  bool get showRouteInfo => route != null && isFromSetted && isToSetted;

  void init() {
    locationPickerController.minMaxZoomPrefs = MinMaxZoomPreference(8, 18);
    locationPickerController.initialZoomLevel = 10;
    locationPickerController.periodicRerendering.value = true;
    locationPickerController.animateMarkersPolyLinesBounds.value = true;
    locationPickerController.recenterButtonEnabled.value = false;
    locationPickerController.myLocationButtonEnabled.value = false;

    _getAndSetCurrentLocation();
    toLocFocusNode.addListener(() {
      if (toLocFocusNode.hasFocus) {
        startEditingToLoc();
      }
    });
    fromLocFocusNode.addListener(() {
      if (fromLocFocusNode.hasFocus) {
        startEditingFromLoc();
      }
    });

    startEditingFromLoc();
  }

  void startEditingFromLoc() {
    isSettingFromLocation.value = true;
    isSettingToLocation.value = false;

    toLocFocusNode.unfocus();
    locationPickerController.showFakeMarker();
    BotToast.showText(
        text: "You can move the marker", duration: Duration(seconds: 3));
  }

  void startEditingToLoc() {
    isSettingFromLocation.value = false;
    isSettingToLocation.value = true;
    fromLocFocusNode.unfocus();
    locationPickerController.showFakeMarker();
    BotToast.showText(
        text: "You can move the marker", duration: Duration(seconds: 3));
  }

  void setNewLocationOnController({required LatLng latlng, String? address}) {
    locationPickerController
        .setLocation(MezLocation.fromFirebaseData(<String, Object>{
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

    locationPickerController
        .setLocation(MezLocation.fromFirebaseData(<String, Object>{
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

  // void addFromLoc({required MezLocation location, String? address}) {
  //   fromLoc.value = location;
  //   fromLocText.text = address ?? fromLoc.value?.address.toString() ?? "";
  // }

  Future<void> getSuggestions(
      {required String search, required bool isFromLocation}) async {
    final List<AutoCompleteResult> suggestions =
        await getLocationsSuggestions(search);

    if (isFromLocation) {
      _fromSuggestions.value = suggestions;
    } else {
      _toSuggestions.value = suggestions;
    }
  }

  Future<void> selectFromLocation(
      {String? placeId, required String description}) async {
    mezDbgPrint("Called 👋");
    fromLocLoading.value = true;
    await getLocationFromPlaceId(placeId!, description)
        .then((MezLocation? value) {
      if (value != null) {
        _setFromLoc(value);
      }
    }).whenComplete(() => fromLocLoading.value = false);
  }

  Future<void> selectToLocation(
      {String? placeId, required String description}) async {
    mezDbgPrint("Called 👋");
    toLocLoading.value = true;
    await getLocationFromPlaceId(placeId!, description)
        .then((MezLocation? value) {
      if (value != null) {
        _setToLoc(value);
        if (fromLoc.value == null) {
          startEditingFromLoc();
        }
      }
    }).whenComplete(() => toLocLoading.value = false);
  }

  Future<void> _setToLoc(MezLocation value) async {
    await locationPickerController.moveToNewLatLng(
        value.latitude, value.longitude);
    locationPickerController.setLocation(value);

    if (!kIsWeb) {
      await locationPickerController.addOrUpdatePurpleDestinationMarker(
          markerId: "to", latLng: value.toLatLng(), fitWithinBounds: true);
    }
    toLoc.value = value;
    toLocText.text = value.address;
    isSettingToLocation.value = false;
    _toSuggestions.clear();
    toLocFocusNode.unfocus();
    await _updatePolyline();

    if (fromLoc.value == null) {
      startEditingFromLoc();
    } else {
      locationPickerController.hideFakeMarker();
    }
  }

  Future<void> _updatePolyline() async {
    if (fromLoc.value != null && toLoc.value != null) {
      await getDurationAndDistance(fromLoc.value!, toLoc.value!)
          .then((Route? value) async {
        if (value != null) {
          _route.value = value;
          if (!kIsWeb) {
            locationPickerController.decodeAndAddPolyline(
                encodedPolylineString: value.encodedPolyLine);

            locationPickerController.lockInAutoZoomAnimation();
          }
          orderCost.value =
              (_route.value!.distance.distanceInMeters * 30) / 1000;
        }
      });
    }
  }

  Future<void> _setFromLoc(MezLocation value) async {
    fromLocFocusNode.unfocus();
    await locationPickerController.moveToNewLatLng(
        value.latitude, value.longitude);
    locationPickerController.setLocation(value);

    if (!kIsWeb) {
      await locationPickerController.addOrUpdateUserMarker(
          markerId: "from", latLng: value.toLatLng(), fitWithinBounds: true);
    }
    fromLoc.value = value;
    fromLocText.text = value.address;
    isSettingFromLocation.value = false;

    _fromSuggestions.clear();
    await _updatePolyline();
    if (toLoc.value == null) {
      startEditingToLoc();
    } else {
      locationPickerController.hideFakeMarker();
    }
  }

  Future<void> clearFromLoc() async {
    fromLoc.value = null;
    fromLocText.clear();
    isSettingFromLocation.value = false;
    _fromSuggestions.clear();

    fromLocFocusNode.unfocus();
    locationPickerController.removeMarkerById("from");
    locationPickerController.clearPolyline();

    startEditingFromLoc();
  }

  Future<void> clearToLoc() async {
    toLoc.value = null;
    toLocText.clear();
    isSettingToLocation.value = false;
    _toSuggestions.clear();
    toLocFocusNode.unfocus();
    locationPickerController.removeMarkerById("to");
    locationPickerController.clearPolyline();
    startEditingToLoc();
  }

  Future<void> selectCurrentLocation() async {
    final LatLng? _pickedLoc = await locationPickerController.getMapCenter();
    if (_pickedLoc != null) {
      await locationPickerController.moveToNewLatLng(
          _pickedLoc.latitude, _pickedLoc.longitude);

      await awaitGeoCodeAndSetControllerLocation(_pickedLoc);
      if (isSettingFromLocation.value) {
        await _setFromLoc(locationPickerController.location.value!);
      } else if (isSettingToLocation.value) {
        await _setToLoc(locationPickerController.location.value!);
      }
    }
  }

  void removeSeat() {
    if (numbOfSeats > 1) {
      numbOfSeats--;
    }
  }

  void addSeat() {
    if (numbOfSeats <= 4) {
      numbOfSeats++;
    }
  }

  Future<void> handleNext(mat.BuildContext context) async {
    if (isSettingFromLocation.value || isSettingToLocation.value) {
      await selectCurrentLocation();
    } else if (_canOrder) {
      await _callCloudFunction();
      await showNormalDialog(
        context,
        dismissible: false,
        icon: mat.Icons.check_rounded,
        title: "Your Request is sent",
        subtitle: "Driver will contact you shortly",
        onClick: () async {
          await clearFromLoc();
          await clearToLoc();
          if (!kIsWeb) {
            locationPickerController.clearPolyline();
            locationPickerController.clearMarkers();
          }
          mat.Navigator.pop(context);
        },
      );
    } else {
      showErrorSnackBar(
          errorText: "Please make sure you select from and to locations");
    }
  }

  TaxiRequest _constructRequest() {
    return TaxiRequest(
        routeInformation: route,
        from: fromLoc.value!,
        to: toLoc.value!,
        numbOfSeats: numbOfSeats.value);
  }

  Future<void> _callCloudFunction() async {
    // @nathik work with the taxi request  ====> it have everything needed
    final TaxiRequest _request = _constructRequest();
  }
}
