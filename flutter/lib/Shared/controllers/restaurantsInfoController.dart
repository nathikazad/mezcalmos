import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantsInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> RestaurantsInfoController Initialized !");
  }

  Future<List<Restaurant>> getRestaurants() async {
    final DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(orderType: OrderType.Restaurant))
        .once();
    final List<Restaurant> restaurants = <Restaurant>[];
    if (snapshot.value == null) return restaurants;
    // ignore: avoid_annotating_with_dynamic
    snapshot.value.forEach((dynamic restaurantId, dynamic restaurantData) {
      if (restaurantData["state"]["available"] == true) {
        try {
          restaurants.add(Restaurant.fromRestaurantData(
              restaurantId: restaurantId, restaurantData: restaurantData));
        } catch (e) {
          mezDbgPrint("Restaurant add error");
        }
      }
    });
    restaurants.sort((Restaurant a, Restaurant b) {
      if (a.isAvailable() && !b.isAvailable()) {
        return 1;
      } else if (!a.isAvailable() && b.isAvailable()) {
        return -1;
      } else
        return 0;
    });
    return restaurants.reversed.toList();
  }

  Future<Restaurant?> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .once()
        .then<Restaurant?>((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        return Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: snapshot.value);
      }
      return null;
    });
  }
}
