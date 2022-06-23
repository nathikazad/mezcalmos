import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:get/get.dart';
import 'dart:async';

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
        .then<List<Restaurant>>((event) {
      List<Restaurant> restaurants = [];
      (event.snapshot.value as dynamic).forEach((dynamic key, dynamic value) {
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

  Future<Restaurant> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child('restaurants/info/$restaurantId')
        .once()
        .then<Restaurant>((event) {
      return Restaurant.fromRestaurantData(
          restaurantId: restaurantId, restaurantData: event.snapshot.value);
    });
  }

  Future<Item> getItem(String restaurantId, String itemId) {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child('restaurants/info/$restaurantId/menu/$itemId')
        .once()
        .then<Item>((event) => Item.itemFromData(itemId, event.snapshot.value));
  }
}
