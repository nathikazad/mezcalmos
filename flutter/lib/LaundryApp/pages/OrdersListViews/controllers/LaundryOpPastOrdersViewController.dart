import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class LaundryOpPastOrdersController {
  //instances
  LaundryOpAuthController opAuthController =
      Get.find<LaundryOpAuthController>();

  // vars

  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int laundryId;

// getters

  Future<void> init() async {
    laundryId = opAuthController.laundryId!;
    mezDbgPrint("INIT PAST ORDERS 👋👋👋👋👋👋 Restaurant id $laundryId");
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
        await get_laundry_orders(laundryStoreID: laundryId, inProcess: false) ??
            [];
  }

  void dispose() {}
}
