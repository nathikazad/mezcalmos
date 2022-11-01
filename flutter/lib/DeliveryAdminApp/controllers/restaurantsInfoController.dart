import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class RestaurantsInfoController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  StreamSubscription? _restaurantsListener;
  @override
  void onInit() {
    super.onInit();
    print("--------------------> RestaurantsInfoController Initialized !");
    _restaurantsListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(serviceProviderInfos(orderType: OrderType.Restaurant))
        .onValue
        .listen((DatabaseEvent element) {
      final List<Restaurant> data = [];
      if (element.snapshot.value != null) {
        for (var laundryId in (element.snapshot.value as dynamic).keys) {
          final dynamic laundryData =
              (element.snapshot.value as dynamic)[laundryId];
          data.add(Restaurant.fromRestaurantData(
              restaurantData: laundryData, restaurantId: laundryId));
        }
      } else {}
      restaurants.value = data;
    });
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
    print("--------| the id is ${restaurantId} |------------");
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

  Future<ServerResponse> createRestaurant(
      {required String restaurantName,
      required String laundryPhoneOrEmail}) async {
    final HttpsCallable createLaundryFunc =
        FirebaseFunctions.instance.httpsCallable('restaurant-createRestaurant');
    mezDbgPrint(
        "name : $restaurantName ========= email : $laundryPhoneOrEmail");
    try {
      final HttpsCallableResult<dynamic> response = await createLaundryFunc
          .call({
        "restaurantName": restaurantName,
        "emailIdOrPhoneNumber": laundryPhoneOrEmail
      });
      mezDbgPrint('HttpsCallableResult response: ${response.data}');
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint(e);

      return ServerResponse(
        ResponseStatus.Error,
        errorMessage: "Server Error",
        errorCode: "serverError",
      );
    }
  }
}
