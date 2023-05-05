// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpPeriodPicker.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpScheduleSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/BusinessHelpers/EventHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/models/Utilities/Period.dart';

class BsEventViewController {
  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> scFormKey = GlobalKey<FormState>();
  bool firstFormValid = false;
  bool secondFormValid = false;
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  late bool isClass;
  // state variables //
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();
  Rxn<ScheduleType> scheduleType = Rxn<ScheduleType>();
  Rxn<Schedule> avalaibilty = Rxn<Schedule>();
  Rxn<PeriodOfTime> oneTimePeriod = Rxn<PeriodOfTime>();
  Rxn<Location> location = Rxn<Location>();
  // getters //
  BusinessProfile get businessProfile =>
      Get.find<BusinessOpAuthController>().businessProfile!;
  EventWithBusinessCard? get event => _event.value;
  bool get isEditing => _event.value != null;
  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        TimeUnit.PerPerson,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();
  bool get showLocation =>
      businessProfile == BusinessProfile.WellnessPractitioner ||
      businessProfile == BusinessProfile.TourAgency ||
      businessProfile == BusinessProfile.Entertainment ||
      businessProfile == BusinessProfile.Volunteer;

// methods //

  void init({required TickerProvider thickerProvider, required bool isClass}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
    this.isClass = isClass;
    setPrices();
  }

  Future<void> initEditMode({required int id}) async {
    _event.value = await get_event_by_id(id: id, withCache: false);

    mezDbgPrint("event id : $id");
    if (event != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(detalsId: event!.details.id.toInt());

      isClass = event!.tags?.contains(EventTag.Class) == true;

      location.value = event!.gpsLocation;
      scheduleType.value = event!.scheduleType;
      avalaibilty.value = event!.schedule;
      oneTimePeriod.value = event!.period;
    }
  }

  Future<void> save() async {
    if (validate()) {
      showSavedSnackBar();
      // if (isEditing) {
      //   try {
      //     await saveItemDetails();
      //     await update_event_by_id(
      //         eventId: event!.id!.toInt(), event: _constructEvent());
      //   } catch (e, stk) {
      //     mezDbgPrint(
      //         " 🛑 ${event?.id?.toInt()}  OperationException : ${e.toString()}");
      //     mezDbgPrint(stk);
      //   }
      //   shouldRefetch = true;
      // } else {
      //   Event _event = await _constructEventWithDetails();
      //   await createItem(_event);
      // }
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Event event) async {
    mezDbgPrint(
        "Create rental with this payload : ${event.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_event(event: event);

      if (res != null) {
        showSavedSnackBar();
        shouldRefetch = true;
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  Future<Event> _constructEventWithDetails() async {
    BusinessItemDetails details = await detailsController.contructDetails();
    Event event = Event(
        category1: EventCategory1.Party,
        scheduleType: scheduleType.value!,
        startsAt: oneTimePeriod.value?.start.toUtc().toString(),
        endsAt: oneTimePeriod.value?.end.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: isClass ? [EventTag.Class] : [],
        // time: oneTimePeriod.value.,
        details: details);
    return event;
  }

  Event _constructEvent() {
    Event event = Event(
        category1: EventCategory1.Party,
        scheduleType: scheduleType.value!,
        startsAt: oneTimePeriod.value?.start.toUtc().toString(),
        endsAt: oneTimePeriod.value?.end.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: isClass ? [EventTag.Class] : [],
        // time: oneTimePeriod.value.,
        details: detailsController.details!);
    return event;
  }

  // special methods //
  void switchScheduleType(ScheduleType type) {
    scheduleType.value = type;
    setPrices();
  }

  List<ScheduleTypeInput> getScheduleType() {
    switch (businessProfile) {
      case BusinessProfile.Entertainment:
        return [
          ScheduleTypeInput(
              title: "Weekly",
              subtitle: "Weekly event",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "Workshop",
              subtitle: "Workshop event",
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.Volunteer:
        return [
          ScheduleTypeInput(
              title: "Weekly",
              subtitle: "Weekly event",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "One time",
              subtitle: "One time event",
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.WellnessPractitioner:
        return [
          ScheduleTypeInput(
              title: "Weekly",
              subtitle: "An event that reoccurs on a weekly basis",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "Private session",
              subtitle: "A one on one event that clients can book with you.",
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: "Retreat",
              subtitle:
                  "A scheduled event that happens on a particular time and day where multiple people can participate. For example, Mountain top yoga retreat",
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.TourAgency:
        return [
          ScheduleTypeInput(
              title: "Weekly",
              subtitle: "An event that reoccurs on a weekly basis",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "Private session",
              subtitle: "A one on one event that clients can book with you.",
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: "Retreat",
              subtitle:
                  "A scheduled event that happens on a particular time and day where multiple people can participate. For example, Mountain top yoga retreat",
              type: ScheduleType.OneTime),
        ];
      case BusinessProfile.YogaStudio:
        return [
          ScheduleTypeInput(
              title: "Weekly",
              subtitle: "An event that reoccurs on a weekly basis",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "Private session",
              subtitle: "A one on one event that clients can book with you.",
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: "Retreat",
              subtitle:
                  "A scheduled event that happens on a particular time and day where multiple people can participate. For example, Mountain top yoga retreat",
              type: ScheduleType.OneTime),
        ];

      default:
        throw StateError(
            "BusinessProfile ${businessProfile.name} not supported");
    }
  }

  Widget getScheduleWidget() {
    switch (scheduleType.value) {
      case ScheduleType.Scheduled:
      case ScheduleType.OnDemand:
        return Obx(
          () => BsOpScheduleSelector(
            onScheduleSelected: (Schedule? v) {
              avalaibilty.value = v;
            },
            schedule: avalaibilty.value,
          ),
        );
      case ScheduleType.OneTime:
        return Obx(
          () => BsOpPeriodPicker(
            onNewPeriodSelected: (PeriodOfTime v) {
              oneTimePeriod.value = v;
            },
            timePeriod: oneTimePeriod.value,
          ),
        );
      case null:
        return Container();

      default:
        throw StateError("unhandled schedule type ${scheduleType.value}");
    }
  }

  void setPrices() {
    detailsController.clearPrices();
    if (scheduleType == ScheduleType.OnDemand &&
        businessProfile != BusinessProfile.Entertainment) {
      detailsController.addPriceTimeUnit(
        timeUnit: TimeUnit.PerHour,
      );
    } else {
      detailsController.addPriceTimeUnit(timeUnit: TimeUnit.PerPerson);
    }
  }

  void setLocation(Location v) {
    location.value = v;
  }

  bool validate() {
    if (isOnFirstTab) {
      // validate first tab
      firstFormValid = _isFirstFormValid;
      if (firstFormValid && !secondFormValid) {
        tabController?.animateTo(1);
      }
    } else {
      secondFormValid = _isSecondFormValid;
      if (secondFormValid && !firstFormValid) {
        tabController?.animateTo(0);
      }
    }
    if (secondFormValid && firstFormValid) {
      tabController?.animateTo(0);
    }
    return secondFormValid && firstFormValid;
  }

  bool get _isFirstFormValid {
    return formKey.currentState?.validate() == true;
  }

  bool get _isSecondFormValid {
    return scFormKey.currentState?.validate() == true;
  }

  bool get isBothFormValid {
    return _isFirstFormValid && _isSecondFormValid;
  }

  bool get isOnFirstTab {
    return tabController?.index == 0;
  }

  bool get isOnSecondTab {
    return tabController?.index == 1;
  }
}

class ScheduleTypeInput {
  String title;
  String subtitle;
  ScheduleType type;
  ScheduleTypeInput({
    required this.title,
    required this.subtitle,
    required this.type,
  });

  @override
  bool operator ==(covariant ScheduleTypeInput other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subtitle == subtitle &&
        other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ subtitle.hashCode ^ type.hashCode;
}
