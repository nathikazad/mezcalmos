import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cm;
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/graphql/restaurant_operator/hsRestaurantOperator.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';

class RestaurantOpAuthController extends GetxController {
  Rxn<Operator> operator = Rxn();
  final int operatorUserId = Get.find<AuthController>().hasuraUserId!;
  AuthController _authController = Get.find<AuthController>();

  int? get restaurantId => operator.value?.state.serviceProviderId;
  int? get restaurantDetailsId =>
      operator.value?.state.serviceProviderDetailsId;

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("RestaurantAuthController: init $hashCode");
    mezDbgPrint(
        "RestaurantAuthController: calling handle state change first time");
    // Todo @m66are remove this restaurant id hard code

    setupRestaurantOperator();

    super.onInit();
  }

  Future<void> setupRestaurantOperator() async {
    operator.value = await get_restaurant_operator(userId: operatorUserId);
    if (operator.value != null) {
      Get.find<SideMenuDrawerController>().addContactAdminItem(
          id: restaurantId!, type: cm.RecipientType.Restaurant);
    }

    mezDbgPrint("👑👑 Restaurant Operator :: ${operator.value?.toJson()}");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
