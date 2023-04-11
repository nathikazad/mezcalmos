import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/hsAdminOrders.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ScrollHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdmiOrdersListViewController {
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  ScrollController scrollController = ScrollController();

  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<MinimalOrder>> restaurantOrders = Rxn();
  RxList<MinimalOrder> restaurantPastOrders = RxList.empty();
  int restOffset = 0;
  RxList<MinimalOrder> laundryPastOrders = RxList.empty();
  int laundryOffset = 0;
  RxList<MinimalOrder> dvPastOrders = RxList.empty();
  int dvOffset = 0;
  int fetchSize = 10;
  Rxn<List<MinimalOrder>> deliveryOrders = Rxn();
  Rxn<List<MinimalOrder>> laundryOrders = Rxn();
  RxBool isFetching = RxBool(false);
  // streams
  StreamSubscription<List<MinimalOrder>?>? rOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? dvOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? laundryOrderStream;
  String? subscriptionId;

// getters //
  List<MinimalOrder> get pastOrders {
    switch (currentService) {
      case ServiceProviderType.Restaurant:
        return restaurantPastOrders;
      case ServiceProviderType.Laundry:
        return laundryPastOrders;
      case ServiceProviderType.DeliveryCompany:
        return dvPastOrders;

      default:
        return [];
    }
  }

  bool get enableShowMoreButton =>
      scrollController.positions.isNotEmpty &&
      scrollController.position.maxScrollExtent == 0.0;

  ServiceProviderType get currentService =>
      adminTabsViewController.selectedServiceProviderType.value;

  Future<void> init(
      {required AdminTabsViewController adminTabsViewController}) async {
    this.adminTabsViewController = adminTabsViewController;
    restaurantOrders.value =
        await get_admin_restaurant_orders(inProcess: true, withCache: false);

    deliveryOrders.value =
        await get_admin_dv_orders(inProcess: true, withCache: false);
    laundryOrders.value =
        await get_admin_laundry_orders(inProcess: true, withCache: false);

    subscriptionId = hasuraDb.createSubscription(start: () {
      rOrdersStream = listen_on_admin_restaurant_orders(inProcess: true)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          restaurantOrders.value?.clear();
          restaurantOrders.value?.addAll(event);

          restaurantOrders.refresh();
        }
      });
      dvOrdersStream = listen_on_admin_dv_orders(inProcess: true)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          deliveryOrders.value?.clear();
          deliveryOrders.value?.addAll(event);

          deliveryOrders.refresh();
        }
      });
      laundryOrderStream = listen_on_admin_laundry_orders(inProcess: true)
          .listen((List<MinimalOrder>? event) {
        if (event != null) {
          laundryOrders.value?.clear();
          laundryOrders.value?.addAll(event);

          laundryOrders.refresh();
        }
      });
    }, cancel: () {
      dvOrdersStream?.cancel();
      dvOrdersStream = null;
      rOrdersStream?.cancel();
      rOrdersStream = null;
      laundryOrderStream?.cancel();
      laundryOrderStream = null;
    });

    scrollController.onBottomReach(fetchServicePastOrders, sensitivity: 200);
  }

  Future<void> fetchServicePastOrders() async {
    if (isFetching.value) return;

    isFetching.value = true;
    mezDbgPrint("Fetching service orders 🥹");
    try {
      switch (currentService) {
        case ServiceProviderType.Restaurant:
          restaurantPastOrders.addAll((await get_admin_restaurant_orders(
                  inProcess: false,
                  withCache: false,
                  offset: restOffset,
                  limit: fetchSize)) ??
              []);

          print(
              '=========Fetching service orders>${restaurantPastOrders.value}');
          restOffset += 10;

          break;
        case ServiceProviderType.Laundry:
          laundryPastOrders.addAll((await get_admin_laundry_orders(
                      inProcess: false,
                      withCache: false,
                      offset: laundryOffset,
                      limit: fetchSize))
                  ?.toList() ??
              []);
          laundryOffset += 10;

          break;
        case ServiceProviderType.DeliveryCompany:
          dvPastOrders.addAll((await get_admin_dv_orders(
                      inProcess: false,
                      withCache: false,
                      offset: dvOffset,
                      limit: fetchSize))
                  ?.toList() ??
              []);
          dvOffset += 10;

          break;
        default:
      }
    } finally {
      isFetching.value = false;
    }
  }

  void dispose() {
    scrollController.dispose();
  }
}
