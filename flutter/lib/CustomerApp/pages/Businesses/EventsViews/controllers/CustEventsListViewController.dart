import 'package:get/get.dart';
import 'package:location/location.dart' as locPkg;
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustEventsListViewController {
  // variables //
  RxList<Event> _events = <Event>[].obs;
  RxBool _isLoading = false.obs;
  Location? _fromLocation;
  List<EventCategory1> _categories = <EventCategory1>[
    EventCategory1.Dance,
    EventCategory1.Party,
    EventCategory1.Social,
  ];

  // getters //
  bool get isLoading => _isLoading.value;
  List<Event> get events => _events.value;
  List<EventCategory1> get categories => _categories;

  void init() {
    _isLoading.value = true;
    locPkg.Location().getLocation().then((locPkg.LocationData value) {
      if (value.latitude != null && value.longitude != null) {
        _fromLocation = Location(lat: value.latitude!, lng: value.longitude!);
        _fetchEvents();
      }
    }).onError((Object? error, StackTrace stackTrace) {
      showErrorSnackBar(errorText: "Error getting your location");
    }).whenComplete(() => _isLoading.value = false);
  }

  Future<void> _fetchEvents() async {
    mezDbgPrint("Getting events  =====>$_fromLocation");
    if (_fromLocation == null) {
      //showErrorSnackBar(errorText: "Error getting your location");
    } else {
      _events.value = await get_event_by_category(
          offset: 0,
          limit: 15,
          categories1: _categories,
          distance: 1000000000000,
          fromLocation: _fromLocation!,
          tags: ["class"],
          scheduleType: [ScheduleType.Scheduled, ScheduleType.OneTime],
          withCache: false);
    }
  }
}
