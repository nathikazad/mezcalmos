import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart' as mat;
// import 'package:flutter/material.dart' as Material;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/graphql/order/hsRestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Minimal/MinimalRestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<MinimalRestaurantOrder> currentOrders = <MinimalRestaurantOrder>[].obs;
  RxList<MinimalRestaurantOrder> pastOrders = <MinimalRestaurantOrder>[].obs;
  Rxn<RestaurantOrder> order = Rxn();
  StreamSubscription? _minOrdersListener;
  StreamSubscription? _singleOrderListener;
  int? restaurantId;

  Rxn<LocationData> _currentLocation = Rxn<LocationData>(
      // LocationData.fromMap({"latitude": 15.8337, "longitude": -97.04205})
      );

  LocationData? get currentLocation => _currentLocation.value;

  Rxn<LocationData> get currentLocationRxn => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;

  String? _appLifeCyclePauseCallbackId;
  String? _appLifeCycleResumeCallbackId;
  final AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();

  @override
  Future<void> onInit() async {
    await _assignRestaurantId();

    _appLifeCyclePauseCallbackId = _appLifeCycleController
        .attachCallback(mat.AppLifecycleState.paused, () {
      _minOrdersListener?.cancel();
      _singleOrderListener?.cancel();
      _minOrdersListener = null;
      _singleOrderListener = null;
    });

    _appLifeCycleResumeCallbackId = _appLifeCycleController
        .attachCallback(mat.AppLifecycleState.resumed, () {
      startListeningOnOrders();
      if (order.value != null) {
        startListeningOnSingleOrder(int.parse(order.value!.orderId));
      }
    });
    mezDbgPrint(
        "--------------------> Start listening on restaurant $restaurantId orders");

    super.onInit();
  }

  Future<void> _assignRestaurantId() async {
    await Get.find<RestaurantOpAuthController>().setupRestaurantOperator();
    if (Get.find<RestaurantOpAuthController>()
            .operator
            .value!
            .state
            .restaurantId !=
        null) {
      restaurantId = int.parse(Get.find<RestaurantOpAuthController>()
          .operator
          .value!
          .state
          .restaurantId!);
    }
  }

  void startListeningOnOrders() {
    _minOrdersListener?.cancel();
    _minOrdersListener =
        listen_on_minimal_restaurant_orders(restaurantId: restaurantId!)
            .listen((List<MinimalRestaurantOrder>? event) {
      if (event != null) {
        currentOrders.value = event
            .where((MinimalRestaurantOrder element) => element.isPast == false)
            .toList();
        pastOrders.value = event
            .where((MinimalRestaurantOrder element) => element.isPast == true)
            .toList();
      }
    });
  }

  void startListeningOnSingleOrder(int orderId) {
    _singleOrderListener?.cancel();
    _singleOrderListener = listen_on_restaurant_order_by_id(orderId: orderId)
        .listen((RestaurantOrder? event) {
      if (event != null) {
        order.value = event;
      }
    });
  }

  Future<RestaurantOrder?> fetchOrder(int orderId) async {
    final RestaurantOrder? data =
        await get_restaurant_order_by_id(orderId: orderId);
    order.value = data;
    return data;
  }

  Future<List<MinimalRestaurantOrder>?> fetchOrders() async {
    final List<MinimalRestaurantOrder>? data =
        await get_minimal_restaurant_orders(restaurantId: restaurantId!);
    currentOrders.value = data ?? [];
    return data;
  }

  Future<ServerResponse> prepareOrder(int orderId) async {
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-prepareOrder');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderId": orderId,
        "fromRestaurantOperator": true,
      });
      mezDbgPrint("Response : ${response.data}");

      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future setReadyForDelivery(int orderId) async {
    await _callRestaurantCloudFunction(
        'restaurant-readyForOrderPickup', orderId.toString());
    // final HttpsCallable cloudFunction = FirebaseFunctions.instance
    //     .httpsCallable('restaurant-readyForOrderPickup');
    // try {
    //   final HttpsCallableResult response = await cloudFunction.call({
    //     "orderId": orderId,
    //     "fromRestaurantOperator": true,
    //   });
    //   mezDbgPrint("Response : ${response.data}");

    //   return ServerResponse.fromJson(response.data);
    // } catch (e) {
    //   mezDbgPrint("Errrooooooooor =======> $e");
    //   return ServerResponse(ResponseStatus.Error,
    //       errorMessage: "Server Error", errorCode: "serverError");
    // }
  }

// -----------OLD STUFF --------------//

  // Stream<RestaurantOrder?> getOrderStream(String orderId) {
  //   return StreamGroup.merge(<Stream<RestaurantOrder?>>[
  //     _getCurrentOrderStream(orderId),
  //     _getPastOrderStream(orderId)
  //   ]);
  // }

  // Stream<RestaurantOrder?> _getCurrentOrderStream(String orderId) {
  //   return currentOrders.stream.map<RestaurantOrder?>((_) {
  //     try {
  //       return currentOrders.firstWhere(
  //         (RestaurantOrder currentOrder) => currentOrder.orderId == orderId,
  //       );
  //     } on StateError catch (_) {
  //       // do nothing
  //       // return null;
  //     }
  //     return null;
  //   });
  // }

  // Stream<RestaurantOrder?> _getPastOrderStream(String orderId) {
  //   return pastOrders.stream.map<RestaurantOrder?>((_) {
  //     try {
  //       return pastOrders.firstWhere(
  //         (RestaurantOrder pastOrder) => pastOrder.orderId == orderId,
  //       );
  //     } on StateError catch (_) {
  //       // do nothing
  //       // return null;
  //     }
  //     return null;
  //   });
  // }

  Future<ServerResponse> cancelOrder(String orderId) async {
    return _callRestaurantCloudFunction("cancelOrderFromAdmin", orderId);
  }

  bool hasNewMessageNotification(String chatId) {
    return _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            notification.notificationType == NotificationType.NewMessage &&
            notification.chatId == chatId)
        .isNotEmpty;
  }

  void clearOrderNotifications(String orderId) {
    _foregroundNotificationsController
        .notifications()
        .where((Notification notification) =>
            (notification.notificationType ==
                    NotificationType.OrderStatusChange ||
                notification.notificationType == NotificationType.NewMessage) &&
            notification.orderId == orderId)
        .forEach((Notification notification) {
      _foregroundNotificationsController.removeNotification(notification.id);
    });
  }
  // assign selfDelivery//

  Future<void> changeDeliveryMode(
      {required RestaurantOrder order, required DeliveryMode mode}) async {
    final ServerResponse response = await _callRestaurantCloudFunction(
        "changeDeliveryMode", order.orderId,
        optionalParams: {
          "deliveryMode": mode.toFirebaseFormatString(),
          "customerId": order.customer.firebaseId,
          "restaurantId": restaurantId,
          "orderType": OrderType.Restaurant.toFirebaseFormatString(),
        });
    mezDbgPrint(
        " CHANGING DRIVER MODEE TO =====>>>> $mode ====>>${response.status}");
    mezDbgPrint("${response.status}");
    await startLocationListener(order);
  }

  Future<void> startLocationListener(RestaurantOrder order) async {
    if (order.selfDelivery &&
        order.status == RestaurantOrderStatus.OnTheWay &&
        _locationListener == null) {
      _locationListener = await _listenForLocation(order);
    }
  }

  Future<void> stopLocationListener() async {
    await _locationListener?.cancel();
    _locationListener = null;
  }

  Future<void> endSelfDelivery(RestaurantOrder order) async {
    await _callRestaurantCloudFunction("assignSelfDelivery", order.orderId,
        optionalParams: {
          "enable": false,
          "customerId": order.customer.firebaseId,
          "restaurantId": restaurantId,
          "orderType": OrderType.Restaurant.toFirebaseFormatString(),
        });
    await _locationListener?.cancel();
  }

  // assign first current location //
  Future<void> initCurrentLocation() async {
    final Location location = Location();
    _currentLocation.value = await location.getLocation();
  }

  // self delivery //

  Future<StreamSubscription<LocationData>> _listenForLocation(
      RestaurantOrder order) async {
    mezDbgPrint("Listening for location !");
    final Location location = Location();
    await location.changeSettings(interval: 1000);

    await location.enableBackgroundMode(enable: true);
    return location.onLocationChanged
        .listen((LocationData currentLocation) async {
      mezDbgPrint("\t\t [ROP ORDER CONTROLLER] LOCATION GOT UPDAAAATED !!");
      final DateTime currentTime = DateTime.now();
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        _currentLocation.value = currentLocation;

        final Map<String, dynamic> positionUpdate = <String, dynamic>{
          "lastUpdateTime": currentTime.toUtc().toString(),
          "position": <String, dynamic>{
            "lat": currentLocation.latitude,
            "lng": currentLocation.longitude
          }
        };

        await _databaseHelper.firebaseDatabase
            .ref()
            .child(restaurantOpInProcessOrdersNode(
              orderId: order.orderId,
              uid: restaurantId.toString(),
            ))
            .child("selfDeliveryDetails")
            .child("location")
            .setWithCatch(value: positionUpdate);
        //     .catchError((Object? error, StackTrace stackTrace) {
        //   mezDbgPrint(error);
        // });

        // updating driver location in root orders/inProcess/<OrderType>
        await _databaseHelper.firebaseDatabase
            .ref()
            .child(rootInProcessOrdersNode(
              orderId: order.orderId,
              orderType: order.orderType,
            ))
            .child("selfDeliveryDetails")
            .child("location")
            .setWithCatch(value: positionUpdate);
        await _databaseHelper.firebaseDatabase
            .ref()
            .child(customerInProcessOrder(
              orderId: order.orderId,
              customerId: order.customer.hasuraId.toString(),
            ))
            .child("selfDeliveryDetails")
            .child("location")
            .setWithCatch(value: positionUpdate);
      }
    });
  }

  // end self delivery //
  Future<ServerResponse> startRestaurantDelivery(String orderId) async {
    return _callRestaurantCloudFunction("startDelivery", orderId);
  }

  Future<ServerResponse> finishRestaurantDelivery(String orderId) async {
    return _callRestaurantCloudFunction("finishDelivery", orderId);
  }

  Future<ServerResponse> startPreparingOrder(String orderId) async {
    mezDbgPrint("Seeting order ready for delivery");
    return _callRestaurantCloudFunction("prepareOrder", orderId);
  }

  Future<ServerResponse> setEstimatedFoodReadyTime(
      String orderId, DateTime estimatedTime) async {
    mezDbgPrint("inside clod set delivery time $estimatedTime");
    return _callRestaurantCloudFunction("setEstimatedFoodReadyTime", orderId,
        optionalParams: {
          "estimatedFoodReadyTime": estimatedTime.toUtc().toString()
        });
  }

  Future<ServerResponse> setEstimatedSelfDeliveryTime(
      RestaurantOrder order, DateTime utc) async {
    mezDbgPrint("inside clod set delivery time $utc");
    return _callRestaurantCloudFunction("assignSelfDeliveryTime", order.orderId,
        optionalParams: {
          "time": utc.toUtc().toString(),
          "restaurantId": order.restaurantId,
          "customerId": order.customer.firebaseId,
          "orderType": OrderType.Restaurant.toFirebaseFormatString(),
        });
  }

  Future<ServerResponse> refundCustomerCustomAmount(
      String orderId, num refundAmount) async {
    mezDbgPrint("inside refundCustomerCustomAmount $refundAmount");
    return _callRestaurantCloudFunction("refundCustomerCustomAmount", orderId,
        optionalParams: {"refundAmount": refundAmount});
  }

  Future<ServerResponse> markItemUnavailable(
      String orderId, String itemId) async {
    mezDbgPrint("inside markItemUnavailable $itemId");
    return _callRestaurantCloudFunction("markOrderItemUnavailable", orderId,
        optionalParams: {"itemId": itemId});
  }

  Future<ServerResponse> _callRestaurantCloudFunction(
      String functionName, String orderId,
      {Map<String, dynamic>? optionalParams}) async {
    mezDbgPrint("calling cloud func");
    final HttpsCallable cloudFunction =
        FirebaseFunctions.instance.httpsCallable('restaurant-$functionName');
    try {
      final HttpsCallableResult response = await cloudFunction.call({
        "orderId": orderId,
        "fromRestaurantOperator": true,
        ...optionalParams ?? {}
      });
      mezDbgPrint("Response : ${response.data}");
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      mezDbgPrint("Errrooooooooor =======> $e");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "CURRENT ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! $hashCode");
    mezDbgPrint(
        "--------------------> CurrentROpOrderController::onClose called  !");
    print("[+] Orderontroller::onClose ---------> Was invoked !");
    _minOrdersListener?.cancel();
    _minOrdersListener = null;
    _singleOrderListener?.cancel();
    _singleOrderListener = null;
    _locationListener?.cancel();
    _locationListener = null;
    super.onClose();
  }
}
