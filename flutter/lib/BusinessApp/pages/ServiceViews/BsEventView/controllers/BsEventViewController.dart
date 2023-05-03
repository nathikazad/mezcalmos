// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsEventViewController {
  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<EventWithBusinessCard> _events = Rxn<EventWithBusinessCard>();
  // getters //
  BusinessProfile get businessProfile =>
      Get.find<BusinessOpAuthController>().businessProfile;
  EventWithBusinessCard? get events => _events.value;
  bool get isEditing => _events.value != null;

// methods //

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> initEditMode({required int id}) async {
    _events.value = await get_event_by_id(id: id, withCache: false);
    mezDbgPrint("event id : $id");
    if (events != null) {
      await detailsController.initEditMode(
          detalsId: events!.details.id.toInt());
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
  // special methods //
  // List<ScheduleTypeInput> getScheduleType() {
  //   switch (businessProfile) {
  //     case BusinessProfile.Cleaning:

  //       break;
  //     default:
  //   }
  // }
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
