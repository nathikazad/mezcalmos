import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class RestaurantsInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  @override
  void onInit() {
    super.onInit();
    mezDbgPrint(
        "--------------------> RestaurantsInfoController Initialized !");
  }

  Future<List<Restaurant>> getRestaurants() async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(orderType: OrderType.Restaurant))
        .once();

    mezDbgPrint("Got restorantes ===> ${snapshot.value}");
    List<Restaurant> restaurants = [];
    snapshot.value.forEach((dynamic key, dynamic value) {
      try {
        restaurants.add(Restaurant.fromRestaurantData(
            restaurantId: key, restaurantData: value));
      } catch (e) {
        mezDbgPrint("FREAKING EXCEPTION ===> $e");
      }
    });
    return restaurants;
  }

  Future<Restaurant> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .once()
        .then<Restaurant>((snapshot) {
      return Restaurant.fromRestaurantData(
          restaurantId: restaurantId, restaurantData: snapshot.value);
    });
  }

  Future<Item> getItem(String restaurantId, String itemId) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .child('menu/$itemId')
        .once()
        .then<Item>((snapshot) => Item.itemFromData(
              itemId,
              snapshot.value,
            ));
  }
}
