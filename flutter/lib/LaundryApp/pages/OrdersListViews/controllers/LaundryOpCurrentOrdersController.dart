import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/laundry/hsLaundry.dart';
import 'package:mezcalmos/Shared/graphql/laundry_order/hsLaundryOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class LaundryOpCurrentOrdersController {
  //instances
  LaundryOpAuthController opAuthController =
      Get.find<LaundryOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxList<MinimalOrder> pastOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int laundryId;
  // Rxn<Restaurant> restaurant = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();
  RxBool _isApproved = RxBool(false);
// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

// getters
  bool get isOpen => _serviceStatus == ServiceStatus.Open;
  bool get isAproved => _isApproved.value;

  Future<void> init() async {
    laundryId = opAuthController.laundryId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 laundry id $laundryId");
    try {
      await _fetchServiceStatus();
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    currentOrders.value =
        await get_laundry_orders(laundryStoreID: laundryId, inProcess: true) ??
            [];

    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener =
          listen_on_laundry_orders(laundryStoreID: laundryId, inProcess: true)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
    });
  }

  Future<void> _fetchServiceStatus() async {
    _serviceStatus.value = await get_laundry_status(laundryID: laundryId);
    _isApproved.value =
        await get_laundry_approved(laundryID: laundryId) ?? false;
  }

  Future<void> turnOffOrders() async {
    _serviceStatus.value = await update_laundry_status(
        id: laundryId, status: ServiceStatus.Closed_temporarily);
  }

  Future<void> turnOnOrders() async {
    _serviceStatus.value =
        await update_laundry_status(id: laundryId, status: ServiceStatus.Open);
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
