import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/helpers/ServiceListHelper.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapRestaurantCard.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/item/hsItem.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';

enum UserInteraction { isSearching, isSorting, isSearchingAndSorting, Nothing }

enum SearchType { searchByRestaurantName, searchByItemName }

class CustRestaurantListViewController {
  RxList<Restaurant> filteredRestaurants = RxList<Restaurant>.empty();
  RxList<Item> filteredItems = RxList<Item>.empty();
  List<int> servicesIds = [];
  AppLifeCycleController appLifeCycleController =
      Get.find<AppLifeCycleController>();
  String? callbackId;

  List<Restaurant> _restaurants = List<Restaurant>.empty();
  Rx<SearchType> searchType = SearchType.searchByRestaurantName.obs;

  RxBool isLoading = RxBool(false);
  RxBool showOnlyOpen = RxBool(true);
  RxString searchQuery = RxString("");
  LocationData? customerLocation;

  // Map view //
  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  RxBool _isMapView = false.obs;
  bool get isMapView => _isMapView.value;

  RxBool _showOnlyOpenOnMap = RxBool(true);
  bool get showOnlyOpenOnMap => _showOnlyOpenOnMap.value;

  //GoogleMapController? _googleMapController;
  MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;

  LatLng? _screenToWorldPosition;

  RxList<Restaurant> _mapViewRestaurants = <Restaurant>[].obs;
  List<Restaurant> get mapViewRestaurants => _mapViewRestaurants;

  RxSet<MezMarker> _restaurantsMarkers = <MezMarker>{}.obs;
  RxSet<MezMarker> get restaurantsMarkers => _restaurantsMarkers;

  RxSet<MezMarker> _allMarkers = <MezMarker>{}.obs;
  RxSet<MezMarker> get allMarkers => _allMarkers;

  BuildContext? ctx;
  // Map view //

  late FilterInput _filterInput;

  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"]
    };
  }

  final cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  Future<void> init({required BuildContext context}) async {
    _filterInput = defaultFilters();
    ctx = context;

    await locPkg.Location().getLocation().then((LocationData location) {
      if (location.latitude != null && location.longitude != null)
        _currentLocation = LatLng(location.latitude!, location.longitude!);
    });

    await fetchRestaurants();
    callbackId = appLifeCycleController.attachCallback(
        AppLifecycleState.resumed, () => filter(filterInput));
  }

  Future<void> fetchRestaurants() async {
    isLoading.value = true;

    await fetch_restaurants(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            withCache: false,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      filter(_filterInput);
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
    // fetchRestaurants();
  }

  void _assignServiceIds() {
    servicesIds = _restaurants
        // .where((Restaurant element) => element.isOpen)
        .map((Restaurant e) => e.info.hasuraId)
        .toList();
  }

  Future<void> _fetchRestaurantsOnFilter() async {
    isLoading.value = true;

    await fetch_restaurants(
            fromLocation: cModels.Location(
                lat: _currentLocation.latitude,
                lng: _currentLocation.longitude,
                address: ''),
            is_open: showOnlyOpen.value,
            withCache: false,
            online_ordering: _filterInput["onlineOrder"]!.last.contains("true")
                ? true
                : null,
            distance: getFetchDistance)
        .then((List<Restaurant> list) {
      _restaurants = list;

      _assignServiceIds();
      _getCustomerCurrentLocation();
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

  void filter(Map<String, List<String>> newData) {
    // _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });

    changeAlwaysOpenSwitch(
        newData['restaurantOpened']?.contains('true') ?? false);
    mezDbgPrint("_filterInput $_filterInput $newData");
    _fetchRestaurantsOnFilter();
    List<Restaurant> newList = new List<Restaurant>.from(_restaurants);
    if (searchType.value == SearchType.searchByRestaurantName) {
      newList = newList.searchByName(searchQuery.value) as List<Restaurant>;
      newList.sortByOpen();
      filteredRestaurants.value = newList;
    } else {
      servicesIds = newList
          .map(
            (Service e) => e.info.hasuraId,
          )
          .toList();
      _searchItem();
    }
  }

  void switchSearchType(SearchType value) {
    searchType.value = value;
    filter(filterInput);
  }

  bool get showFilters {
    return searchQuery.value.length > 0 ||
        searchType.value == SearchType.searchByItemName;
  }

  bool get byRestaurants {
    return searchType.value == SearchType.searchByRestaurantName;
  }

  Future<void> _searchItem() async {
    filteredItems.value = await search_items(
        servicesIds: servicesIds,
        keyword: searchQuery.value,
        lang: userLanguage,
        onlineOrdering:
            _filterInput["onlineOrder"]!.last.contains("true") ? true : null,
        withCache: false);
  }

  // Map view //
  void switchView() {
    _isMapView.value = !_isMapView.value;
    if (_isMapView.isTrue && mapController.isMapReady) {
      _fetchCurrentMapMarkers();
    }
  }

  Future<void> fetchMapViewRentals(
      {required LatLng? fromLoc, required double? distance}) async {
    try {
      _mapViewRestaurants.value = await fetch_restaurants(
          fromLocation: cModels.Location(
              lat: fromLoc?.latitude ?? _currentLocation.latitude,
              lng: fromLoc?.longitude ?? _currentLocation.longitude,
              address: ''),
          is_open: false,
          withCache: false,
          online_ordering:
              _filterInput["onlineOrder"]!.last.contains("true") ? true : null,
          distance: distance ?? getFetchDistance);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      await _fillMapsMarkers();
      mezDbgPrint(
          "Restaurant markers =======>${restaurantsMarkers.value.length}");
    }
  }

  Future<void> _fillMapsMarkers() async {
    for (Restaurant restaurant in _mapViewRestaurants) {
      _restaurantsMarkers.add(MezMarker(
        flat: true,
        fitWithinBounds: false,
        markerId: MarkerId(restaurant.info.hasuraId.toString()),
        icon: await bitmapDescriptorLoader(
            (await cropRonded((await rootBundle.load(mezRestaurantMarker))
                .buffer
                .asUint8List())),
            70,
            70,
            isBytes: true),
        onTap: () => _onSelectRentalTag(restaurant),
        position: LatLng(restaurant.info.location.position.latitude!,
            restaurant.info.location.position.longitude!),
      ));
    }
  }

  Future<void> setOnlyOpenOnMap() async {
    _showOnlyOpenOnMap.value = !_showOnlyOpenOnMap.value;
    _restaurantsMarkers.clear();
    await _fetchCurrentMapMarkers();
  }

  Future<void> _fetchCurrentMapMarkers() async {
    LatLng? mapCenter = await mapController.getMapCenter();
    double? distance = calculateDistanceFromBounds(
        await mapController.controller.value!.getVisibleRegion());
    await fetchMapViewRentals(
      fromLoc: mapCenter,
      distance: distance,
    );
    mapController.markers.clear();
    mapController.markers.addAll(_restaurantsMarkers);
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _screenToWorldPosition = cameraPosition.target;
    _showFetchButton.value = true;
  }

  void _onSelectRentalTag(Restaurant restaurant) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return OnMapRestaurantCard(restaurant: restaurant);
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
    appLifeCycleController.removeCallbackIdOfState(
        AppLifecycleState.resumed, callbackId);
  }
}
