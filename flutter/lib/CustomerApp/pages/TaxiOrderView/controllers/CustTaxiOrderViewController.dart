import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/taxi/order/hsTaxiOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/User.dart';

class CustTaxiOrderViewController {
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  late int orderId;
  Rxn<TaxiOrder> _order = Rxn<TaxiOrder>();

  // getters //
  TaxiOrder? get order => _order.value;
  bool get hasData => _order.value != null;

  StreamSubscription<UserInfo?>? driverStream;
  String? subscriptionId;

  bool get hasDriver => _order.value?.driver != null;

  void init({
    required int orderId,
  }) {
    this.orderId = orderId;
    _fetchOrder();
    if (order != null) {
      _listenToDriver();
    }
  }

  Future<void> _fetchOrder() async {
    mezDbgPrint("Fetching order with order id =============>$orderId");
    _order.value = null;
    _order.value =
        await get_taxi_order_by_id(orderId: orderId, withCache: false);
  }

  void _listenToDriver() {
    subscriptionId = hasuraDb.createSubscription(start: () {
      driverStream = listen_on_taxi_order_driver(orderId: orderId)
          .listen((UserInfo? event) {
        if (event != null) {
          _order.value?.driver = null;
          _order.value?.driver = event;
        }
      });
    }, cancel: () {
      driverStream?.cancel();
      driverStream = null;
    });
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
  }

  void openDriverWhatsapp() {}
}
