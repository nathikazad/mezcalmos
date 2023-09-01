import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/OrdersList/controllers/DriverCurrentOrdersController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class DriverPastOrdersController {
  DriverPastOrdersController();
  RxList<MinimalOrder> pastOrders = RxList.empty();

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  /* SCROLL CONTROLLER */
  List<WhMessage> get resolvedMessages =>
      _messages.where((WhMessage element) => element.resolved).toList();
  List<WhMessage> get unResolvedMessages =>
      _messages.where((WhMessage element) => !element.resolved).toList();

  RxList<WhMessage> _messages = RxList<WhMessage>([
    WhMessage(
      from: "12098628445",
      id: "wamid.HBgLMTIwOTg2Mjg0NDUVAgASGBQzQTBBOEQ2Q0E2Mjk2QjEwRDlGNAA=",
      resolved: false,
      text: TextMessage(body: "Hey"),
      timestamp: DateTime.now(),
      type: "text",
    ),
    WhMessage(
      from: "123456789",
      id: "wamid.XYZ123456789",
      resolved: true,
      text: TextMessage(body: "Hello there!"),
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      type: "text",
    ),
    WhMessage(
      from: "987654321",
      id: "wamid.ABC987654321",
      resolved: false,
      text: TextMessage(body: "Hi, how are you?"),
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      type: "text",
    ),
    WhMessage(
      from: "555555555",
      id: "wamid.PQR555555555",
      resolved: true,
      text: TextMessage(body: "Goodbye"),
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      type: "text",
    ),
  ]);

  Future<void> init() async {
    await initOrders();
  }

  Future<void> initOrders() async {
    await fetchPastOrders();

    _scrollController.onBottomReach(fetchPastOrders, sensitivity: 200);
  }

  Future<void> fetchPastOrders() async {
    if (_fetchingData || _reachedEndOfData) {
      return;
    }

    try {
      _fetchingData = true;
      final List<MinimalOrder> newData = await get_past_driver_orders(
              offset: _currentOffset,
              limit: fetchSize,
              driverId: Get.find<DeliveryAuthController>()
                  .driver!
                  .deliveryDriverId) ??
          [];
      pastOrders.value += newData;
      if (newData.length == 0) {
        _reachedEndOfData = true;
      }
      _currentOffset += fetchSize;
    } finally {
      _fetchingData = false;
    }

    // pastOrders.refresh();
  }

  void dispose() {
    scrollController.dispose();
  }
}
