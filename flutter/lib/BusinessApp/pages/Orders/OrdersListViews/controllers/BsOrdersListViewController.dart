import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/hsBusinessOrder.dart';
import 'package:mezcalmos/Shared/graphql/buisness_order/models/MinimumBsOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class BsOrdersListViewController {
  late TabController tabController;
  RxList<MinimumBusinessItem> upcomingItems = RxList.empty();
  RxList<MinimumBusinessItem> _pastItems = RxList.empty();
  RxList<MinimumBsOrder> _pendingOrders = RxList.empty();
  // List<BusinessOrderItem> get upcomingItems => _upcomingItems;
  List<MinimumBusinessItem> get pastItems => _pastItems;
  List<MinimumBsOrder> get pendingOrders => _pendingOrders;

  Future<void> init({required TickerProvider vsync}) async {
    tabController = TabController(length: 3, vsync: vsync);
    _pendingOrders.value = await get_bs_orders(
            businessId: 1,
            status: BusinessOrderRequestStatus.RequestReceived) ??
        [];
    upcomingItems.value = await get_upcoming_rental_orders_items(
        businessId: 1, offset: 0, limit: 10);
    _pastItems.value =
        await get_past_rental_orders_items(businessId: 1, offset: 0, limit: 10);
    mezDbgPrint("upcoming lenght =================>${upcomingItems.length}");
    mezDbgPrint("_pending lenght =================>${pendingOrders.length}");
  }
}
