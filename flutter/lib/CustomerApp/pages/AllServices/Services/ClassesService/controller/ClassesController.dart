import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';

enum ClassCategory {
  Surf,
  Fitness,
  Dance,
  Yoga,
  Other,
}

class ClassesController {
  RxList<EventCategory1> category1 = <EventCategory1>[].obs;
  RxMap<ScheduleType, bool> scheduleType = {
    ScheduleType.Scheduled: true,
    ScheduleType.OnDemand: true,
    ScheduleType.OneTime: true,
  }.obs;
  RxMap<ClassCategory, bool> category2 = {
    ClassCategory.Surf: true,
    ClassCategory.Fitness: true,
    ClassCategory.Dance: true,
    ClassCategory.Yoga: true,
    ClassCategory.Other: true,
  }.obs;

  RxString filterString = "All".obs;

  void init() {}

  void changeClassFilter({
    required Map<ClassCategory, bool> category2Value,
    required Map<ScheduleType, bool> scheduleTypeValue,
  }) {
    category2.value = category2Value;
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

    // fetchOtherRentals(filterRequest: true);
  }

  void fetchClassesData() {
    var result = get_event_by_category(
      categories1: category1,
      distance: 100000000,
      fromLocation: Location(lat: 15.8.toDouble(), lng: -97.toDouble()),
      scheduleType: scheduleType.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
      withCache: true,
    );
  }
}
