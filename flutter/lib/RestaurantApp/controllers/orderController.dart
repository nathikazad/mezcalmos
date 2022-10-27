import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/firebaseNodes/restaurantNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/serviceProviderNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/DeliveryMode.dart';
import 'package:mezcalmos/Shared/models/Utilities/Notification.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

class ROpOrderController extends GetxController {
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  ForegroundNotificationsController _foregroundNotificationsController =
      Get.find<ForegroundNotificationsController>();

  RxList<RestaurantOrder> currentOrders = <RestaurantOrder>[].obs;
  RxList<RestaurantOrder> pastOrders = <RestaurantOrder>[].obs;
  StreamSubscription? _currentOrdersListener;
  StreamSubscription? _pastOrdersListener;
  String? restaurantID;

  Rxn<LocationData> _currentLocation = Rxn<LocationData>(
      // LocationData.fromMap({"latitude": 15.8337, "longitude": -97.04205})
      );

  LocationData? get currentLocation => _currentLocation.value;

  Rxn<LocationData> get currentLocationRxn => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;

  Future<void> init(String restaurantId) async {
    restaurantID = restaurantId;

    mezDbgPrint(
        "--------------------> Start listening on past orders  ${serviceProviderPastOrders(orderType: OrderType.Restaurant, providerId: restaurantId)}");
    await _pastOrdersListener?.cancel();
    _pastOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderPastOrders(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((DatabaseEvent event) {
      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        (event.snapshot.value as dynamic).keys.forEach((orderId) {
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];

          try {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          } catch (e) {
            mezDbgPrint('PAST ORDER EROOOOOOR +++++++++++++++++ $orderId');
          }
        });
      }
      pastOrders.value = orders;
    }, onError: (error) {
      mezDbgPrint('EROOOOOOR +++++++++++++++++ $error');
    });

    mezDbgPrint(
        "Starting listening on inProcess : ${serviceProviderInProcessOrders(orderType: OrderType.Restaurant, providerId: restaurantId)}");
    await _currentOrdersListener?.cancel();
    _currentOrdersListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(serviceProviderInProcessOrders(
            orderType: OrderType.Restaurant, providerId: restaurantId))
        .onValue
        .listen((DatabaseEvent event) {
      // mezDbgPrint("[][][][][ got new inProcess Order ]]");

      final List<RestaurantOrder> orders = [];
      if (event.snapshot.value != null) {
        // mezDbgPrint("orderController: new incoming order data");
        (event.snapshot.value as dynamic).keys?.forEach((orderId) {
          // mezDbgPrint("Hndling Order : $orderId");
          final dynamic orderData = (event.snapshot.value as dynamic)[orderId];
          try {
            orders.add(RestaurantOrder.fromData(orderId, orderData));
          } catch (e, stk) {
            mezDbgPrint('PAST ORDER EROOOOOOR +++++++++++++++++ $orderId');
            mezDbgPrint('PAST ORDER EROOOOOOR +++++++++++++++++ $e');
            mezDbgPrint('PAST ORDER EROOOOOOR +++++++++++++++++ $stk');
          }
        });
      }
      currentOrders.value = orders;
    });
  }

  RestaurantOrder? getOrder(String orderId) {
    try {
      return currentOrders.firstWhere((DeliverableOrder order) {
        return order.orderId == orderId;
      });
    } on StateError {
      try {
        return pastOrders.firstWhere((DeliverableOrder order) {
          return order.orderId == orderId;
        });
      } on StateError {
        return null;
      }
    }
  }

  Stream<RestaurantOrder?> getOrderStream(String orderId) {
    return StreamGroup.merge(<Stream<RestaurantOrder?>>[
      _getCurrentOrderStream(orderId),
      _getPastOrderStream(orderId)
    ]);
  }

  Stream<RestaurantOrder?> _getCurrentOrderStream(String orderId) {
    return currentOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return currentOrders.firstWhere(
          (RestaurantOrder currentOrder) => currentOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

  Stream<RestaurantOrder?> _getPastOrderStream(String orderId) {
    return pastOrders.stream.map<RestaurantOrder?>((_) {
      try {
        return pastOrders.firstWhere(
          (RestaurantOrder pastOrder) => pastOrder.orderId == orderId,
        );
      } on StateError catch (_) {
        // do nothing
        // return null;
      }
      return null;
    });
  }

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
          "customerId": order.customer.id,
          "restaurantId": restaurantID!,
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
          "customerId": order.customer.id,
          "restaurantId": restaurantID!,
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
              uid: restaurantID!,
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
              customerId: order.customer.id,
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

  Future<ServerResponse> setAsReadyForOrderPickup(String orderId) async {
    mezDbgPrint("Seeting order ready for delivery");
    return _callRestaurantCloudFunction("readyForOrderPickup", orderId);
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
          "customerId": order.customer.id,
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
    _currentOrdersListener?.cancel();
    _currentOrdersListener = null;
    _pastOrdersListener?.cancel();
    _pastOrdersListener = null;
    _locationListener?.cancel();
    _locationListener = null;
    super.onClose();
  }
}
