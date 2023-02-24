import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/pages/AdminTabsView/controllers/AdminTabsViewController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/admin/orders/hsAdminOrders.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';

class AdmiOrdersListViewController {
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  late AdminTabsViewController adminTabsViewController;
  // obs //
  Rxn<List<MinimalOrder>> restaurantOrders = Rxn();
  Rxn<List<MinimalOrder>> deliveryOrders = Rxn();
  Rxn<List<MinimalOrder>> laundryOrders = Rxn();
  // streams
  StreamSubscription<List<MinimalOrder>?>? rOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? dvOrdersStream;
  StreamSubscription<List<MinimalOrder>?>? laundryOrderStream;
  String? subscriptionId;

// getters //
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
}
