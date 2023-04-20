import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustRentalsListViewController {
  // variables //
  RxList<RentalCard> _rentals = <RentalCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  List<RentalCategory2> _filterCategories = <RentalCategory2>[];

  RxList<RentalCategory2> selectedCategories = <RentalCategory2>[].obs;
  RxList<RentalCategory2> previewCategories = <RentalCategory2>[].obs;
  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController =>
      showBusiness.isTrue ? _businessScrollController : _rentalScrollController;
  ScrollController _rentalScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  int rentalFetchSize = 3;
  int _rentalCurrentOffset = 0;
  bool _rentalFetchingData = false;
  bool _rentalReachedEndOfData = false;
  final int businessFetchSize = 3;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // scroll logic //

  // getters //
  bool get isLoading => _isLoading.value;
  bool get isFiltering => selectedCategories.length != _filterCategories.length;
  List<RentalCategory2> get filterCategories => _filterCategories;

  bool get isVehicle => rentalCategory == RentalCategory1.Vehicle;
  bool get showFilter =>
      rentalCategory == RentalCategory1.Vehicle && showBusiness.isFalse;
  List<RentalCard> get rentals => _rentals.value;
  List<BusinessCard> get businesses => _businesses.value;

  /// return current view rental category (Home, Surf, etc)
  RentalCategory1 get rentalCategory => _currentRentalCategory;

  late RentalCategory1 _currentRentalCategory;

// methods //
  Future<void> init({required RentalCategory1 rentalCategory}) async {
    _currentRentalCategory = rentalCategory;
    if (isVehicle) {
      filterCategories.addAll([
        RentalCategory2.Motorcycle,
        RentalCategory2.Car,
        RentalCategory2.Bicycle,
      ]);
      selectedCategories.value = List.from(filterCategories);
      previewCategories.value = List.from(filterCategories);
    }
    try {
      _isLoading.value = true;

      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation =
            Location(lat: location.latitude!, lng: location.longitude!);
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
          "👋 _fetchRentals called selected categories : $selectedCategories \n ferchSize : $rentalFetchSize \n offset: $_rentalCurrentOffset");
      List<RentalCard> newList = await get_rental_by_category(
        category1: rentalCategory,
        categories2: (isVehicle) ? selectedCategories : null,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
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
          category1: _currentRentalCategory,
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
    selectedCategories.value = List.from(previewCategories);

    _resetRentals();
    _fetchRentals();
  }

  void resetFilter() {
    previewCategories.value = List.from(filterCategories);
    selectedCategories.value = List.from(filterCategories);
    _fetchRentals();
  }

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      previewCategories.add(filterCategories[index]);
    } else {
      previewCategories.remove(filterCategories[index]);
    }
  }

  void _resetRentals() {
    _rentals.clear();
    _rentalCurrentOffset = 0;
    _rentalReachedEndOfData = false;
  }
}
