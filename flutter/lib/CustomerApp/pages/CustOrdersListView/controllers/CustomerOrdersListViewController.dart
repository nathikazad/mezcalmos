import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/customer/hsCustomer.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';

class CustomerOrdersListViewController {
  // instances //
  AuthController _authController = Get.find<AuthController>();

  HasuraDb _hasuraDb = Get.find<HasuraDb>();

  // state variables //
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;

  // streams //
  StreamSubscription<List<MinimalOrder>?>? currentOrdersStream;

  String? subscriptionId;
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
  bool get hasOrders => currentOrders.length + pastOrders.length > 0;

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

  Future<void> fetchCurrentOrders() async {
    currentOrders.value = await get_customer_orders(
        limit: 50,
        offest: 0,
        customerId: _authController.hasuraUserId!,
        inProcess: true);
    currentOrders.refresh();
  }

  void _listenOnOrders() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      currentOrdersStream =
          listen_on_customer_orders(customerId: _authController.hasuraUserId!)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          mezDbgPrint(
              "Stream triggred from customer order controller ✅✅✅✅✅✅✅✅✅ =====> $event");

          currentOrders.value = event;
          currentOrders.refresh();
        }
      });
    }, cancel: () {
      currentOrdersStream?.cancel();
      currentOrdersStream = null;
    });
  }

  Future<void> init() async {
    await fetchCurrentOrders();
    _listenOnOrders();
    await fetchPastOrders();

    _scrollController.onBottomReach(fetchPastOrders, sensitivity: 200);
  }

  void dispose() {
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
    _scrollController.dispose();
    mezDbgPrint("Called dispose");
  }
}
