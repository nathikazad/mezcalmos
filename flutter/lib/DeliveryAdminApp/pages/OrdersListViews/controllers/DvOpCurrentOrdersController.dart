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
  Rxn<List<MinimalOrder>> currentOrders = Rxn();

  late int companyId;
  // Rxn<Restaurant> restaurant = Rxn();

// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

// getters
  bool get hasData => currentOrders.value != null;

  Future<void> init() async {
    companyId = opAuthController.companyId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 CopmpanyId id $companyId");
    mezDbgPrint("hasData before await =======>$hasData");
    currentOrders.value =
        await get_dvcompany_current_orders(companyId: companyId) ?? [];

    await _initOrdersStream();
    mezDbgPrint("hasData after await =======>$hasData");
    mezDbgPrint("hasData after await =======>${currentOrders.value?.length}");
  }

  Future<void> _fetchOrders() async {}

  Future<void> _initOrdersStream() async {
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
