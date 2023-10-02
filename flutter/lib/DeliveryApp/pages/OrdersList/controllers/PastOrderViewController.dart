import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvConvoView/DvConvoView.dart';
import 'package:mezcalmos/DeliveryApp/pages/DvOrderView/DvOrderView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';

class DriverPastOrdersController {
  DriverPastOrdersController();
  RxList<DeliveryMinimalOrder> pastOrders = RxList.empty();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  /* SCROLL CONTROLLER */
  // List<DeliveryMessage> get resolvedMessages =>
  //     _messages.where((DeliveryMessage element) => element.resolved).toList();
  // List<WhMessage> get unResolvedMessages =>
  //     _messages.where((WhMessage element) => !element.resolved).toList();

  // RxList<WhMessage> _messages = RxList<WhMessage>([
  //   WhMessage(
  //     from: "12098628445",
  //     id: "wamid.HBgLMTIwOTg2Mjg0NDUVAgASGBQzQTBBOEQ2Q0E2Mjk2QjEwRDlGNAA=",
  //     resolved: false,
  //     text: TextMessage(body: "Hey"),
  //     timestamp: DateTime.now(),
  //     type: "text",
  //   ),
  //   WhMessage(
  //     from: "123456789",
  //     id: "wamid.XYZ123456789",
  //     resolved: true,
  //     text: TextMessage(body: "Hello there!"),
  //     timestamp: DateTime.now().subtract(Duration(days: 1)),
  //     type: "text",
  //   ),
  //   WhMessage(
  //     from: "987654321",
  //     id: "wamid.ABC987654321",
  //     resolved: false,
  //     text: TextMessage(body: "Hi, how are you?"),
  //     timestamp: DateTime.now().subtract(Duration(days: 2)),
  //     type: "text",
  //   ),
  //   WhMessage(
  //     from: "555555555",
  //     id: "wamid.PQR555555555",
  //     resolved: true,
  //     text: TextMessage(body: "Goodbye"),
  //     timestamp: DateTime.now().subtract(Duration(days: 3)),
  //     type: "text",
  //   ),
  // ]);

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
      final List<DeliveryMinimalOrder> newData =
          await get_delivery_minimal_orders(
                  offset: _currentOffset,
                  limit: fetchSize,
                  driverId: _deliveryAuthController.driverId!,
                  status: MinimalDeliveryOrderStatus.Finished) ??
              <DeliveryMinimalOrder>[];
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

  void handleNavigation({required DeliveryMinimalOrder order}) {
    if (order.delivery_order_type == MinimalDeliveryOrderType.Message) {
      DvConvoView.navigate(phoneNumber: order.phone_number!);
    } else {
      DvOrderView.navigate(orderId: order.id.toInt());
    }
  }

  void dispose() {
    scrollController.dispose();
  }
}
