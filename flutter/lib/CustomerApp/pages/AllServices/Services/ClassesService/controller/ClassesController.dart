import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

enum ClassCategory {
  Surf,
  Fitness,
  Dance,
  Yoga,
  Other,
}

class ClassesController {
  RxMap<ScheduleType, bool> scheduleType = {
    ScheduleType.Scheduled: true,
    ScheduleType.OnDemand: true,
    ScheduleType.OneTime: true,
  }.obs;
  RxMap<EventCategory1, bool> category1 = {
    EventCategory1.Surf: true,
    EventCategory1.Fitness: true,
    EventCategory1.Dance: true,
    EventCategory1.Yoga: true,
  }.obs;
  RxList<EventCategory2> category2 =
      <EventCategory2>[EventCategory2.Uncategorized].obs;

  RxString filterString = "All".obs;
  RxList<EventCard> classesData = <EventCard>[].obs;

  void init() {
    fetchClassesData();
  }

  void changeClassFilter({
    required Map<EventCategory1, bool> category1Value,
    required Map<ScheduleType, bool> scheduleTypeValue,
  }) {
    category1.value = category1Value;
    scheduleType.value = scheduleTypeValue;

    if (!scheduleTypeValue.containsValue(false)) {
      filterString.value = "All";
    } else {
      filterString.value = scheduleTypeValue.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key.name)
          .toList()
          .join(" ");
    }
    fetchClassesData();
    // fetchOtherRentals(filterRequest: true);
  }

  Future<void> fetchClassesData() async {
    mezDbgPrint2("fetchClassesData: $category1 $category2");
    var result = await get_event_by_category(
      categories1: category1.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
      categories2: category2,
      tags: ["class"],
      distance: 100000000,
      fromLocation: Location(
        lat: 15.8.toDouble(),
        lng: -97.toDouble(),
        address: "",
      ),
      scheduleType: scheduleType.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
      withCache: true,
    );
    mezDbgPrint2(
        "get_event_by_category ${result.map((e) => mezDbgPrint2(e.businessName))}");
    classesData.value = result;
  }
}
