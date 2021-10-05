import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/CustomerApp/models/Restaurant.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:get/get.dart';
import 'dart:async';

class RestaurantsInfoController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsInfoController Initialized !");
  }

  Future<List<Restaurant>> getRestaurants() {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info')
        .once()
        .then<List<Restaurant>>((snapshot) {
      List<Restaurant> restaurants = [];
      snapshot.value.forEach((dynamic key, dynamic value) {
        try {
          restaurants.add(Restaurant.fromRestaurantData(value, id: key));
        } catch (e) {
          print(e);
        }
      });
      return restaurants;
    });
  }

  Future<Restaurant> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/$restaurantId')
        .once()
        .then<Restaurant>((snapshot) {
      return Restaurant.fromRestaurantData(snapshot.value, id: restaurantId);
    });
  }

  Future<Item> getItem(String restaurantId, String itemId) {
    return _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/$restaurantId/menu/$itemId')
        .once()
        .then<Item>((snapshot) => Item.itemFromData(itemId, snapshot.value));
  }
}
