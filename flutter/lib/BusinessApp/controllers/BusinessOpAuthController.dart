import 'dart:async';

import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/business_operator/hsBusinessOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BusinessOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;

  RxnInt _companyId = RxnInt();
  int? get companyId => _companyId.value;

  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();
  BusinessProfile? _businessProfile;
  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;

  /// this getter should be used only after the operator is set
  /// otherwise it will throw an exception
  BusinessProfile? get businessProfile {
    return _businessProfile;
  }

  set setBusinessProfile(BusinessProfile? value) {
    _businessProfile = value;
  }

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("BusinessAuth: init $hashCode");
    mezDbgPrint("BusinessAuth: calling handle state change first time");

    setupBusinessOperator();

    super.onInit();
  }

  Future<void> setupBusinessOperator() async {
    try {
      mezDbgPrint("Gettign Business operator for user id: $operatorUserId");
      operator.value = await get_business_operator(userId: operatorUserId);

      mezDbgPrint("Operator value  ====>${operator.value}");
      if (operator.value != null) {
        _companyId.value = operator.value!.serviceProviderId.toInt();
        _businessProfile =
            await get_operator_business_profile(userId: operatorUserId);
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);

      // showErrorSnackBar();
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] BusinessAuthController::dispose ---------> Was invoked ! $hashCode");
    if (_appLifeCyclePauseCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.paused, _appLifeCyclePauseCallbackId);
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);

    super.onClose();
  }
}
