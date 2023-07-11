import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/CustBusinessFilterSheet.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapRentalCard.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/MGoogleMapController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/MezMarker.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['RentalsView']['CustHomeRentalListView'];

class CustHomeRentalsListViewController {
  RxList<HomeCard> _rentals = <HomeCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;
  MGoogleMapController mapController = MGoogleMapController(
    enableMezSmartPointer: true,
  );

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

  List<HomeCard> get rentals => _rentals;
  List<BusinessCard> get businesses => _businesses;

  late FilterInput _filterInput;

  // Map view //

  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;

  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  List<HomeCard> get mapViewRentals => _rentals;
  RxList<HomeCard> _mapViewRentals = <HomeCard>[].obs;

  RxSet<MezMarker> _allMarkers = <MezMarker>{}.obs;
  RxSet<MezMarker> get allMarkers => _allMarkers;

  RxSet<MezMarker> _perDayMarkers = <MezMarker>{}.obs;
  RxSet<MezMarker> get perDayMarkers => _perDayMarkers;

  RxSet<MezMarker> _perWeekMarkers = <MezMarker>{}.obs;
  RxSet<Marker> get perWeekMarkers => _perWeekMarkers;

  RxSet<MezMarker> _perMonthMarkers = <MezMarker>{}.obs;
  RxSet<MezMarker> get perMonthMarkers => _perMonthMarkers;

  Rx<TimeUnit> _filterTag = TimeUnit.PerDay.obs;
  TimeUnit get filterTag => _filterTag.value;
  BuildContext? ctx;

  Set<Marker> get getMarkersList {
    switch (filterTag) {
      case TimeUnit.PerDay:
        return perDayMarkers;
      case TimeUnit.PerWeek:
        return perWeekMarkers;
      default:
        return perMonthMarkers;
    }
  }
  // Map view //

// methods //

  FilterInput get filterInput => _filterInput;

  FilterInput defaultFilters() {
    return {
      "categories": [],
      "schedule": [],
      "onlineOrder": ["false"],
    };
  }

  Future<void> init(BuildContext context) async {
    try {
      ctx = context;
      _isLoading.value = true;
      await locPkg.Location()
          .getLocation()
          .then((locPkg.LocationData location) {
        if (location.latitude != null && location.longitude != null)
          _currentLocation = LatLng(location.latitude!, location.longitude!);
      });

      // todo @ChiragKr04 fix the location thing
      _filterInput = defaultFilters();

      final locPkg.LocationData location =
          await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
            lat: location.latitude!, lng: location.longitude!, address: "");
        await _fetchRentals();
        await _fetchBusinesses();

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
      List<HomeCard> newList = await get_home_rentals(
        distance: defaultDistance,
        fromLocation: _fromLocation!,
        withCache: false,
        offset: _rentalCurrentOffset,
        limit: rentalFetchSize,
        onlineOrdering:
            _filterInput["onlineOrder"]!.contains("true") ? true : null,
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
      List<BusinessCard> newList = await get_business_by_home(
          homeType: HomeAvailabilityOption.Rent,
          distance: defaultDistance,
          fromLocation: _fromLocation!,
          offset: _businessCurrentOffset,
          limit: businessFetchSize,
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

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> fetchMapViewRentals(
      {required LatLng? fromLoc, required double? distance}) async {
    try {
      _mapViewRentals.value = await get_home_rentals(
        distance: distance ?? getFetchDistance,
        fromLocation: fromLoc != null
            ? Location(
                lat: fromLoc.latitude, lng: fromLoc.longitude, address: "")
            : _fromLocation!,
        offset: 0,
        limit: 25,
        withCache: false,
      );
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
      _filterTag.refresh();
    }
  }

  Future<void> _fillMapsMarkers() async {
    _perDayMarkers = <MezMarker>{}.obs;
    _perWeekMarkers = <MezMarker>{}.obs;
    _perMonthMarkers = <MezMarker>{}.obs;

    for (HomeCard rental in _mapViewRentals) {
      _allMarkers.add(MezMarker(
        flat: true,
        icon: await bitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(mezHomeMarker)).buffer.asUint8List())),
            70,
            70,
            isBytes: true),
        markerId: MarkerId(rental.id.toString()),
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.location.location.lat.toDouble(),
            rental.location.location.lng.toDouble()),
      ));
      _perDayMarkers.add(MezMarker(
        flat: true,
        icon: await bitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(mezHomeMarker)).buffer.asUint8List())),
            70,
            70,
            isBytes: true),
        markerId: MarkerId(rental.id.toString()),
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.location.location.lat.toDouble(),
            rental.location.location.lng.toDouble()),
      ));

      _perWeekMarkers.add(MezMarker(
        flat: true,
        icon: await bitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(mezHomeMarker)).buffer.asUint8List())),
            70,
            70,
            isBytes: true),
        markerId: MarkerId(rental.id.toString()),
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.location.location.lat.toDouble(),
            rental.location.location.lng.toDouble()),
      ));

      _perMonthMarkers.add(MezMarker(
        flat: true,
        icon: await bitmapDescriptorLoader(
            (await cropRonded(
                (await rootBundle.load(mezHomeMarker)).buffer.asUint8List())),
            70,
            70,
            isBytes: true),
        markerId: MarkerId(rental.id.toString()),
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.location.location.lat.toDouble(),
            rental.location.location.lng.toDouble()),
      ));
    }
  }

  void setFilter(TimeUnit tag) => _filterTag.value = tag;

  void _onSelectRentalTag(HomeCard rental) {
    showModalBottomSheet<OnMapRentalCard>(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return OnMapRentalCard(rental: rental);
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

  void filter(FilterInput newData) {
    _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });
    mezDbgPrint("new data :::::::::=====>_filterInput $_filterInput");
    _resetRentals();
    _fetchRentals();
  }

  void resetFilter() {
    _filterInput = defaultFilters();
    _fetchRentals();
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
