import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/mapConstants.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustRealEstateViewController {
  RxList<HomeCard> _realEstates = <HomeCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController => showBusiness.isTrue
      ? _businessScrollController
      : _realEstateScrollController;
  ScrollController _realEstateScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  int realEstateFetchSize = 20;
  int _realEstateCurrentOffset = 0;
  bool _realEstateFetchingData = false;
  bool _realEstateReachedEndOfData = false;
  final int businessFetchSize = 20;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // scroll logic //

  // getters //
  bool get isLoading => _isLoading.value;

  List<HomeCard> get realEstate => _realEstates.value;
  List<BusinessCard> get businesses => _businesses.value;

  // Map view //
  RxBool _isMapView = false.obs;
  bool get isMapView => _isMapView.value;

  GoogleMapController? _googleMapController;

  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;

  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  LatLng? _screenToWorldPosition;

  RxList<BusinessCard> _mapViewBusinesses = <BusinessCard>[].obs;
  List<BusinessCard> get mapViewBusinesses => _mapViewBusinesses;

  RxSet<Marker> _buisinessesMarkers = <Marker>{}.obs;
  RxSet<Marker> get buisinessesMarkers => _buisinessesMarkers;

  RxSet<Marker> _allMarkers = <Marker>{}.obs;
  RxSet<Marker> get allMarkers => _allMarkers;

  BuildContext? ctx;
  // Map view //

// methods //
  Future<void> init() async {
    try {
      _isLoading.value = true;
      // todo @ChiragKr04 fix the location thing

      final locPkg.LocationData location =
          await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
        await _fetchRealEstate();
        await _fetchBusinesses();
        _realEstateScrollController.onBottomReach(_fetchRealEstate,
            sensitivity: 500);
        _businessScrollController.onBottomReach(_fetchBusinesses,
            sensitivity: 500);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchRealEstate() async {
    if (_realEstateFetchingData || _realEstateReachedEndOfData) {
      return;
    }
    try {
      _realEstateFetchingData = true;
      mezDbgPrint(
          "👋 _fetchRentals called  \n ferchSize : $realEstateFetchSize \n offset: $_realEstateCurrentOffset");
      List<HomeCard> newList = await get_real_estate(
        fromLocation: _fromLocation!,
        distance: 1000000000000,
        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false,
        offset: _realEstateCurrentOffset,
        limit: realEstateFetchSize,
      );
      _realEstates.value += newList;
      if (newList.length == 0) {
        _realEstateReachedEndOfData = true;
      }
      _realEstateCurrentOffset += realEstateFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _realEstateFetchingData = false;
    }
  }

  Future<void> _fetchBusinesses() async {
    if (_businessFetchingData || _businessReachedEndOfData) {
      return;
    }
    try {
      mezDbgPrint(
          "👋 _fetchBusinesses called with ferchSize : $businessFetchSize offset: $_businessCurrentOffset");
      _businessFetchingData = true;
      List<BusinessCard> newList = await get_business_by_home(
          homeType: HomeAvailabilityOption.Sale,
          distance: 1000000000000,
          fromLocation: _fromLocation!,
          offset: _businessCurrentOffset,
          limit: businessFetchSize,

          // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
          withCache: false);
      _businesses.value += newList;
      if (newList.length == 0) {
        _businessReachedEndOfData = true;
      }

      _businessCurrentOffset += businessFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _businessFetchingData = false;
    }
  }

  void filter() {
    // selectedCategories.value = List.from(previewCategories);

    // _resetRentals();
    // _fetchRentals();
  }

  void resetFilter() {
    // previewCategories.value = List.from(filterCategories);
    // selectedCategories.value = List.from(filterCategories);
    // _fetchRentals();
  }

  void switchFilterCategory(bool? value, int index) {
    // if (value == true) {
    //   previewCategories.add(filterCategories[index]);
    // } else {
    //   previewCategories.remove(filterCategories[index]);
    // }
  }

  void _resetRentals() {
    _realEstates.clear();
    _realEstateCurrentOffset = 0;
    _realEstateReachedEndOfData = false;
  }

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> _fetchMapViewRentals({bool currentPostitionBased = true}) async {
    try {
      if (currentPostitionBased) {
        _mapViewBusinesses.value = await get_business_by_home(
            homeType: HomeAvailabilityOption.Sale,
            distance: 25000,
            fromLocation: _fromLocation!,
            offset: 0,
            limit: 25,
            withCache: false);
      } else {
        _mapViewBusinesses.value = await get_business_by_home(
            homeType: HomeAvailabilityOption.Sale,
            distance: _calculateDistance(
                await _googleMapController!.getVisibleRegion()),
            fromLocation: Location(
                lat: _screenToWorldPosition!.latitude,
                lng: _screenToWorldPosition!.longitude,
                address: ''),
            offset: 0,
            limit: 25,
            withCache: false);
      }
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
    }
  }

  Future<void> _fillMapsMarkers() async {
    _buisinessesMarkers = <Marker>{}.obs;

    final String iconPath = mezVehicleRentalIconMarker;
    for (BusinessCard business in _mapViewBusinesses) {
      await _allMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: iconPath,
        markerId: MarkerId(business.id.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(business),
        position: LatLng(business.location!.lat.toDouble(),
            business.location!.lng.toDouble()),
      ));
      await _buisinessesMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: null,
        altIconPath: iconPath,
        markerId: MarkerId(business.id.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(business),
        position: LatLng(business.location!.lat.toDouble(),
            business.location!.lng.toDouble()),
      ));
    }
    _buisinessesMarkers.update((value) {});
    _buisinessesMarkers.refresh();
  }

  void fetchMapViewRentals() {
    _fetchMapViewRentals(currentPostitionBased: false);
    _showFetchButton.value = false;
  }

  void recenterMap() {
    _googleMapController?.moveCamera(CameraUpdate.newLatLng(_currentLocation));
  }

  Future<void> onMapCreated(GoogleMapController? gMapController) async {
    _googleMapController = gMapController;
    await _googleMapController?.setMapStyle(mezMapStyle);
    await _fetchMapViewRentals();
  }

  void onCameraMove(CameraPosition cameraPosition) {
    _screenToWorldPosition = cameraPosition.target;
    _showFetchButton.value = true;
  }

  void _onSelectRentalTag(BusinessCard business) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return Text('Test');
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
}
