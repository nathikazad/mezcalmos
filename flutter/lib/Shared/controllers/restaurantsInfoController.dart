import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Schedule.dart';
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

    restaurants.sort((a, b) {
      mezDbgPrint("Sortinnnnnnnnnnng");
      if (a.isAvailable() && !b.isAvailable()) {
        return 1;
      } else if (!a.isAvailable() && b.isAvailable()) {
        return -1;
      } else
        return 0;
    });
    return restaurants.reversed.toList();
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

  bool checkRestaurantAvailability({Schedule? schedule}) {
    var dayNane = DateFormat('EEEE').format(DateTime.now());

    var x = DateTime.now();

    if (schedule != null) {
      bool isOpen = false;
      schedule.openHours.forEach((key, value) {
        if (key.toFirebaseFormatString() == dayNane.toLowerCase()) {
          if (value.isOpen == true) {
            var dateOfStart =
                DateTime(x.year, x.month, x.day, value.from[0], value.from[1]);
            var dateOfClose =
                DateTime(x.year, x.month, x.day, value.to[0], value.to[1]);
            mezDbgPrint(dateOfStart.toString());
            mezDbgPrint(dateOfClose.toString());
            if (dateOfStart.isBefore(x) && dateOfClose.isAfter(x)) {
              isOpen = true;
            }
          } else {
            isOpen = false;
          }
        }
      });
      return isOpen;
    } else {
      return true;
    }
  }
}
