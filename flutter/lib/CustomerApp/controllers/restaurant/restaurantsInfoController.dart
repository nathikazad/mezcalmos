import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:get/get.dart';

class RestaurantsInfoController extends GetxController {
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  late Stream<Event> restaurants;
  @override
  void onInit() {
    super.onInit();
    print("--------------------> DriverStatsController Initialized !");
    restaurants = _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info')
        .onValue;
  }

  Stream<dynamic> getRestaurants() {
    return restaurants.map<dynamic>((event) {
      dynamic snapshot = event.snapshot.value;
      return snapshot;
    });
  }

  Future<dynamic> getRestaurant(String restaurantId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/$restaurantId')
        .once();

    return snapshot.value();
  }

  Future<dynamic> getItem(String restaurantId, String itemId) async {
    DataSnapshot snapshot = await _databaseHelper.firebaseDatabase
        .reference()
        .child('restaurants/info/$restaurantId/menu/$itemId')
        .once();

    return snapshot.value();
  }
}
