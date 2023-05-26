import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustHomeRentalsListViewController {
  RxList<RentalCard> _rentals = <RentalCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController =>
      showBusiness.isTrue ? _businessScrollController : _rentalScrollController;
  ScrollController _rentalScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  int rentalFetchSize = 20;
  int _rentalCurrentOffset = 0;
  bool _rentalFetchingData = false;
  bool _rentalReachedEndOfData = false;
  final int businessFetchSize = 20;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // scroll logic //

  // getters //
  bool get isLoading => _isLoading.value;
  bool get isMapView => _isMapView.value;

  RxBool _isMapView = false.obs;

  // Map view //
  List<RentalCard> get rentals => _rentals.value;
  List<BusinessCard> get businesses => _businesses.value;

  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  Set<Marker> _markers = <Marker>{};
  Set<Marker> get markers => _markers;
  // Map view //

// methods //
  Future<void> init() async {
    try {
      _isLoading.value = true;
      await locPkg.Location().getLocation().then((location) {
        if (location.latitude != null && location.longitude != null)
          _currentLocation = LatLng(location.latitude!, location.longitude!);
      });

      // todo @ChiragKr04 fix the location thing

      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
        await _fetchRentals();
        await _fetchBusinesses();
        _fillMapsMarkers();
        _rentalScrollController.onBottomReach(_fetchRentals, sensitivity: 500);
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

  Future<void> _fetchRentals() async {
    if (_rentalFetchingData || _rentalReachedEndOfData) {
      return;
    }
    try {
      _rentalFetchingData = true;
      mezDbgPrint(
          "👋 _fetchRentals called  \n ferchSize : $rentalFetchSize \n offset: $_rentalCurrentOffset");
      List<RentalCard> newList = await get_home_rentals(
        distance: 1000000000000,
        fromLocation: _fromLocation!,

        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false,
        offset: _rentalCurrentOffset,
        limit: rentalFetchSize,
      );
      _rentals.value += newList;
      if (newList.length == 0) {
        _rentalReachedEndOfData = true;
      }
      _rentalCurrentOffset += rentalFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _rentalFetchingData = false;
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
      List<BusinessCard> newList = await get_business_by_rental_category1(
          categories1: [RentalCategory1.Home],
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

  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> _fillMapsMarkers() async {
    _markers = <Marker>{};
    for (RentalCard rental in _rentals) {
      markers.add(Marker(
          icon: await bitmapDescriptorLoader(mezHomeIconMarker, 100, 100),
          // icon: await BitmapDescriptor.fromAssetImage(
          //     ImageConfiguration(), mezHomeIconMarker),
          markerId: MarkerId(rental.id.toString()),
          position: LatLng(rental.gpsLocation!.lat.toDouble(),
              rental.gpsLocation!.lng.toDouble())));
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
    _rentals.clear();
    _rentalCurrentOffset = 0;
    _rentalReachedEndOfData = false;
  }
}
