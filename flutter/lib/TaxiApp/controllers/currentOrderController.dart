import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/models/Notification.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class CurrentOrderController extends GetxController {
  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); 
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>();
  FBNotificationsController _fbNotificationsController =
      Get.find<FBNotificationsController>(); 

  StreamController<TaxiOrder> _orderStreamController =
      StreamController.broadcast();
  Stream<TaxiOrder> get orderStream => _orderStreamController.stream;
  StreamSubscription? _orderStatusListener;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("Current TaxiOrder Controller init ${this.hashCode}");
    mezDbgPrint(_taxiAuthController.taxiState?.currentOrder);
  }

  Future<void> listenForOrderStatus() async {
    await _orderStatusListener?.cancel();
    _orderStatusListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(orderStatus(_taxiAuthController.taxiState!.currentOrder!))
        .onValue
        .listen((event) async {
      DataSnapshot dataSnapshot = await _databaseHelper.firebaseDatabase
          .reference()
          .child(orderId(_taxiAuthController.taxiState!.currentOrder!))
          .once();
      _orderStreamController
          .add(TaxiOrder.fromData(dataSnapshot.key, dataSnapshot.value));
    });
  }

  bool hasNewMessageNotification() {
    return _fbNotificationsController
            .notifications()
            .where((notification) =>
                notification.notificationType == NotificationType.NewMessage &&
                (notification as NewMessageNotification).orderId ==
                    _taxiAuthController.taxiState!.currentOrder!)
            .length >
        0;
  }

  void clearOrderNotifications() {
    FBNotificationsController fbNotificationsController =
        Get.find<FBNotificationsController>();
    fbNotificationsController
        .notifications()
        .where((notification) =>
            notification.notificationType ==
                NotificationType.OrderStatusChange &&
            (notification as OrderStatusChangeNotification).orderId ==
                _taxiAuthController.taxiState!.currentOrder!)
        .forEach((notification) {
      fbNotificationsController.removeNotification(notification.id);
    });
  }

  Future<bool> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    mezDbgPrint("Cancel Taxi Called");
    try {
      HttpsCallableResult response = await cancelTaxiFunction
          .call(<String, dynamic>{
        'reason': reason,
        'database': _databaseHelper.dbType
      });
      dynamic _res = responseStatusChecker(response.data);
      if (_res == null) {
        mezDbgPrint(
            "Manually thrown Exception - Reason -> Response.data was null !");
        return Future.value(false);
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        return Future.value(true);
      }

    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      mezDbgPrint("Exception happend in cancelTaxi : $e");
      return Future.value(false);
    }
  }

  Future<ServerResponse> startRide() async {
    mezDbgPrint("Start Taxi Called");
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    try {
      HttpsCallableResult response = await startRideFunction
          .call();
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  Future<ServerResponse> finishRide() async {
    mezDbgPrint("Finish Taxi Called");
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    try {
      HttpsCallableResult response = await finishRideFunction
          .call();
      return ServerResponse.fromJson(response.data);
    } catch (e) {
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  @override
  void onClose() {
    mezDbgPrint(
        "CURRENT ORDER CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! ${this.hashCode}");
    _orderStatusListener?.cancel();
    _orderStatusListener = null;
    mezDbgPrint(
        "--------------------> CurrentOrderController::onClose called  !");

    super.onClose();
  }
}
