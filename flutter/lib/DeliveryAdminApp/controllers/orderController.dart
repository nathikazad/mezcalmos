import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class OrderController extends GetxController {
  final HasuraDb _hasuraDb = Get.find<HasuraDb>();
  RxList<DeliveryOrder> orders = <DeliveryOrder>[].obs;

  String? _deliveryOrdersSubId;
  StreamSubscription<List<DeliveryOrder>>? _deliveryOrdersStreamSub;
  @override
  void onInit() {
    _hasuraDb.createSubscription(start: () {
      _deliveryOrdersStreamSub =
          listen_on_delivery_orders().listen((List<DeliveryOrder> event) {
        if (event.isNotEmpty) {
          orders.clear();
          orders.value = event;
        }
      });
    }, cancel: () {
      if (_deliveryOrdersSubId != null)
        _hasuraDb.cancelSubscription(_deliveryOrdersSubId!);
      _deliveryOrdersStreamSub?.cancel();
      _deliveryOrdersStreamSub = null;
    });
    super.onInit();
  }

  @override
  void onClose() {
    if (_deliveryOrdersSubId != null)
      _hasuraDb.cancelSubscription(_deliveryOrdersSubId!);
    _deliveryOrdersStreamSub?.cancel();
    _deliveryOrdersStreamSub = null;
    super.onClose();
  }
}
