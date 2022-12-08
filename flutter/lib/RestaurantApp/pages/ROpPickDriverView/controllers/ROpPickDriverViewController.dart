import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpPickDriverController {
  // instances and streams subscriptions
  // RestaurantInfoController? restaurantInfoController;
  // ROpOrderController orderController = Get.find<ROpOrderController>();
  // StreamSubscription? _restaurantListener;

// textControllers //
  TextEditingController emailOrPhone = TextEditingController();
  // state variables

  RxList<DeliveryDriver> drivers = RxList.empty();
  RxBool screenLoading = RxBool(false);
  late int serviceProviderId;
  late int orderId;
  Rxn<RestaurantOrder> order = Rxn();
  // init //
  Future<void> init({
    required int serviceProviderId,
    required int orderId,
  }) async {
    this.serviceProviderId = serviceProviderId;
    this.orderId = orderId;
    // assigning restaurant data and start the stream subscription //
    order.value = await get_restaurant_order_by_id(orderId: orderId);
    await _getDrivers();
  }

  // assign driver //
  Future<ServerResponse> assignDriver({
    required int driverId,
  }) async {
    screenLoading.value = true;

    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('delivery-assignDriver');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderId": orderId,
        "orderType": OrderType.Restaurant.toFirebaseFormatString(),
        "deliveryOrderId": orderId,
        "deliveryDriverId": driverId,
        "deliveryDriverType":
            DeliveryDriverType.Delivery_driver.toFirebaseFormatString(),
        "changeDriver": order.value!.dropoffDriver != null
      });
      mezDbgPrint("Response : ${response.data}");
      screenLoading.value = false;
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      screenLoading.value = false;
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }
  // screenLoading.value = false;

  Future<void> assignSelfDelivery({
    required RestaurantOrder order,
  }) async {
    // screenLoading.value = true;
    // await orderController.changeDeliveryMode(
    //     order: order, mode: DeliveryMode.SelfDeliveryByRestaurant);

    // Get.back();
    // screenLoading.value = false;
  }

  // dispose //
  void dispose() {
    // _restaurantListener?.cancel();
    // screenLoading.value = false;
  }

  Future<void> _getDrivers() async {
    drivers.clear();
    drivers.value = await get_drivers_by_service_provider_id(
            withCache: false, serviceProviderId: serviceProviderId) ??
        [];
  }

  Future<void> forwardToMezcalmos(RestaurantOrder order) async {
    // screenLoading.value = true;
    // await orderController.changeDeliveryMode(
    //     order: order, mode: DeliveryMode.ForwardedToMezCalmos);
    // await orderController.endSelfDelivery(order);
    // Get.back(result: false);
    // screenLoading.value = false;
  }
}
