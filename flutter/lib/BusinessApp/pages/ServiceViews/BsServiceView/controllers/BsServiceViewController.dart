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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> scFormKey = GlobalKey<FormState>();
  bool firstFormValid = false;
  bool secondFormValid = false;

  // streams //

  // variables //

  // states variables //

  // methods //

  // instances //
  TabController? tabController;
  BusinessItemDetailsController detailsController =
      BusinessItemDetailsController();
  // vars //
  bool shouldRefetch = false;
  // state variables //
  Rxn<ServiceWithBusinessCard> _service = Rxn<ServiceWithBusinessCard>();
  ServiceWithBusinessCard? get service => _service.value;
  bool get isEditing => _service.value != null;
  Rxn<Schedule?> serviceSchedule = Rxn();

  List<TimeUnit> get _possibleTimeUnits =>
      List.unmodifiable([TimeUnit.PerHour]);
  List<TimeUnit> get avalbleUnits => _possibleTimeUnits
      .where((TimeUnit element) =>
          detailsController.priceTimeUnitMap.keys.contains(element) == false)
      .toList();

  void init({required TickerProvider thickerProvider}) {
    tabController = TabController(length: 2, vsync: thickerProvider);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
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
    if (schedule != null &&
        // This condition checks if the schedule has any [isOpen=true] timing
        (schedule.openHours.values.toList().any((element) => element.isOpen))) {
      serviceSchedule.value = schedule;
    }
  }

  Future<void> saveItemDetails() async {
    await detailsController.updateItemDetails();
  }

  Future<Service> _constructService() async {
    final BusinessItemDetails details =
        await detailsController.contructDetails();
    final Service service = Service(
      category1: ServiceCategory1.Cleaning,
      details: details,
    );
    return service;
  }

  Future<void> save() async {
    if (validate()) {
      if (isEditing) {
        await saveItemDetails();
        shouldRefetch = true;
      } else {
        final Service _service = await _constructService();
        mezDbgPrint("busniess id : ${_service.details.businessId}");

        await createItem(_service);
      }
    }
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

  bool validate() {
    if (isOnFirstTab) {
      // validate first tab
      firstFormValid = _isFirstFormValid;
      if (firstFormValid && !secondFormValid) {
        tabController?.animateTo(1);
      }
    }
    // second tab
    else {
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
