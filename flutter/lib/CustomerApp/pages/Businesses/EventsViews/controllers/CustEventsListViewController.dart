import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business/hsBusiness.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class CustEventsListViewController {
  // variables //
  RxList<EventCard> _events = <EventCard>[].obs;
  RxList<EventCard> _filtredEvents = <EventCard>[].obs;
  RxList<BusinessCard> _businesses = <BusinessCard>[].obs;
  RxList<BusinessCard> _filtredBusiness = <BusinessCard>[].obs;

  RxBool _isLoading = false.obs;
  RxBool showBusiness = false.obs;
  Location? _fromLocation;

  List<EventCategory1> baseCategories = <EventCategory1>[
    EventCategory1.Dance,
    EventCategory1.Party,
    EventCategory1.Social,
  ];
  List<EventCategory1> filterCategories = <EventCategory1>[
    EventCategory1.Dance,
    EventCategory1.Party,
    EventCategory1.Social,
  ];

  RxList<EventCategory1> selectedCategories = <EventCategory1>[].obs;

  // getters //
  bool get isLoading => _isLoading.value;
  List<EventCard> get events => _filtredEvents.value;
  List<BusinessCard> get businesses => _filtredBusiness.value;

  Future<void> init() async {
    try {
      _isLoading.value = true;
      locPkg.LocationData location = await locPkg.Location().getLocation();
      if (location.latitude != null && location.longitude != null) {
        _fromLocation =
            Location(lat: location.latitude!, lng: location.longitude!);
      }
      await _fetchEvents();
      await _fetchBusinesses();
      _filtredBusiness.value.addAll(_businesses.value);
      _filtredEvents.value.addAll(_events.value);
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
      // TODO
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _fetchEvents() async {
    mezDbgPrint("Getting events  =====>${filterCategories.length}");
    _events.value.clear();
    _events.value = await get_event_by_category(
        offset: 0,
        limit: 15,
        categories1: filterCategories,
        distance: 1000000000000,
        fromLocation: _fromLocation!,
        tags: [],
        scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false);
  }

  Future<void> _fetchBusinesses() async {
    mezDbgPrint("Getting events businesses  =====>$_fromLocation");
    _businesses.clear();
    _businesses.value = await get_business_by_event_category1(
        offset: 0,
        limit: 15,
        category1: filterCategories.first,
        distance: 1000000000000,
        fromLocation: _fromLocation!,

        // scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
        withCache: false);
  }

  void filter(String value) {
    if (value.length > 2) {
      _filtredEvents.value = _events.value
          .where((EventCard element) => element.details.name[userLanguage]!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
      _filtredBusiness.value = _businesses.value
          .where((BusinessCard element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _filtredBusiness.value = _businesses.toList();
      _filtredEvents.value = _events.toList();
    }
  }

  Future<void> filterEvents() async {
    _isLoading.value = true;
    filterCategories.clear();
    filterCategories.addAll(selectedCategories);
    await _fetchEvents();
    _isLoading.value = false;
  }
}
