import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantsInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsInfoController Initialized !");
  }

  Future<List<Restaurant>> getRestaurants() {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child('restaurants/info')
        .once()
        .then<List<Restaurant>>((DatabaseEvent event) {
      final List<Restaurant> restaurants = [];
      (event.snapshot.value as dynamic).forEach((key, value) {
        try {
          restaurants.add(Restaurant.fromRestaurantData(
              restaurantId: key, restaurantData: value));
        } catch (e) {
          print(e);
        }
      });
      return restaurants;
    });
  }

  Stream<Restaurant?> getRestaurantAsStream(String restaurantId) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .map<Restaurant?>((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        return Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: event.snapshot.value);
      }
      return null;
    });
  }

  Future<void> setOpen({required bool isAv, required String restaurantId}) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child(restaurantOpenNode(uid: restaurantId))
        .set(isAv);
  }

  Future<Restaurant> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child('restaurants/info/$restaurantId')
        .once()
        .then<Restaurant>((DatabaseEvent event) {
      return Restaurant.fromRestaurantData(
          restaurantId: restaurantId, restaurantData: event.snapshot.value);
    });
  }

  Future<Item> getItem(String restaurantId, String itemId) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child('restaurants/info/$restaurantId/menu/$itemId')
        .once()
        .then<Item>((DatabaseEvent event) =>
            Item.itemFromData(itemId, event.snapshot.value));
  }
}
