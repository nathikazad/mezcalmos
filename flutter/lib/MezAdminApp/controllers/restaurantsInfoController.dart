import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/operatorNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/graphql/admin/hsAdmin.dart';
import 'package:mezcalmos/Shared/graphql/customer/cart/hsCart.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Operators/Operator.dart';
import 'package:mezcalmos/Shared/models/Operators/RestaurantOperator.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
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

  Future<void> setOpen(
      {required String status, required int restaurantId}) async {
    await set_service_status(status: status, id: restaurantId);
  }
}
