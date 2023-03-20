import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/hsAdminOrders.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdmiOrdersListViewController {
  HasuraDb hasuraDb = Get.find<HasuraDb>();
  ScrollController scrollController = ScrollController();

  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<MinimalOrder>> restaurantOrders = Rxn();
  Rxn<List<MinimalOrder>> restaurantPastOrders = Rxn();
  int restLimit = 10;
  Rxn<List<MinimalOrder>> laundryPastOrders = Rxn();
  int laundryLimit = 10;
  Rxn<List<MinimalOrder>> dvPastOrders = Rxn();
  int dvLimit = 10;
  Rxn<List<MinimalOrder>> deliveryOrders = Rxn();
  Rxn<List<MinimalOrder>> laundryOrders = Rxn();
  // streams
  StreamSubscription<List<MinimalOrder>?>? rOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? dvOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? laundryOrderStream;
  String? subscriptionId;

// getters //
  List<MinimalOrder> get pastOrders {
    switch (currentService) {
      case ServiceProviderType.Restaurant:
        return restaurantPastOrders.value ?? [];
      case ServiceProviderType.Laundry:
        return laundryPastOrders.value ?? [];
      case ServiceProviderType.DeliveryCompany:
        return dvPastOrders.value ?? [];

      default:
        return [];
    }
  }

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
  }

  Future<void> fetchServicePastOrders() async {
    mezDbgPrint("Fetching service orders");
    switch (currentService) {
      case ServiceProviderType.Restaurant:
        restLimit += 10;
        restaurantPastOrders.value = await get_admin_restaurant_orders(
            inProcess: false, withCache: false, limit: restLimit);

        break;
      case ServiceProviderType.Laundry:
        laundryLimit += 10;
        laundryPastOrders.value = await get_admin_laundry_orders(
            inProcess: false, withCache: false, limit: laundryLimit);

        break;
      case ServiceProviderType.DeliveryCompany:
        dvLimit += 10;
        dvPastOrders.value = await get_admin_dv_orders(
            inProcess: false, withCache: false, limit: dvLimit);

        break;
      default:
    }
  }
}
