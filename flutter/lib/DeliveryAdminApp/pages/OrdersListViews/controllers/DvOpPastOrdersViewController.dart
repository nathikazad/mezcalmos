import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DvOpPastOrdersController {
  //instances
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();

  // vars

  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int companyId;

// getters

  Future<void> init() async {
    companyId = opAuthController.restaurantId!;
    mezDbgPrint("INIT PAST ORDERS 👋👋👋👋👋👋 Company id $companyId");
    try {
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    pastOrders.value =
        await get_dvcompany_past_orders(companyId: companyId) ?? [];
  }

  void dispose() {}
}
