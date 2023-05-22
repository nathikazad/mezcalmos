import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:mezcalmos/BusinessApp/pages/ServiceViews/controllers/BusinessDetailsController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/LanguagesTabsController.dart';
import 'package:mezcalmos/Shared/graphql/business_service/hsBusinessService.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';

class BsServiceViewController {
  // instances //

  LanguageTabsController languageTabsController = LanguageTabsController();

  // streams //

  // variables //
  int? serviceId;

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
    if (serviceId != null) {
      return _service.value != null &&
          languageTabsController.tabController != null;
    } else
      return languageTabsController.tabController != null;
  }

  Future<void> init(
      {required TickerProvider thickerProvider,
      required int detailsId,
      required int businessId,
      int? serviceId}) async {
    this.serviceId = serviceId;
    await languageTabsController.init(
        vsync: thickerProvider, detailsId: detailsId);
    detailsController.initDetails(
        businessId: businessId,
        language: languages!,
        businessDetailsId: detailsId);

    detailsController.addPriceTimeUnit(timeUnit: avalbleUnits.first);
    if (serviceId != null) {
      this.serviceId = serviceId;
      await initEditMode(id: serviceId);
    }
  }

  Future<void> initEditMode({required int id}) async {
    _service.value = await get_service_by_id(id: id, withCache: false);
    mezDbgPrint("service id : $id");
    if (service != null) {
      await detailsController.initEditMode(
          itemDetailsId: service!.details.id.toInt());
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
      }
    }
  }

  void dispose() {
    languageTabsController.dispose();
  }

  Future<void> createItem(Service service) async {
    mezDbgPrint(
        "Create service with this payload : ${service.toFirebaseFormattedJson()}");
    try {
      int? res = await add_one_service(service: service);

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

  Future<void> deleteOffer() async {
    try {
      await delete_business_service(serviceId: serviceId!);
      shouldRefetch = true;
    } catch (e, stk) {
      showErrorSnackBar();
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }
}
