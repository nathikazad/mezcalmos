import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/database/FirebaseDb.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/Orders/Order.dart';
// import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantsInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();

  RxBool showOnlyOpen = RxBool(true);
  String querry = "";
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsInfoController Initialized !");
  }

  Future<List<Restaurant>> getRestaurants() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child("restaurants/info")
            .once())
        .snapshot;
    final List<Restaurant> restaurants = <Restaurant>[];
    if (snapshot.value == null) return restaurants;
    // ignore: avoid_annotating_with_dynamic
    (snapshot.value as dynamic)
        ?.forEach((dynamic restaurantId, dynamic restaurantData) {
      if (restaurantData["state"]["available"] == true) {
        try {
          if (restaurantId != null && restaurantData != null) {
            restaurants.add(Restaurant.fromRestaurantData(
                restaurantId: restaurantId!, restaurantData: restaurantData!));
          }
        } catch (e, stc) {
          print(
              "Restaurant add error ${restaurantId.toString()} and data ${restaurantData["menu"].toString()}  ${e.toString()}");
          print("Restaurant add error $stc");
        }
      }
    });
    restaurants.where((Restaurant a) => a.state.isAuthorized);

    return restaurants.reversed.toList();
  }

  Future<int> getShippingPrice() async {
    final DataSnapshot snapshot = (await _databaseHelper.firebaseDatabase
            .ref()
            .child("metadata/baseShippingPrice")
            .once())
        .snapshot;
    print(
        "Gettting shipping cost ==================================>>>>>> ${snapshot.value}");
    return snapshot.value as dynamic;
  }

  Future<Restaurant?> getRestaurant(String restaurantId) async {
    return _databaseHelper.firebaseDatabase
        .ref()
        .child("restaurants/info/$restaurantId")
        .once()
        .then<Restaurant?>((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        return Restaurant.fromRestaurantData(
            restaurantId: restaurantId, restaurantData: event.snapshot.value);
      }
      return null;
    }).catchError((e) {
      throw Exception("something weird hppenend $e");
    });
  }
}
