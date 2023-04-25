import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_rental/hsBusinessRental.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/components/CustBusinessFilterSheet.dart';

class CustVolunteerListViewController {
  // variables //
  RxList<EventCard> _volunteer = <EventCard>[].obs;

  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => showBusiness.isTrue
      ? _businessScrollController
      : _volunteerScrollController;
  ScrollController _volunteerScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  final int volunteerFetchSize = 10;
  int _volunteerCurrentOffset = 0;
  bool _volunteerFetchingData = false;
  bool _volunteerReachedEndOfData = false;
  final int businessFetchSize = 10;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */

  final List<EventCategory1> _filterCategories = <EventCategory1>[
    EventCategory1.Volunteer,
  ];

  final List<EventCategory2> _categories2 = <EventCategory2>[
    EventCategory2.Uncategorized,
  ];

  RxList<EventCategory1> selectedCategories = <EventCategory1>[].obs;

  late FilterInput _filterInput;

  // getters //
  FilterInput get filterInput => _filterInput;

  bool get isLoading => _isLoading.value;
  bool get isFiltering => selectedCategories.length != _filterCategories.length;
  List<EventCard> get volunteer => _volunteer.value;
  List<BusinessCard> get businesses => _businesses.value;

  Future<void> init() async {
    _filterInput = defaultFilters();
    try {
      _isLoading.value = true;
      selectedCategories.value = List.from(_filterCategories);

      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation = Location(
          lat: location.latitude!,
          lng: location.longitude!,
          address: "",
        );
        await _fetchTherapy();
        await _fetchBusinesses();

        _volunteerScrollController.onBottomReach(_fetchTherapy,
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

  FilterInput defaultFilters() {
    return {
      "categories": _filterCategories
          .map((EventCategory1 e) => e.toFirebaseFormatString())
          .toList(),
      "schedule": [
        ScheduleType.OneTime,
      ].map((ScheduleType e) => e.toFirebaseFormatString()).toList(),
    };
  }

  Future<void> _fetchTherapy() async {
    if (_volunteerFetchingData || _volunteerReachedEndOfData) {
      return;
    }
    try {
      _volunteerFetchingData = true;
      mezDbgPrint(
          "👋 _fetchTherapy called selected categories : schedule type : ${filterInput["schedule"]!.map((String e) => e.toScheduleType()).toList()} \n ${filterInput["categories"]!.map((String e) => e.toEventCategory1()).toList()} \n ferchSize : $volunteerFetchSize \n offset: $_volunteerCurrentOffset");
      List<EventCard> newList = await get_event_by_category(
        categories1: filterInput["categories"]!
            .map((String e) => e.toEventCategory1())
            .toList(),
        distance: 100000000000,
        categories2: _categories2,
        fromLocation: _fromLocation!,
        tags: [],
        scheduleType: filterInput["schedule"]!
            .map((String e) => e.toScheduleType())
            .toList(),
        withCache: false,
        offset: _volunteerCurrentOffset,
        limit: volunteerFetchSize,
      );
      _volunteer.value += newList;
      if (newList.length == 0) {
        _volunteerReachedEndOfData = true;
      }
      _volunteerCurrentOffset += volunteerFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _volunteerFetchingData = false;
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
      List<BusinessCard> newList = await get_business_by_event_category1(
          categories1: filterInput["categories"]
                  ?.map((String e) => e.toEventCategory1())
                  .toList() ??
              _filterCategories,
          distance: 1000000000000,
          fromLocation: _fromLocation!,
          offset: _businessCurrentOffset,
          limit: businessFetchSize,
          scheduleType: filterInput["schedule"]
                  ?.map((String e) => e.toScheduleType())
                  .toList() ??
              [ScheduleType.Scheduled, ScheduleType.OneTime],
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

  void filter(FilterInput newData) {
    _filterInput.clear();
    newData.forEach((String key, List<String> value) {
      _filterInput[key] = List.from(value);
    });
    mezDbgPrint("new data :::::::::=====>_filterInput $_filterInput");
    _resetEvents();
    _fetchTherapy();
  }

  void _resetEvents() {
    _volunteer.clear();

    _volunteerCurrentOffset = 0;
    _volunteerReachedEndOfData = false;
  }

  void resetFilter() {
    _filterInput = defaultFilters();
    _fetchTherapy();
  }

  void dispose() {
    _volunteerScrollController.dispose();
    _businessScrollController.dispose();
  }
}
