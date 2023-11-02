import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/delivery_order/queries/hsDleiveryOrderQuerries.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/TaxiApp/controllers/TaxiAuthController.dart';

class TaxiPastOrdersController {
  TaxiPastOrdersController();
  RxList<DeliveryMinimalOrder> pastOrders = RxList.empty();
  TaxiAuthController _TaxiAuthController = Get.find<TaxiAuthController>();

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;

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
                  driverId: _TaxiAuthController.driverId!,
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
    // if (order.delivery_order_type == MinimalDeliveryOrderType.Message) {
    //   DvConvoView.navigate(phoneNumber: order.phone_number!);
    // } else {
    //   DvOrderView.navigate(
    //       orderId: order.id.toInt(), driverId: _TaxiAuthController.driverId!);
    // }
  }

  void dispose() {
    scrollController.dispose();
  }
}
