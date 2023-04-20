import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustEventsListViewController {
  // variables //
  RxList<EventCard> _events = <EventCard>[].obs;

  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;
  String searchQuery = "";

  /* SCROLL CONTROLLER */
  ScrollController get scrollController =>
      showBusiness.isTrue ? _businessScrollController : _eventScrollController;
  ScrollController _eventScrollController = ScrollController();
  ScrollController _businessScrollController = ScrollController();
  final int eventFetchSize = 3;
  int _eventCurrentOffset = 0;
  bool _eventFetchingData = false;
  bool _eventReachedEndOfData = false;
  final int businessFetchSize = 3;
  int _businessCurrentOffset = 0;
  bool _businessFetchingData = false;
  bool _businessReachedEndOfData = false;
  /* SCROLL CONTROLLER */

  List<EventCategory1> filterCategories = <EventCategory1>[
    EventCategory1.Dance,
    EventCategory1.Party,
    EventCategory1.Social,
  ];

  RxList<EventCategory1> selectedCategories = <EventCategory1>[].obs;

  // getters //
  bool get isLoading => _isLoading.value;
  List<EventCard> get events => _events.value;
  List<BusinessCard> get businesses => _businesses.value;

  Future<void> init() async {
    try {
      _isLoading.value = true;
      selectedCategories.value = List.from(filterCategories);
      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation =
            Location(lat: location.latitude!, lng: location.longitude!);
        await _fetchEvents();
        await _fetchBusinesses();

        _eventScrollController.onBottomReach(_fetchEvents, sensitivity: 200);
        _businessScrollController.onBottomReach(_fetchBusinesses,
            sensitivity: 200);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchEvents() async {
    if (_eventFetchingData || _eventReachedEndOfData) {
      return;
    }
    try {
      _eventFetchingData = true;
      mezDbgPrint(
          "👋 _fetchEvents called with ferchSize : $eventFetchSize offset: $_eventCurrentOffset");
      List<EventCard> newList = await get_event_by_category(
        categories1: selectedCategories,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
        scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false,
        offset: _eventCurrentOffset,
        limit: eventFetchSize,
      );
      _events.value += newList;
      if (newList.length == 0) {
        _eventReachedEndOfData = true;
      }
      _eventCurrentOffset += eventFetchSize;
    } catch (e) {
      mezDbgPrint(e);
    } finally {
      _eventFetchingData = false;
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
          categories1: filterCategories,
          distance: 1000000000000,
          fromLocation: _fromLocation!,
          offset: _businessCurrentOffset,
          limit: businessFetchSize,
          scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
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

  void filter() {}

  void switchFilterCategory(bool? value, int index) {
    if (value == true) {
      selectedCategories.add(filterCategories[index]);
    } else {
      selectedCategories.remove(filterCategories[index]);
    }
  }

  void dispose() {
    _eventScrollController.dispose();
  }
}
