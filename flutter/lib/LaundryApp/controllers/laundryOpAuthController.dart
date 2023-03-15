import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/laundry_operator/hsLaundryOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';

class LaundryOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;
  RxnInt _laundryId = RxnInt();
  int? get laundryId => _laundryId.value;

  int? get detailsId => operator.value?.state.serviceProviderDetailsId;

  @override
  void onInit() {
    mezDbgPrint("LaundryOperator: calling handle state change first time");
    setupLaundryOperator();
    super.onInit();
  }

  Future<void> setupLaundryOperator() async {
    operator.value = await get_laundry_operator(userId: operatorUserId);
    if (operator.value != null) {
      _laundryId.value = operator.value!.state.serviceProviderId;
    }

    mezDbgPrint("👑👑 laundry Operator :: ${operator.value?.toJson()}");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
