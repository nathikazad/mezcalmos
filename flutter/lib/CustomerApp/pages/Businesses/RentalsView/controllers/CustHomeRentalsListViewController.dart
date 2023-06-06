import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/CustomerApp/pages/Businesses/Components/OnMapRentalCard.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/CustHomeRentalView.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/RentalsView/CustHomeRentalListView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/MarkerHelper.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['RentalsView']['CustHomeRentalListView'];

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

  List<RentalCard> get rentals => _rentals.value;
  List<BusinessCard> get businesses => _businesses.value;

  // Map view //
  RxBool _showFetchButton = false.obs;
  RxBool get showFetchButton => _showFetchButton;
  LatLng _currentLocation = LatLng(19.4326, -99.1332);
  LatLng get currentLocation => _currentLocation;

  List<RentalCard> get mapViewRentals => _rentals.value;
  RxList<RentalCard> _mapViewRentals = <RentalCard>[].obs;

  RxSet<Marker> _perHourMarkers = <Marker>{}.obs;
  Set<Marker> get perHourMarkers => _perHourMarkers;

  RxSet<Marker> _perDayMarkers = <Marker>{}.obs;
  Set<Marker> get perDayMarkers => _perDayMarkers;

  RxSet<Marker> _perWeekMarkers = <Marker>{}.obs;
  Set<Marker> get perWeekMarkers => _perWeekMarkers;

  RxSet<Marker> _perMonthMarkers = <Marker>{}.obs;
  Set<Marker> get perMonthMarkers => _perMonthMarkers;

  Rx<TimeUnit> _filterTag = TimeUnit.PerDay.obs;
  TimeUnit get filterTag => _filterTag.value;
  BuildContext? ctx;
  // Map view //

// methods //
  Future<void> init(BuildContext context) async {
    try {
      ctx = context;
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
        await _fetchMapViewRentals();
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

  // Map view //
  void switchView() => _isMapView.value = !_isMapView.value;

  Future<void> _fetchMapViewRentals({bool currentPostitionBased = true}) async {
    try {
      if (currentPostitionBased) {
        _showFetchButton.value = false;
        _mapViewRentals.value = await get_home_rentals(
          distance: 25000,
          fromLocation: _fromLocation!,
          offset: 0,
          limit: 25,
          withCache: false,
        );
      } else {
        _mapViewRentals.value = await get_home_rentals(
          distance: 25000,
          fromLocation: _fromLocation!,
          offset: 0,
          limit: 25,
          withCache: false,
        );
      }
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      await _fillMapsMarkers();
    }
  }

  Future<void> _fillMapsMarkers() async {
    for (RentalCard rental in _mapViewRentals) {
      // final LabelMarker marker = LabelMarker(
      //   flat: true,
      //   label: rental.details.cost.values.first.toPriceString(),
      //   markerId: MarkerId(rental.id.toString()),
      //   backgroundColor: Colors.white,
      //   onTap: () => _onSelectRentalTag(rental),
      //   position: LatLng(rental.gpsLocation!.lat.toDouble(),
      //       rental.gpsLocation!.lng.toDouble()),
      // );

      // if (rental.details.cost.keys.first == TimeUnit.PerDay) {
      //   await _perDayMarkers.addLabelMarker(marker);
      // }

      // if (rental.details.cost.keys.first == TimeUnit.PerWeek) {
      //   await _perWeekMarkers.addLabelMarker(marker);
      // }
      // if (rental.details.cost.keys.first == TimeUnit.PerMonth) {
      //   await _perMonthMarkers.addLabelMarker(marker);
      // }

      // if (rental.details.cost[TimeUnit.PerDay] == null) {
      await _perDayMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: rental.details.cost[TimeUnit.PerDay] != null
            ? rental.details.cost[TimeUnit.PerDay]?.toPriceString()
            : null,
        markerId: MarkerId(rental.id.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.gpsLocation!.lat.toDouble(),
            rental.gpsLocation!.lng.toDouble()),
      ));
      // } else {
      // await _perDayMarkers.addLabelMarker(marker);
      // }

      // if (rental.details.cost[TimeUnit.PerWeek] == null) {
      await _perWeekMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: rental.details.cost[TimeUnit.PerWeek] != null
            ? rental.details.cost[TimeUnit.PerWeek]?.toPriceString()
            : null,
        markerId: MarkerId(rental.id.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.gpsLocation!.lat.toDouble(),
            rental.gpsLocation!.lng.toDouble()),
      ));
      // } else {
      // await _perWeekMarkers.addLabelMarker(marker);
      // }

      // if (rental.details.cost[TimeUnit.PerMonth] == null) {
      await _perMonthMarkers.addLabelMarker(LabelMarker(
        flat: true,
        label: rental.details.cost[TimeUnit.PerMonth] != null
            ? rental.details.cost[TimeUnit.PerMonth]?.toPriceString()
            : null,
        markerId: MarkerId(rental.id.toString()),
        backgroundColor: Colors.white,
        onTap: () => _onSelectRentalTag(rental),
        position: LatLng(rental.gpsLocation!.lat.toDouble(),
            rental.gpsLocation!.lng.toDouble()),
      ));
      // } else {
      // await _perMonthMarkers.addLabelMarker(marker);
      // }
    }
  }

  void onCameraMove() {
    _showFetchButton.value = true;
  }

  void setFilter(TimeUnit tag) => _filterTag.value = tag;

  void _onSelectRentalTag(RentalCard rental) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: ctx!,
        builder: (BuildContext context) {
          return OnMapRentalCard(rental: rental);
        });
  }

  // Map view //

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
