import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapLaundryCard.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CustLaundriesListViewController {
  RxList<Laundry> filteredServices = RxList<Laundry>.empty();

  List<Laundry> _services = List<Laundry>.empty();

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  // Map view //
  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  RxBool _isMapView = false.obs;
  bool get isMapView => _isMapView.value;

  RxBool _showOnlyOpenOnMap = RxBool(true);
  bool get showOnlyOpenOnMap => _showOnlyOpenOnMap.value;

  GoogleMapController? _googleMapController;

  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;

  LatLng? _screenToWorldPosition;

  RxList<Laundry> _mapViewLaundries = <Laundry>[].obs;
  List<Laundry> get mapViewLaundries => _mapViewLaundries;

  RxSet<Marker> _laundriesMarkers = <Marker>{}.obs;
  RxSet<Marker> get laundriesMarkers => _laundriesMarkers;

  RxSet<Marker> _allMarkers = <Marker>{}.obs;
  RxSet<Marker> get allMarkers => _allMarkers;

  BuildContext? ctx;
  // Map view //

  Future<void> init(BuildContext context) async {
    ctx = context;

    await locPkg.Location().getLocation().then((LocationData location) {
      if (location.latitude != null && location.longitude != null)
        _currentLocation = LatLng(location.latitude!, location.longitude!);
    });

    isLoading.value = true;

    await get_laundries(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            withCache: false,
            distance: getFetchDistance)
        .then((List<Laundry> list) {
      _services = list;

      filter();
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void _getCustomerCurrentLocation() {
    Location()
        .getLocation()
        .then((LocationData value) => customerLocation = value);
  }

  void changeAlwaysOpenSwitch(bool value) {
    showOnlyOpen.value = value;
  }

  void filter() {
    List<Laundry> newList = new List<Laundry>.from(_services);

    newList = newList
        .searchByName(searchQuery.value)
        .showOnlyOpen(showOnlyOpen.value) as List<Laundry>;
    newList.sortByOpen();
    filteredServices.value = newList;
  }

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> _fetchMapViewLaundries(
      {bool currentPostitionBased = true}) async {
    try {
      if (currentPostitionBased) {
        _mapViewLaundries.value = await get_laundries(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            withCache: false,
            distance: getFetchDistance);
      } else {
        _mapViewLaundries.value = await get_laundries(
            distance: _calculateDistance(
                await _googleMapController!.getVisibleRegion()),
            fromLocation: cModels.Location(
                lat: _screenToWorldPosition!.latitude,
                lng: _screenToWorldPosition!.longitude,
                address: ''),
            withCache: false);
      }
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
    }
  }

  Future<void> _fillMapsMarkers() async {
    _laundriesMarkers = <Marker>{}.obs;

    for (Laundry restaurant in _mapViewLaundries) {
      await _allMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: mezLaundryIcon,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.position.latitude!,
            restaurant.info.location.position.longitude!),
      ));
      await _laundriesMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: mezLaundryIcon,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.position.latitude!,
            restaurant.info.location.position.longitude!),
      ));
    }
  }

  void fetchMapViewLaundries() {
    _fetchMapViewLaundries(currentPostitionBased: false);
    _showFetchButton.value = false;
  }

  void recenterMap() {
    _googleMapController?.moveCamera(CameraUpdate.newLatLng(_currentLocation));
  }

  void setOnlyOpenOnMap() =>
      _showOnlyOpenOnMap.value = !_showOnlyOpenOnMap.value;

  Future<void> onMapCreated(GoogleMapController? gMapController) async {
    _googleMapController = gMapController;
    await _googleMapController?.setMapStyle(mezMapStyle);
    await _fetchMapViewLaundries();
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _screenToWorldPosition = cameraPosition.target;
    _showFetchButton.value = true;
  }

  void _onSelectRentalTag(Laundry laundry) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return OnMapLaundryCard(laundry: laundry);
        });
  }

  double _calculateDistance(LatLngBounds bounds) {
    final double centerLat =
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
    final double centerLng =
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
    final LatLng center = LatLng(centerLat, centerLng);

    final double p = 0.017453292519943295;
    final double a = 0.5 -
        cos((bounds.northeast.latitude - center.latitude) * p) / 2 +
        cos(center.latitude * p) *
            cos(bounds.northeast.latitude * p) *
            (1 - cos((bounds.northeast.longitude - center.longitude) * p)) /
            2;

    return (12742 * asin(sqrt(a))) * 1000;
  }

  // Map view //

  void dispose() {
    isLoading.value = false;
  }
}
