import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/restaurantsInfoController.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';

class OperatorsViewController {
  StreamSubscription? _restStream;
  RestaurantsInfoController _restaurantsInfoController =
      Get.find<RestaurantsInfoController>();

  Rxn<Restaurant> restaurant = Rxn();

  RxList<RestaurantOperator> ops = RxList.empty();

  //
  TextEditingController emailOrPhone = TextEditingController();
  //

  // init //

  Future<void> init({required String restaurantId}) async {
    restaurant.value =
        await _restaurantsInfoController.getRestaurant(restaurantId);
    await _getOperators();
    _restStream = _restaurantsInfoController
        .getRestaurantAsStream(restaurantId)
        .listen((Restaurant? event) {
      if (event != null) {
        restaurant.value = event;
        _getOperators();
      }
    });
  }

  Future<void> _getOperators() async {
    ops.clear();
  }

  // dispose //

  void dispose() {
    _restStream?.cancel();
    _restStream = null;
  }

  // add Operator //
  Future<bool> addOperator() async {
    // final ServerResponse response =
    //     await _restaurantsInfoController.addOperator(
    //         restId: restaurant.value!.info.id, opId: emailOrPhone.text);
    // return response.success;
    return true;
  }

  Future<bool> removeOp({required String opId}) async {
    // final ServerResponse response = await _restaurantsInfoController
    //     .removeOperator(restId: restaurant.value!.info.id, opId: opId);
    // return response.success;
    return true;
  }
}
