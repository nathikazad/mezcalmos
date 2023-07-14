import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapLaundryCard.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

class CustLaundriesListViewController {
  MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );
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

  late FilterInput _filterInput;

  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"],
    };
  }

  Future<void> init(BuildContext context) async {
    _filterInput = defaultFilters();
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
            online_ordering: _filterInput['onlineOrder']!.last.contains('true')
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Laundry> list) {
      _services = list;

      filter(_filterInput);
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  Future<void> _getLaundries() async {
    isLoading.value = true;
    await get_laundries(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            withCache: false,
            online_ordering: _filterInput['onlineOrder']!.last.contains('true')
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Laundry> list) {
      _services = list;
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

  Future<void> filter(Map<String, List<String>> newData) async {
    // _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });
    await _getLaundries();
    List<Laundry> newList = new List<Laundry>.from(_services);

    newList = newList
        .searchByName(searchQuery.value)
        .showOnlyOpen(showOnlyOpen.value) as List<Laundry>;
    newList.sortByOpen();
    filteredServices.value = newList;
  }

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> fetchMapViewLaundries(
      {required LatLng? fromLoc, required double? distance}) async {
    try {
      _mapViewLaundries.value = await get_laundries(
          fromLocation: cModels.Location(
              lat: fromLoc?.latitude ?? _currentLocation.latitude,
              lng: fromLoc?.longitude ?? _currentLocation.longitude,
              address: ''),
          withCache: false,
          online_ordering:
              _filterInput['onlineOrder']!.last.contains('true') ? true : null,
          distance: distance ?? getFetchDistance);
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
    }
  }

  Future<void> _fillMapsMarkers() async {
    // _laundriesMarkers = <MezMarker>{}.obs;

    for (Laundry restaurant in _mapViewLaundries) {
      mezDbgPrint("Adding map marker to => ${restaurant.info.name}");
      await _laundriesMarkers.addLabelMarker(LabelMarker(
        flat: false,
        label: null,
        anchor: Offset(0.5, 0.5),
        altIconPath: mezLaundryIcon,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.latitude.toDouble(),
            restaurant.info.location.longitude.toDouble()),
      ));
    }
  }

  void recenterMap() {
    _googleMapController?.moveCamera(CameraUpdate.newLatLng(_currentLocation));
  }

  void setOnlyOpenOnMap() =>
      _showOnlyOpenOnMap.value = !_showOnlyOpenOnMap.value;

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
