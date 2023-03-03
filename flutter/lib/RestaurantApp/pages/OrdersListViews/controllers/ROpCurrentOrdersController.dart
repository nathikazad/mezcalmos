import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/graphql/restaurant/hsRestaurant.dart';
import 'package:mezcalmos/Shared/graphql/service_provider/hsServiceProvider.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ROpCurrentOrdersController {
  //instances
  RestaurantOpAuthController opAuthController =
      Get.find<RestaurantOpAuthController>();
  HasuraDb hasuraDb = Get.find<HasuraDb>();

  // vars
  RxList<MinimalOrder> currentOrders = <MinimalOrder>[].obs;
  RxBool initalized = RxBool(false);
  late int restaurantId;
  // Rxn<Restaurant> restaurant = Rxn();
  Rxn<ServiceStatus> _serviceStatus = Rxn();
  RxBool _isApproved = RxBool(false);
// streams
  StreamSubscription? currentOrdersListener;
  String? subscriptionId;

// getters
  bool get isOpen => _serviceStatus == ServiceStatus.Open;
  bool get isClosedIdf => _serviceStatus == ServiceStatus.ClosedIndefinitely;
  bool get isAproved => _isApproved.value;

  Future<void> init() async {
    restaurantId = opAuthController.restaurantId!;
    mezDbgPrint("INIT ORDERS 👋👋👋👋👋👋 Restaurant id $restaurantId");
    try {
      await _fetchServiceStatus(restaurantId);
      await _initOrders();
    } on Exception catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }

    initalized.value = true;
  }

  Future<void> _initOrders() async {
    currentOrders.value =
        await get_current_restaurant_orders(restaurantId: restaurantId) ?? [];

    subscriptionId = hasuraDb.createSubscription(start: () {
      currentOrdersListener =
          listen_on_current_restaurant_orders(restaurantId: restaurantId)
              .listen((List<MinimalOrder>? event) {
        if (event != null) {
          currentOrders.value = event;

          currentOrders.value.forEach((MinimalOrder order) {
            mezDbgPrint(
                "orders/inProcess/restaurant/${order.id}/notified/${Get.find<AuthController>().hasuraUserId}");
            Get.find<FirebaseDb>()
                .firebaseDatabase
                .ref()
                .child(
                    "orders/inProcess/restaurant/${order.id}/notified/${Get.find<AuthController>().hasuraUserId}")
                .set(true);
          });
        }
      });
    }, cancel: () {
      currentOrdersListener?.cancel();
      currentOrdersListener = null;
    });
  }

  Future<void> _fetchServiceStatus(int restaurantId) async {
    _serviceStatus.value =
        await get_restaurant_status(restaurantId: restaurantId);
    _isApproved.value =
        await get_restaurant_approved(restaurantId: restaurantId) ?? false;
  }

  Future<void> turnOffOrders() async {
    await update_service_state(
        status: ServiceStatus.ClosedTemporarily,
        detailsId:
            opAuthController.operator.value!.state.serviceProviderDetailsId!,
        approved: null);
    await _fetchServiceStatus(restaurantId);
  }

  Future<void> turnOnOrders() async {
    await update_service_state(
        status: ServiceStatus.Open,
        detailsId:
            opAuthController.operator.value!.state.serviceProviderDetailsId!,
        approved: null);
    await _fetchServiceStatus(restaurantId);
  }

  void dispose() {
    if (subscriptionId != null) hasuraDb.cancelSubscription(subscriptionId!);
    currentOrders.close();
  }
}
