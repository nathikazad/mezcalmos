import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class ROpPickDriverController {
  // instances and streams subscriptions
  RestaurantInfoController? restaurantInfoController;
  ROpOrderController orderController = Get.find<ROpOrderController>();
  StreamSubscription? _restaurantListener;

// textControllers //
  TextEditingController emailOrPhone = TextEditingController();
  // state variables
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxList<DeliveryDriver> drivers = RxList.empty();
  RxBool screenLoading = RxBool(false);

  // init //
  Future<void> init({required String restaurantId}) async {
    // assigning restaurant data and start the stream subscription //
    mezDbgPrint("INIT DRIVERS VIEW =======>$restaurantId");
    if (!RestaurantInfoController().initialized) {
      Get.put(RestaurantInfoController(), permanent: false);
    }
    restaurantInfoController = Get.find<RestaurantInfoController>();
    if (restaurantInfoController != null) {
      restaurantInfoController!.init(restId: restaurantId);
      restaurant.value =
          await restaurantInfoController!.getRestaurantAsFuture(restaurantId);
      await _getDrivers();
      _restaurantListener = restaurantInfoController!
          .getRestaurant(restaurantId)
          .listen((Restaurant? event) async {
        if (event != null) {
          restaurant.value = event;
          await _getDrivers();
        }
      });
    }
  }

  // assign driver //
  Future<bool> assignDriver(
      {required String driverId,
      required String orderId,
      required RestaurantOrder order,
      required bool isChanging}) async {
    screenLoading.value = true;
    final ServerResponse response =
        await restaurantInfoController!.assignDeliveryDriver(
      deliveryDriverId: driverId,
      orderId: orderId,
      orderType: OrderType.Restaurant,
      deliveryDriverType: DeliveryDriverType.DropOff,
      changeDriver: isChanging,
    );
    if (!response.success) {
      MezSnackbar("Error", response.errorMessage ?? "error");
    }
    if (response.success) {
      mezDbgPrint("Changing delivery mode to delivery drive");
      await orderController.changeDeliveryMode(
          order: order, mode: DeliveryMode.SelfDeliveryByDriver);
    }
    screenLoading.value = false;
    return response.success;
  }

  Future<void> assignSelfDelivery({
    required RestaurantOrder order,
  }) async {
    screenLoading.value = true;
    await orderController.changeDeliveryMode(
        order: order, mode: DeliveryMode.SelfDeliveryByRestaurant);

    Get.back();
    screenLoading.value = false;
  }

  // dispose //
  void dispose() {
    _restaurantListener?.cancel();
    screenLoading.value = false;
  }

  Future<void> _getDrivers() async {
    drivers.clear();
    // restaurant.value!.state.drivers.forEach((String element) async {
    //   final DeliveryDriver? dv =
    //       await restaurantInfoController!.getDriverById(element);
    //   if (dv != null && !drivers.contains(dv)) {
    //     drivers.add(dv);
    //   }
    // });
  }

  Future<void> forwardToMezcalmos(RestaurantOrder order) async {
    screenLoading.value = true;
    await orderController.changeDeliveryMode(
        order: order, mode: DeliveryMode.ForwardedToMezCalmos);
    await orderController.endSelfDelivery(order);
    Get.back(result: false);
    screenLoading.value = false;
  }
}
