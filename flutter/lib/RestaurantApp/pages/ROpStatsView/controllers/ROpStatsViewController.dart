import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpStatsViewController {
  // instances and streams subscriptions
  RestaurantInfoController? restaurantInfoController;
  StreamSubscription? _restaurantListener;
  ROpOrderController orderController = Get.find<ROpOrderController>();

  // state variables
  Rxn<Restaurant> restaurant = Rxn<Restaurant>();

  RxList<RestaurantOrder> currentOrders = <RestaurantOrder>[].obs;
  RxList<RestaurantOrder> pastOrders = <RestaurantOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;
  // init //
  Future<void> init({required String restaurantId}) async {
    // assigning restaurant data and start the stream subscription //
    mezDbgPrint("INIT STATS VIEW =======>$restaurantId");
    currentOrders.value = orderController.currentOrders;
    pastOrders.value = orderController.pastOrders;
    _currentOrdersListener =
        orderController.currentOrders.listen((List<RestaurantOrder> p0) {
      currentOrders.value = p0;
    });
    _pastOrdersListener =
        orderController.pastOrders.listen((List<RestaurantOrder> p0) {
      pastOrders.value = p0;
    });
    mezDbgPrint("Past orders =======>>>> ${pastOrders.length}");
    mezDbgPrint("Current orders =======>>>> ${currentOrders.length}");

    // if (!RestaurantInfoController().initialized) {
    //   Get.put(RestaurantInfoController(), permanent: false);
    // }
    // restaurantInfoController = Get.find<RestaurantInfoController>();
    // if (restaurantInfoController != null) {
    //   restaurantInfoController!.init(restId: restaurantId);
    //   restaurant.value =
    //       await restaurantInfoController!.getRestaurantAsFuture(restaurantId);

    //   _restaurantListener = restaurantInfoController!
    //       .getRestaurant(restaurantId)
    //       .listen((Restaurant? event) async {
    //     if (event != null) {
    //       restaurant.value = event;
    //     }
    //   });
    // }
  }

  Map<DateTime, List<RestaurantOrder>> getGroupedPastOrders() {
    // Creating the map

    final Map<DateTime, List<RestaurantOrder>> data = pastOrders
        .where((RestaurantOrder p0) {
      return p0.orderTime.month == DateTime.now().month &&
          DateTime.now().year == p0.orderTime.year;
    }).groupListsBy((RestaurantOrder element) => DateTime(
            element.orderTime.toLocal().year,
            element.orderTime.toLocal().month,
            element.orderTime.toLocal().day));
    // sorting the map
    final SplayTreeMap<DateTime, List<RestaurantOrder>> sortedMap =
        SplayTreeMap<DateTime, List<RestaurantOrder>>.from(data,
            (DateTime a, DateTime b) => b.toLocal().compareTo(a.toLocal()));

    return sortedMap;
  }

  num? getDayCost(DateTime date) {
    num? cost;
    final Iterable<MapEntry<DateTime, List<RestaurantOrder>>>? data =
        getGroupedPastOrders()
            .entries
            .where((MapEntry<DateTime, List<RestaurantOrder>> element) {
      return element.key.day == date.day &&
          element.key.year == date.year &&
          element.key.month == date.month;
    });

    if (data != null) {
      cost = 0;
      data.forEach((MapEntry<DateTime, List<RestaurantOrder>> element) {
        element.value.forEach((RestaurantOrder element) {
          cost = cost! + element.itemsCost;
        });
      });
    }
    return cost;
  }

  List<RestaurantOrder>? getDayOrders(DateTime date) {
    List<RestaurantOrder>? orders;
    final Iterable<MapEntry<DateTime, List<RestaurantOrder>>>? data =
        getGroupedPastOrders()
            .entries
            .where((MapEntry<DateTime, List<RestaurantOrder>> element) {
      return element.key.day == date.day &&
          element.key.year == date.year &&
          element.key.month == date.month;
    });

    if (data != null) {
      return data.first.value;
    }
    return null;
  }

  // dispose //
  void dispose() {
    _restaurantListener?.cancel();
    _currentOrdersListener?.cancel();
    _pastOrdersListener?.cancel();
  }
}
