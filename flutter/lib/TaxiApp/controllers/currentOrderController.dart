import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
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
      Get.put<FBTaxiNotificationsController>(FBTaxiNotificationsController());

  String? lastOrderStatus;
  CurrentOrderEvent? currentEvent;
  Rxn<CurrentOrder> _currentOrderStream = Rxn();
  CurrentOrder? get currentOrderStream => _currentOrderStream.value;
  Rxn<CurrentOrder> get currentOrderStreamRx => _currentOrderStream;
  @override
  void onInit() {
    super.onInit();
    _databaseHelper.firebaseDatabase
        .reference()
        .child(orderId(_taxiAuthController.currentOrderId))
        .onValue
        .listen((event) {
      final _lastDriverLocation =
          _currentOrderStream.value?.order.driver['location']['position'];
      _currentOrderStream.value = new CurrentOrder.fromSnapshot(event.snapshot);
      _currentOrderStream.value?.event = currentEvent;
      if (_currentOrderStream.value?.order.status != null &&
          _currentOrderStream.value?.order.status != lastOrderStatus) {
        _currentOrderStream.value?.event = new CurrentOrderEvent(
            CurrentOrderEventTypes.OrderStatusChange,
            eventDetails: <String, String?>{
              "oldStatus": lastOrderStatus,
              "newStatus": _currentOrderStream.value?.order.status
            });
        lastOrderStatus = _currentOrderStream.value?.order.status;
        currentEvent = _currentOrderStream.value?.event;

        mezDbgPrint(
            "\nFront Listener of CurrentORderController :: \n${_currentOrderStream.value?.toJson()}\n");
      }
    }).canceledBy(this);
  }

  void clearEvent() {
    this.currentEvent = null;
  }
  // void dispatchCurrentOrder() {

  //       .listen((event) async {
  //     print(
  //         "CurrentOrderController :: DispatchCurrentOrder :: _taxiAuthController.currentOrderId ${_taxiAuthController.currentOrderId}");
  //     if (event.snapshot.value != null) {
  //       bool dirty = event.snapshot.value['status'] == _model.value.status;

  //       print(
  //           "CurrentOrderController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value['status']}");
  //        {
  //         await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
  //             55, Get.height, Get.width);
  //       } else {
  //         _model.value =
  //         _model.value.id =
  //       }
  //       return "dsf";
  //     }
  //   });
  //   _currentOrderListener.onData((data) { })
  // }

  Future<void> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    print("Cancel Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await cancelTaxiFunction
          .call(<String, dynamic>{
        'reason': reason,
        'database': _databaseHelper.dbType
      });
      dynamic _res = responseStatusChecker(response.data);
      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      // _waitingResponse.value = false;
      print("Exception happend in cancelTaxi : $e");
    }
  }

  Future<void> startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    print("Start Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null)
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      // : mezcalmosSnackBar("Notice ~", _res);
      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      // _waitingResponse.value = false;
      print("Exception happend in startRide : $e");
    }
  }

  Future<void> finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    print("Finish Taxi Called");
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      if (_res == null) {
        throw Exception(
            "Manually thrown Exception - Reason -> Response.data was null !");
      } else {
        mezcalmosSnackBar("Notice ~", _res);
        // Get.delete<CurrentOrderMapController>();
      }

      // _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      // _waitingResponse.value = false;
      print("Exception happend in finishRide : $e");
    }
  }

  void detachListeners() {
    _notifications.clearAllMessageNotification();
  }

  @override
  void onClose() async {
    cancelSubscriptions();
    detachListeners();
    print("--------------------> CurrentOrderController::onClose called  !");

    super.onClose();
  }
}
