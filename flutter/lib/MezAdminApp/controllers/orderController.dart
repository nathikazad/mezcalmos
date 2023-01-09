import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/models/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/delivery_order/hsDeliveryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class OrderController extends GetxController {
  final HasuraDb _hasuraDb = Get.find<HasuraDb>();
  RxList<DeliveryOrder> orders = <DeliveryOrder>[].obs;

  String? _deliveryOrdersSubId;
  StreamSubscription<List<DeliveryOrder>>? _deliveryOrdersStreamSub;

  Future<List<DeliveryOrder>> getServiceOrders({required int serviceId}) async {
    return get_service_orders(serviceId: serviceId);
  }

  @override
  void onInit() {
    _hasuraDb.createSubscription(start: () {
      _deliveryOrdersStreamSub =
          listen_on_delivery_orders().listen((List<DeliveryOrder> event) {
        mezDbgPrint("[AAA] GOT LIST OF ORDERS ====>  ${event.length}");
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

  List<DeliveryOrder> get pastOrders =>
      orders.where((p0) => !p0.isInProcess).toList();

  List<DeliveryOrder> get currentOrders =>
      orders.where((p0) => p0.isInProcess).toList();

  DeliveryOrder? getOrder(int orderId) {
    return (<DeliveryOrder>[...pastOrders, ...currentOrders])
        .firstWhereOrNull((DeliveryOrder _order) => _order.id == orderId);
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
