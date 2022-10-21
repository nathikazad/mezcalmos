import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class ROpDriversViewController {
  // instances and streams subscriptions
  RestaurantInfoController? restaurantInfoController;
  StreamSubscription? _restaurantListener;
// textControllers //
  TextEditingController emailOrPhone = TextEditingController();
  // state variables
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();
  RxList<DeliveryDriver> drivers = RxList.empty();

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

  // dispose //
  void dispose() {
    _restaurantListener?.cancel();
  }

  // add driver //
  Future<bool> addDriver() async {
    final ServerResponse response = await restaurantInfoController!
        .addDriver(emailOrPhone.text, restaurant.value!.info.id);
    if (!response.success) {
      MezSnackbar("Error", response.errorMessage ?? "error",
          position: SnackPosition.TOP);
    }
    return response.success;
  }

// remove driver //
  Future<bool> removeDriver(String driverId) async {
    final ServerResponse response = await restaurantInfoController!
        .removeDriver(driverId, restaurant.value!.info.id);
    if (!response.success) {
      MezSnackbar("Error", response.errorMessage ?? "error",
          position: SnackPosition.TOP);
    }
    return response.success;
  }

  Future<void> _getDrivers() async {
    drivers.clear();
    mezDbgPrint(restaurant.value!.state.drivers.length);
    restaurant.value!.state.drivers.forEach((String element) async {
      mezDbgPrint("ONE TIME");
      final DeliveryDriver? dv =
          await restaurantInfoController!.getDriverById(element);
      if (dv != null && !drivers.contains(dv)) {
        drivers.add(dv);
      }
    });
  }
}
