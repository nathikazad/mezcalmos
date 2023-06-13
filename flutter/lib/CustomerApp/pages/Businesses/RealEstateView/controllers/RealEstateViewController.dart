import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustRealEstateViewController {
  RxList<RentalCard> _realEstates = <RentalCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  // RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  // scroll logic //
  /* SCROLL CONTROLLER */
  ScrollController get scrollController =>
      showBusiness.isTrue ? _businessScrollController : _realEstateScrollController;
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

  List<RentalCard> get realEstate => _realEstates.value;
  List<BusinessCard> get businesses => _businesses.value;

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
        _realEstateScrollController.onBottomReach(_fetchRealEstate, sensitivity: 500);
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
      List<RentalCard> newList = await get_real_estate(
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
      List<BusinessCard> newList = await get_business_by_rental_category1(
          categories1: [RentalCategory1.RealEstate],
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
}
