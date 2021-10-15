import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';

class CurrentOrderController extends GetxController with MezDisposable {
  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  FBNotificationsController _notifications =
      Get.find<FBTaxiNotificationsController>();

  StreamController<Order> _orderStreamController = StreamController.broadcast();
  Stream<Order> get orderStream => _orderStreamController.stream;
  StreamSubscription? _orderStatusListener;

  @override
  void onInit() {
    super.onInit();
    mezDbgPrint("Current Order Controller init ${this.hashCode}");
    mezDbgPrint(_taxiAuthController.taxiState?.currentOrder);
  }

  Future<void> listenForOrderStatus() async {
    if (_orderStatusListener != null) {
      await _orderStatusListener!.cancel();
    }
    (_orderStatusListener = _databaseHelper.firebaseDatabase
            .reference()
            .child(orderStatus(_taxiAuthController.taxiState!.currentOrder!))
            .onValue
            .listen((event) async {
      DataSnapshot dataSnapshot = await _databaseHelper.firebaseDatabase
          .reference()
          .child(orderId(_taxiAuthController.taxiState!.currentOrder!))
          .once();
      _orderStreamController.add(Order.fromSnapshot(dataSnapshot));
    }))
        .canceledBy(this);
  }

  Future<bool> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    mezDbgPrint("Cancel Taxi Called");
    try {
      // _waitingResponse.value = true;
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

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in cancelTaxi : $e");
      return Future.value(false);
    }
  }

  Future<bool> startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    mezDbgPrint("Start Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
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
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in startRide : $e");
      return Future.value(false);
    }
  }

  Future<bool> finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    mezDbgPrint("Finish Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null) {
        mezDbgPrint(
            "Manually thrown Exception - Reason -> Response.data was null !");
        return Future.value(false);
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        return Future.value(true);
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      // _waitingResponse.value = false;
      mezDbgPrint("Exception happend in finishRide : $e");
      return Future.value(false);
    }
  }

  void detachListeners() {
    _notifications.clearAllMessageNotification();
  }

  @override
  void onClose() {
    mezDbgPrint(
        "cuRRENT CONTROLLER :: ::: :: :: : :   : :::::: DISPOSE ! ${this.hashCode}");
    // try {
    //   Get.delete<CurrentOrderController>();
    // } catch (e) {
    //   mezDbgPrint(e);
    // }
    cancelSubscriptions();
    detachListeners();
    mezDbgPrint(
        "--------------------> CurrentOrderController::onClose called  !");

    super.onClose();
  }
}
