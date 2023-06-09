// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/BsEventView/components/BsOpDateTimePicker.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/components/BsOpScheduleSelector.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['BusinessApp']['pages']['services'];

class BsEventViewController {
  // instances //

  LanguageTabsController languageTabsController = LanguageTabsController();
  bool firstFormValid = false;
  bool secondFormValid = false;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  int? _eventId;
  late EventCategory1 eventCategory;
  bool shouldRefetch = false;
  bool get isClass => _isClass.value;
  RxBool _isClass = false.obs;
  // state variables //
  Rxn<Schedule> serviceSchedule = Rxn();
  Rxn<EventWithBusinessCard> _event = Rxn<EventWithBusinessCard>();
  Rx<ScheduleTypeInput> scheduleTypeInput =
      Rx<ScheduleTypeInput>(ScheduleTypeInput(
    title: "title",
    subtitle: "subtitle",
    type: ScheduleType.Scheduled,
  ));
  Rxn<Schedule> avalaibilty = Rxn<Schedule>();
  Rxn<DateTime> startDate = Rxn<DateTime>();
  Rxn<DateTime> endDate = Rxn<DateTime>();
  Rxn<Location> location = Rxn<Location>();
  // getters //
  ServiceProviderLanguage? get languages => languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData {
    if (_eventId != null) {
      return _event.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  EventWithBusinessCard? get event => _event.value;
  bool get isEditing => _event.value != null;
  List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([
        TimeUnit.PerPerson,
      ]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();
  bool get showLocation {
    switch (eventCategory) {
      case EventCategory1.Surf:
        return scheduleTypeInput.value.type == ScheduleType.OneTime;
      case EventCategory1.Adventure:
      case EventCategory1.Volunteer:
      case EventCategory1.Social:
        return true;

      case EventCategory1.Therapy:
        return scheduleTypeInput.value.type != ScheduleType.OnDemand;
      case EventCategory1.Yoga:
        return scheduleTypeInput.value.type == ScheduleType.OneTime;
      default:
        return false;
    }
  }
  // RxBool _hasData = RxBool(false);

// methods //

  Future<void> init(
      {required TickerProvider thickerProvider,
      required bool isClass,
      required int detailsId,
      required int businessId,
      int? eventId,
      required EventCategory1 eventCategory}) async {
    _eventId = eventId;
    _isClass.value = isClass;
    this.eventCategory = eventCategory;
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: detailsId);
    detailsController.initDetails(
        businessId: businessId,
        language: languages!,
        businessDetailsId: detailsId);

    mezDbgPrint("Is class ================>$isClass");
    setPrices();
    if (eventId != null) {
      await initEditMode(id: eventId);
    }
    unawaited(
        get_service_schedule(serviceDetailsId: detailsId, withCache: false)
            .then((Schedule? value) => serviceSchedule.value = value));
  }

  Future<void> initEditMode({required int id}) async {
    _event.value = await get_event_by_id(id: id, withCache: false);

    mezDbgPrint("event id : $id");
    if (event != null) {
      detailsController.clearPrices();
      await detailsController.initEditMode(
          itemDetailsId: event!.details.id.toInt());

      _isClass.value = event!.tags?.contains(EventTag.Class) == true;

      location.value = event!.gpsLocation;
      scheduleTypeInput.value.type = event!.scheduleType;

      avalaibilty.value = event!.schedule;
      startDate.value = event!.startsAt != null
          ? DateTime.parse(event!.startsAt!).toLocal()
          : null;
      endDate.value = event!.endsAt != null
          ? DateTime.parse(event!.endsAt!).toLocal()
          : null;
    }
    mezDbgPrint("event schedule ========> ${event?.scheduleType.name}");
    scheduleTypeInput.refresh();
  }

  Future<void> save() async {
    if (languageTabsController.validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          _event.value = await update_event_by_id(
              eventId: event!.id!.toInt(), event: _constructEvent());
          showSavedSnackBar();
          shouldRefetch = true;
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${event?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
          showErrorSnackBar();
        }
        shouldRefetch = true;
      } else {
        final Event _event = await _constructEventWithDetails();
        await createItem(_event);
      }
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    languageTabsController.dispose();
  }

  Future<void> createItem(Event event) async {
    mezDbgPrint(
        "Create rental with this payload : ${event.toFirebaseFormattedJson()}");
    try {
      int? res = isClass
          ? await add_one_class(event: event)
          : await add_one_event(event: event);

      if (res != null) {
        showAddedSnackBar();
        shouldRefetch = true;
        detailsController.clearImages();
        await initEditMode(id: res);
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }

  Future<Event> _constructEventWithDetails() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    final EventCategory1 category1 = eventCategory;
    final Event event = Event(
        category1: category1,
        scheduleType: scheduleTypeInput.value.type,
        startsAt: startDate.value?.toUtc().toString(),
        endsAt: endDate.value?.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: scheduleTypeInput.value.tags,
        details: details);
    return event;
  }

  Event _constructEvent() {
    final EventCategory1 category1 = eventCategory;
    final Event event = Event(
        category1: category1,
        scheduleType: scheduleTypeInput.value.type,
        startsAt: startDate.value?.toUtc().toString(),
        endsAt: endDate.value?.toUtc().toString(),
        schedule: avalaibilty.value,
        gpsLocation: location.value,
        tags: scheduleTypeInput.value.tags,
        // time: oneTimePeriod.value.,
        details: detailsController.details!);
    return event;
  }

  // EventCategory1 _getCategory1() {
  //   EventCategory1 category1 = EventCategory1.Uncategorized;
  //   switch (eventcategory) {
  //     case EventCategory1.Yoga:
  //       category1 = EventCategory1.Yoga;
  //       break;
  //     case BusinessProfile.SurfShop:
  //       category1 = EventCategory1.Surf;
  //       break;
  //     // case BusinessProfile.MartialArt:
  //     //   category1 = EventCategory1.MartialArt;
  //     //   break;
  //     // case BusinessProfile.:
  //     //   category1 = EventCategory1.Party;
  //     //   break;
  //     // case BusinessProfile.:
  //     //   category1 = EventCategory1.Dance;
  //     //   break;
  //     case BusinessProfile.Entertainment:
  //       category1 = EventCategory1.Social;
  //       break;
  //     case BusinessProfile.WellnessPractitioner:
  //       category1 = EventCategory1.Therapy;
  //       break;
  //     // case BusinessProfile.:
  //     //   category1 = EventCategory1.Fitness;
  //     //   break;
  //     case BusinessProfile.TourAgency:
  //       category1 = EventCategory1.Adventure;
  //       break;
  //     case BusinessProfile.Volunteer:
  //       category1 = EventCategory1.Volunteer;
  //       break;
  //     case BusinessProfile.DanceStudio:
  //       category1 = EventCategory1.Dance;
  //       break;
  //   }
  //   return category1;
  // }

  // special methods //
  void switchScheduleType(ScheduleTypeInput inputType) {
    scheduleTypeInput.value = inputType;
    setPrices();
  }

  List<ScheduleTypeInput> getScheduleType() {
    switch (eventCategory) {
      case EventCategory1.Social:
        return [
          ScheduleTypeInput(
              title: "${_i18n()["entertainment"]["weeklyEvent"]}",
              subtitle: "${_i18n()["entertainment"]["weeklyEventLabel"]}",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "${_i18n()["entertainment"]["oneTimeEvent"]}",
              subtitle: "${_i18n()["entertainment"]["oneTimeEventLabel"]}",
              type: ScheduleType.OneTime),
        ];
      case EventCategory1.Volunteer:
        return [
          ScheduleTypeInput(
              title: "${_i18n()["volunteer"]["weeklyEvent"]}",
              subtitle: "${_i18n()["volunteer"]["weeklyEventLabel"]}",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "${_i18n()["volunteer"]["oneTimeEvent"]}",
              subtitle: "${_i18n()["volunteer"]["oneTimeEventLabel"]}",
              type: ScheduleType.OneTime),
        ];
      case EventCategory1.Therapy:
        return [
          ScheduleTypeInput(
              title: "${_i18n()["wellnessPractitioner"]["onDemand"]}",
              subtitle: _i18n()["wellnessPractitioner"]["onDemandLabel"],
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: "${_i18n()["wellnessPractitioner"]["weeklyEvent"]}",
              subtitle:
                  "${_i18n()["wellnessPractitioner"]["weeklyEventLabel"]}",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "${_i18n()["wellnessPractitioner"]["oneTimeEvent"]}",
              subtitle:
                  "${_i18n()["wellnessPractitioner"]["oneTimeEventLabel"]}",
              type: ScheduleType.OneTime),
        ];
      case EventCategory1.Adventure:
        return [
          ScheduleTypeInput(
              title: "${_i18n()["tourAgency"]["onDemand"]}",
              subtitle: "${_i18n()["tourAgency"]["onDemandLabel"]}",
              type: ScheduleType.OnDemand),
          ScheduleTypeInput(
              title: "${_i18n()["tourAgency"]["weeklyEvent"]}",
              subtitle: "${_i18n()["tourAgency"]["weeklyEventLabel"]}",
              type: ScheduleType.Scheduled),
          ScheduleTypeInput(
              title: "${_i18n()["tourAgency"]["oneTimeEvent"]}",
              subtitle: "${_i18n()["tourAgency"]["oneTimeEventLabel"]}",
              type: ScheduleType.OneTime),
        ];
      case EventCategory1.Yoga:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["onDemandClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["onDemandClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["weeklyClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["weeklyClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["oneTimeClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["oneTimeClassLabel"]}",
                    tags: [EventTag.Class, EventTag.Workshop],
                    type: ScheduleType.OneTime),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["retreat"]}",
                    subtitle: "${_i18n()["yogaStudio"]["retreatLabel"]}",
                    tags: [EventTag.Class, EventTag.Retreat],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["weeklyEvent"]}",
                    subtitle: "${_i18n()["yogaStudio"]["weeklyEventLabel"]}",
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["oneTimeEvent"]}",
                    subtitle: "${_i18n()["yogaStudio"]["oneTimeEventLabel"]}",
                    type: ScheduleType.OneTime),
              ];
      case EventCategory1.Dance:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["onDemandClass"]}",
                    subtitle: "${_i18n()["danceStudio"]["onDemandClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["weeklyClass"]}",
                    subtitle: "${_i18n()["danceStudio"]["weeklyClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["oneTimeClass"]}",
                    subtitle: "${_i18n()["danceStudio"]["oneTimeClassLabel"]}",
                    tags: [EventTag.Class, EventTag.Workshop],
                    type: ScheduleType.OneTime),
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["retreat"]}",
                    subtitle: "${_i18n()["danceStudio"]["retreatLabel"]}",
                    tags: [EventTag.Class, EventTag.Retreat],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["weeklyEvent"]}",
                    subtitle: "${_i18n()["danceStudio"]["weeklyEventLabel"]}",
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["danceStudio"]["oneTimeEvent"]}",
                    subtitle: "${_i18n()["danceStudio"]["oneTimeEventLabel"]}",
                    type: ScheduleType.OneTime),
              ];
      case EventCategory1.LanguageSchool:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["onDemandClass"]}",
                    subtitle:
                        "${_i18n()["languageSchool"]["onDemandClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["weeklyClass"]}",
                    subtitle:
                        "${_i18n()["languageSchool"]["weeklyClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["oneTimeClass"]}",
                    subtitle:
                        "${_i18n()["languageSchool"]["oneTimeClassLabel"]}",
                    tags: [EventTag.Class, EventTag.Workshop],
                    type: ScheduleType.OneTime),
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["retreat"]}",
                    subtitle: "${_i18n()["languageSchool"]["retreatLabel"]}",
                    tags: [EventTag.Class, EventTag.Retreat],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["weeklyEvent"]}",
                    subtitle:
                        "${_i18n()["languageSchool"]["weeklyEventLabel"]}",
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["languageSchool"]["oneTimeEvent"]}",
                    subtitle:
                        "${_i18n()["languageSchool"]["oneTimeEventLabel"]}",
                    type: ScheduleType.OneTime),
              ];
      case EventCategory1.Surf:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: "${_i18n()["surfShop"]["onDemandClass"]}",
                    subtitle: "${_i18n()["surfShop"]["onDemandClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: "${_i18n()["surfShop"]["weeklyClass"]}",
                    subtitle: "${_i18n()["surfShop"]["weeklyClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["surfShop"]["oneTimeClass"]}",
                    subtitle: "${_i18n()["surfShop"]["oneTimeClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: "${_i18n()["surfShop"]["weeklyEvent"]}",
                    subtitle: "${_i18n()["surfShop"]["weeklyEventLabel"]}",
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["surfShop"]["oneTimeEvent"]}",
                    subtitle: "${_i18n()["surfShop"]["oneTimeEventLabel"]}",
                    type: ScheduleType.OneTime),
              ];
      default:
        return isClass
            ? [
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["onDemandClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["onDemandClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.OnDemand),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["weeklyClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["weeklyClassLabel"]}",
                    tags: [EventTag.Class],
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["oneTimeClass"]}",
                    subtitle: "${_i18n()["yogaStudio"]["oneTimeClassLabel"]}",
                    tags: [EventTag.Class, EventTag.Workshop],
                    type: ScheduleType.OneTime),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["retreat"]}",
                    subtitle: "${_i18n()["yogaStudio"]["retreatLabel"]}",
                    tags: [EventTag.Class, EventTag.Retreat],
                    type: ScheduleType.OneTime),
              ]
            : [
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["weeklyEvent"]}",
                    subtitle: "${_i18n()["yogaStudio"]["weeklyEventLabel"]}",
                    type: ScheduleType.Scheduled),
                ScheduleTypeInput(
                    title: "${_i18n()["yogaStudio"]["oneTimeEvent"]}",
                    subtitle: "${_i18n()["yogaStudio"]["oneTimeEventLabel"]}",
                    type: ScheduleType.OneTime),
              ];
      // throw StateError(
      //     "BusinessProfile ${businessProfile.name} not supported");
    }
  }

  Widget getScheduleWidget() {
    switch (scheduleTypeInput.value.type) {
      case ScheduleType.Scheduled:
      case ScheduleType.OnDemand:
        return Obx(
          () => BsOpScheduleSelector(
            onScheduleSelected: (Schedule? v) {
              avalaibilty.value = v;
              avalaibilty.refresh();
            },
            scheduleType: scheduleTypeInput.value.type,
            schedule: avalaibilty.value,
          ),
        );
      case ScheduleType.OneTime:
        return Obx(
          () {
            return Column(
              children: [
                BsOpDateTimePicker(
                  onNewPeriodSelected: (DateTime v) {
                    startDate.value = v;
                  },
                  label: "${_i18n()['event']['startDate']}",
                  validator: (DateTime? p0) {
                    if (p0 == null)
                      return "${_i18n()['event']['startTimeErrorText']}";

                    return null;
                  },
                  time: startDate.value,
                ),
                BsOpDateTimePicker(
                  onNewPeriodSelected: (DateTime v) {
                    endDate.value = v;
                  },
                  validator: (DateTime? p0) {
                    if (p0 == null)
                      return "${_i18n()['event']['endTimeErrorText']}";
                    if (startDate.value != null &&
                        p0.isBefore(startDate.value!))
                      return "${_i18n()['event']['endTimeBeforeErrorText']}";
                    return null;
                  },
                  label: "${_i18n()['event']['endDate']}",
                  time: endDate.value,
                  startTime: startDate.value,
                ),
              ],
            );
          },
        );
      // case null:
      //   return Container();

      default:
        throw StateError("unhandled schedule type ${scheduleTypeInput.value}");
    }
  }

  void setPrices() {
    detailsController.clearPrices();
    mezDbgPrint("setPrices : ${scheduleTypeInput.value}");
    if (scheduleTypeInput.value.type == ScheduleType.OnDemand &&
        eventCategory != EventCategory1.Adventure) {
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

  Future<void> deleteOffer() async {
    try {
      await delete_business_event(eventId: event!.id!.toInt());
      shouldRefetch = true;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}

class ScheduleTypeInput {
  String title;
  String subtitle;
  ScheduleType type;
  List<EventTag>? tags;
  ScheduleTypeInput({
    required this.title,
    required this.subtitle,
    required this.type,
    this.tags,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleTypeInput &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.type == type &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return title.hashCode ^ subtitle.hashCode ^ type.hashCode ^ tags.hashCode;
  }
}
