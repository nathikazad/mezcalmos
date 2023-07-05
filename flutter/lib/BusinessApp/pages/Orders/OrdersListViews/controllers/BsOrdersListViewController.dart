import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/hsBusinessOrder.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/models/MinimumBsOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';

class BsOrdersListViewController {
  HasuraDb _hasuraDb = Get.find<HasuraDb>();
  final int businessId = Get.find<BusinessOpAuthController>().companyId!;
  late TabController tabController;
  RxList<MinimumBusinessItem> upcomingItems = RxList.empty();
  RxList<MinimumBusinessItem> _pastItems = RxList.empty();
  RxList<MinimalBsOrder> _pendingOrders = RxList.empty();
  List<MinimumBusinessItem> get pastItems => _pastItems;
  List<MinimalBsOrder> get pendingOrders => _pendingOrders;
  ScrollController get upcomingScrollController => _upcomingScrollController;
  ScrollController _upcomingScrollController = ScrollController();
  final int fetchSize = 10;
  int _upcomingCurrentOffset = 0;
  bool _upcomingFetchingData = false;
  bool _upcomingReachedEndOfData = false;
  ScrollController _pastScrollController = ScrollController();
  ScrollController get pastScrollController => _pastScrollController;
  int _pastCurrentOffset = 0;
  bool _pastFetchingData = false;
  bool _pastReachedEndOfData = false;
  StreamSubscription<List<MinimalBsOrder>?>? pendingOrderStream;
  String? subscriptionId;

  Future<void> init({required TickerProvider vsync}) async {
    tabController = TabController(length: 3, vsync: vsync);
    _upcomingScrollController.onBottomReach(fetchUpcoming, sensitivity: 200);
    _pastScrollController.onBottomReach(fetchPast, sensitivity: 200);
    mezDbgPrint("businessId =================>$businessId");
    _pendingOrders.value = await get_bs_orders(
            businessId: businessId,
            withCache: false,
            status: BusinessOrderRequestStatus.RequestReceived) ??
        [];
    _listenToPendingOrders();

    unawaited(fetchUpcoming());
    unawaited(fetchPast());
    mezDbgPrint("upcoming lenght =================>${upcomingItems.length}");
    mezDbgPrint("_pending lenght =================>${pendingOrders.length}");
  }

  void _listenToPendingOrders() {
    subscriptionId = _hasuraDb.createSubscription(start: () {
      pendingOrderStream = listen_on_bs_orders(
              businessId: businessId,
              status: BusinessOrderRequestStatus.RequestReceived)
          .listen((List<MinimalBsOrder>? event) {
        if (event != null) {
          _pendingOrders.clear();
          _pendingOrders.value = event;
          _pendingOrders.sort((a, b) => a.time.compareTo(b.time));
        }
      });
    }, cancel: () {
      pendingOrderStream?.cancel();
      pendingOrderStream = null;
    });
  }

  Future<void> fetchUpcoming() async {
    mezDbgPrint(
        "Fetching upcoming $_upcomingFetchingData  $_upcomingReachedEndOfData");
    if (_upcomingFetchingData || _upcomingReachedEndOfData) {
      return;
    }

    try {
      _upcomingFetchingData = true;
      mezDbgPrint("Fetching upcoming ✅✅✅✅✅");
      List<MinimumBusinessItem> newData =
          await get_upcoming_rental_orders_items(
              businessId: businessId,
              offset: _upcomingCurrentOffset,
              limit: fetchSize,
              withCache: false);
      upcomingItems += newData;
      upcomingItems.sort((a, b) => a.time.compareTo(b.time));
      if (newData.length == 0) {
        _upcomingReachedEndOfData = true;
      }
      _upcomingCurrentOffset += fetchSize;
    } finally {
      _upcomingFetchingData = false;
    }
  }

  Future<void> fetchPast() async {
    if (_pastFetchingData || _pastReachedEndOfData) {
      return;
    }

    try {
      _pastFetchingData = true;
      List<MinimumBusinessItem> newData = await get_past_rental_orders_items(
          businessId: businessId,
          offset: _pastCurrentOffset,
          limit: fetchSize,
          withCache: false);
      _pastItems += newData;
      _pastItems.sort((a, b) => a.time.compareTo(b.time));
      if (newData.length == 0) {
        _pastReachedEndOfData = true;
      }
      _pastCurrentOffset += fetchSize;
    } finally {
      _pastFetchingData = false;
    }
  }

  void dispose() {
    _upcomingScrollController.dispose();
    _pastScrollController.dispose();
    if (subscriptionId != null) _hasuraDb.cancelSubscription(subscriptionId!);
  }
}
