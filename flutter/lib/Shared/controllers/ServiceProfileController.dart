import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_cost/hsDeliveryCost.dart';
import 'package:mezcalmos/Shared/graphql/delivery_partner/hsDeliveryPartner.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Service.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryCost.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ServiceProfileController extends GetxController {
  // constants //
  late int serviceId;
  late int detailsId;
  late int deliveryDetailsId;
  // state vars //
  Rxn<MainService> _service = Rxn();
  Rxn<DeliveryCost> _serviceDeliveryCost = Rxn();

  RxBool _isAprroved = RxBool(true);
  // getters //
  MainService get service => _service.value!;
  bool get isApproved => _isAprroved.value;
  bool get selfDelivery => _serviceDeliveryCost.value?.selfDelivery ?? false;
  bool get hasData => _service.value != null;

  bool get isAvailable => _service.value!.state.isOpen;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // methods //
  // init //
  void assignVars(
      {required int serviceDetailsId,
      required int serviceId,
      required int deliveryDetailsId}) {
    detailsId = serviceDetailsId;
    this.serviceId = serviceId;
    this.deliveryDetailsId = deliveryDetailsId;
  }

  Future<void> fetchService() async {
    _service.value = await get_service_details_by_id(
        serviceDetailsId: detailsId, serviceId: serviceId, withCache: false);
    _serviceDeliveryCost.value =
        await get_delivery_cost(deliveryDetailsId: deliveryDetailsId);
    int? data = await get_service_delivery_partner(
        serviceId: serviceId, providerType: service.serviceProviderType!);
    if (_service.value != null) {
      _isAprroved.value = _service.value!.state.approved;
      _service.refresh();
    }
  }

  double get getAppbarHeight {
    double height = kToolbarHeight;
    if (!isApproved) {
      height += kToolbarHeight;
    }
    if (service.state.isClosedIndef) {
      height += kToolbarHeight;
    }
    return height;
  }

  Future<void> switchOpen(bool value) async {
    mezDbgPrint(value);
    bool res = await update_service_state(
        status: value ? ServiceStatus.Open : ServiceStatus.ClosedIndefinitely,
        approved: null,
        detailsId: detailsId);
    if (res) {
      unawaited(fetchService());
    }
  }
}
