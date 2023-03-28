import 'dart:async';

import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_operator/hsDeliveryOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';

class DeliveryOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;

  RxnInt _companyId = RxnInt();
  int? get companyId => _companyId.value;

  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();

  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("DeliveryAuthController: init $hashCode");
    mezDbgPrint(
        "DeliveryAuthController: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupDeliveryOperator();

    super.onInit();
  }

  Future<void> setupDeliveryOperator() async {
    // final RestaurantOperatorState? operatorState =
    //     await get_operator_state(operatorId: operatorUserId, withCache: false);
    // final UserInfo operatorInfo =
    //     await get_user_by_hasura_id(hasuraId: operatorUserId);
    operator.value = await get_delivery_operator(userId: operatorUserId);
    if (operator.value != null) {
      _companyId.value = operator.value!.state.serviceProviderId;
    }

    mezDbgPrint("👑👑 Delivery Operator :: ${operator.value?.toJson()}");
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] DeliveryAuthController::dispose ---------> Was invoked ! $hashCode");
    if (_appLifeCyclePauseCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.paused, _appLifeCyclePauseCallbackId);
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);

    super.onClose();
  }
}
