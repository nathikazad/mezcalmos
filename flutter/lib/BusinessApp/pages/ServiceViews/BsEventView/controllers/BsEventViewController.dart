import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_event/hsBusinessEvent.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsEventViewController {
  // instances //

  // streams //

  // variables //

  // states variables //

  // methods //

  // instances //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<EventWithBusinessCard> _events = Rxn<EventWithBusinessCard>();
  EventWithBusinessCard? get events => _events.value;
  bool get isEditing => _events.value != null;

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
}
