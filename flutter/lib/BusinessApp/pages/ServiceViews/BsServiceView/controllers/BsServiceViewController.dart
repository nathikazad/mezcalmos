import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsServiceViewController {
  // instances //
  BusinessOpAuthController _opAuthController =
      Get.find<BusinessOpAuthController>();
  LanguageTabsController languageTabsController = LanguageTabsController();

  // streams //

  // variables //

  // states variables //

  // methods //

  // instances //
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
  ServiceProviderLanguage? get languages => languageTabsController.language;
  bool get hasSecondaryLang => languages?.secondary != null;
  bool get hasData {
    if (isEditing) {
      return _service.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  Future<void> init({required TickerProvider thickerProvider}) async {
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: _opAuthController.businessDetailsId);
    detailsController.setLanguage(language: languages!);
    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
  }

  Future<void> initEditMode({required int id}) async {
    _service.value = await get_service_by_id(id: id, withCache: false);
    mezDbgPrint("service id : $id");
    if (service != null) {
      await detailsController.initEditMode(
          detalsId: service!.details.id.toInt());
      serviceSchedule.value = service?.schedule;
    }
  }

  Future<void> changeSchedule(Schedule? schedule) async {
    if (schedule != null &&
        // This condition checks if the schedule has any [isOpen=true] timing
        (schedule.openHours.values
            .toList()
            .any((OpenHours element) => element.isOpen))) {
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
      schedule: serviceSchedule.value,
    );
    return service;
  }

  Future<void> save() async {
    if (languageTabsController.validate()) {
      if (isEditing) {
        try {
          await saveItemDetails();
          await update_service_schedule(
            id: service!.details.id.toInt(),
            schedule: serviceSchedule.value!,
          );
          shouldRefetch = true;
          showSavedSnackBar();
        } catch (e, stk) {
          mezDbgPrint(
              " 🛑 ${service?.id?.toInt()}  OperationException : ${e.toString()}");
          mezDbgPrint(stk);
          showErrorSnackBar();
        }
      } else {
        final Service _service = await _constructService();
        mezDbgPrint("busniess id : ${_service.details.businessId}");
        await createItem(_service);
        showSavedSnackBar();
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
}
