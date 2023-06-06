import 'dart:async';

import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/business_operator/hsBusinessOperator.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BusinessOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;

  RxnInt _companyId = RxnInt();
  RxnInt _companyDetailsId = RxnInt();
  int? get companyId => _companyId.value;
  int? get companyDetailsId => _companyDetailsId.value;

  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();

  /// TODO: Just for testing
  late BusinessProfile? _businessProfile;
  String? _appLifeCycleResumeCallbackId;
  DateTime lastSavedActiveTime = DateTime.fromMicrosecondsSinceEpoch(0);

  /// this getter should be used only after the operator is set
  /// otherwise it will throw an exception
  BusinessProfile? get businessProfile {
    // return BusinessProfile.SurfShop;
    return _businessProfile;
  }

  int get businessDetailsId =>
      operator.value!.serviceProviderDetailsId!.toInt();
  set setBusinessProfile(BusinessProfile? value) {
    _businessProfile = value;
  }

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("BusinessAuth: init $hashCode");
    mezDbgPrint("BusinessAuth: calling handle state change first time");

    setupBusinessOperator();
    checkAndSetLastActive();
    _appLifeCycleResumeCallbackId = _appLifeCycleController.attachCallback(
        Material.AppLifecycleState.resumed, checkAndSetLastActive);
    super.onInit();
  }

  void checkAndSetLastActive() {
    mezDbgPrint("Inside checkAndSetLastActive");
    if (-lastSavedActiveTime.difference(DateTime.now()) > Duration(hours: 6)) {
      // set last active time of business;
      set_last_active_time(detailsId: _companyDetailsId.value!);
    }
  }

  Future<void> setupBusinessOperator() async {
    try {
      mezDbgPrint("Gettign Business operator for user id: $operatorUserId");
      operator.value = await get_business_operator(userId: operatorUserId);

      mezDbgPrint("Operator value  ====>${operator.value}");
      _businessProfile =
          await get_operator_business_profile(userId: operatorUserId);
      mezDbgPrint("_businessProfile $_businessProfile");
      if (operator.value != null) {
        _companyId.value = operator.value!.serviceProviderId.toInt();
        _companyDetailsId.value =
            operator.value!.serviceProviderDetailsId!.toInt();
        _businessProfile =
            await get_operator_business_profile(userId: operatorUserId);
        mezDbgPrint("_businessProfile $_businessProfile");

        /// TODO: Just for testing
        // _businessProfile = BusinessProfile.SurfShop;
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
    if (_appLifeCycleResumeCallbackId != null)
      _appLifeCycleController.removeCallbackIdOfState(
          Material.AppLifecycleState.resumed, _appLifeCycleResumeCallbackId);

    super.onClose();
  }
}
