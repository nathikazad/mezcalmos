import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DvOpCurrentOrdersController {
  //instances
  DeliveryOpAuthController opAuthController =
      Get.find<DeliveryOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int companyId;
  // Rxn<Restaurant> restaurant = Rxn();

// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

// getters

  Future<void> init() async {
    companyId = opAuthController.companyId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 CopmpanyId id $companyId");
    try {
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    currentOrders.value =
        await get_dvcompany_current_orders(companyId: companyId) ?? [];
    pastOrders.value =
        await get_dvcompany_past_orders(companyId: companyId) ?? [];
    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener =
          listen_on_current_dvcompany_orders(companyId: companyId)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
    });
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
