import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/BsOpSchedulePickerView/BsOpSchedulePickerView.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsServiceViewController {
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
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();
  ServiceWithBusinessCard? get service => _service.value;
  bool get isEditing => _service.value != null;
  Rx<Schedule?> serviceSchedule = Rx(null);

    List<TimeUnit> get _possibleTimeUnits => List.unmodifiable([TimeUnit.PerHour]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
  }

  Future<void> initEditMode({required int id}) async {
    _service.value = await get_service_by_id(id: id, withCache: false);
    mezDbgPrint("service id : $id");
    if (service != null) {
      await detailsController.initEditMode(
          detalsId: service!.details.id.toInt());
    }
  }

  Future<void> changeSchedule(Schedule? schedule) async {
    serviceSchedule.value = schedule;
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  void dispose() {
    // TODO: implement dispose
  }

  Future<void> createItem(Service service) async {
    mezDbgPrint(
        "Create service with this payload : ${service.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_service(service: service);

      if (res != null) {
        showSavedSnackBar();
        shouldRefetch = true;
      }
    } on OperationException catch (e) {
      mezDbgPrint(" 🛑  OperationException : ${e.graphqlErrors[0].message}");
    }
  }
}
