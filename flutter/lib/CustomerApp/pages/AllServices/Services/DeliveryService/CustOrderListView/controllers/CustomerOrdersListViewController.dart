import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();
  CustomerOrderController orderController = Get.find<CustomerOrderController>();

  // state variables //
  List<MinimalOrder> get currentOrders => orderController.currentOrders.value;
  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;

  /* SCROLL CONTROLLER */
  ScrollController get scrollController => _scrollController;
  ScrollController _scrollController = ScrollController();
  final int fetchSize = 10;
  int _currentOffset = 0;
  bool _fetchingData = false;
  bool _reachedEndOfData = false;
  /* SCROLL CONTROLLER */

  // getters //
  bool get hasOrders =>
      orderController.currentOrders.length + pastOrders.length > 0;

  // methods //
  Future<void> fetchPastOrders() async {
    if (_fetchingData || _reachedEndOfData) {
      return;
    }

    try {
      _fetchingData = true;
      final List<MinimalOrder> newData = await get_customer_orders(
          offest: _currentOffset,
          limit: fetchSize,
          customerId: _authController.hasuraUserId!,
          inProcess: false);
      pastOrders.value += newData;
      if (newData.length == 0) {
        _reachedEndOfData = true;
      }
      _currentOffset += fetchSize;
    } finally {
      _fetchingData = false;
    }

    pastOrders.refresh();
  }

  Future<void> init() async {
    await fetchPastOrders();

    _scrollController.onBottomReach(fetchPastOrders, sensitivity: 200);
  }

  void dispose() {
    _scrollController.dispose();
  }
}
