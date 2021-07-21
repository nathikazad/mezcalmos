import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/mapController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/helpers/MapHelper.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';

class CurrentOrderController extends GetxController {
  Rx<Order> _model = Order.empty().obs;
  RxBool _waitingResponse = RxBool(false);

  TaxiAuthController _taxiAuthController =
      Get.find<TaxiAuthController>(); // since it's already injected .
  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  Order? get value => _model.value;
  dynamic get id => _model.value.id;
  dynamic get waitingResponse => _waitingResponse.value;

  double get distanceToFinish => MapHelper.calculateDistance(
      _taxiAuthController.currentLocation, _model.value.to.position);

  double get distanceToClient => MapHelper.calculateDistance(
      _taxiAuthController.currentLocation, _model.value.from.position);

  StreamSubscription<Event>? _currentOrderListener;

  @override
  void onInit() {
    super.onInit();
    print("--------------------> CurrentOrderController Initialized !");
    dispatchCurrentOrder();
  }

  void dispatchCurrentOrder() {
    _currentOrderListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(orderId(_taxiAuthController.currentOrderId))
        .onValue
        .listen((event) async {
      // if (event.snapshot.value['status'] != _model.value.status) {
      //   // we will trigger updateGoogleMap
      // }

      print("[[[[[[[[[[ \n\n ${event.snapshot.value} \n\n ]]]]]]]]]]");
      if (event.snapshot.value != null) {
        bool dirty = event.snapshot.value['status'] == _model.value.status;

        print(
            "CurrentOrderController::onValue Invoked >> ${event.snapshot.key} : ${event.snapshot.value['status']}");
        if (event.snapshot.value['status'] == "cancelled") {
          await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
              55, Get.height, Get.width);
          Get.back(closeOverlays: true);
        }
        _model.value = Order.fromSnapshot(event.snapshot);

        CurrentOrderMapController mezCurrentMap =
            Get.find<CurrentOrderMapController>();
        if (!mezCurrentMap.isClosed && !dirty) {
          mezCurrentMap.googleMapUpdate();
        }
      }
    });
  }

  Future<void> cancelTaxi(String? reason) async {
    HttpsCallable cancelTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('cancelTaxiFromDriver');
    print("Cancel Taxi Called");
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await cancelTaxiFunction
          .call(<String, dynamic>{
        'reason': reason,
        'database': _databaseHelper.dbType
      });
      dynamic _res = responseStatusChecker(response.data);

      _res == null
          ? throw Exception(
              "Manually thrown Exception - Reason -> Response.data was null !")
          : mezcalmosSnackBar("Notice ~", _res);
      _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Cancel the Taxi Request :( ");
      _waitingResponse.value = false;
      print("Exception happend in cancelTaxi : $e");
    }
  }

  Future<void> startRide() async {
    HttpsCallable startRideFunction =
        FirebaseFunctions.instance.httpsCallable('startTaxiRide');
    print("Start Taxi Called");
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await startRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      _res == null
          ? throw Exception(
              "Manually thrown Exception - Reason -> Response.data was null !")
          : mezcalmosSnackBar("Notice ~", _res);
      _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to Start The ride :( ");
      _waitingResponse.value = false;
      print("Exception happend in startRide : $e");
    }
  }

  Future<void> finishRide() async {
    HttpsCallable finishRideFunction =
        FirebaseFunctions.instance.httpsCallable('finishTaxiRide');
    print("Finish Taxi Called");
    try {
      _waitingResponse.value = true;
      HttpsCallableResult response = await finishRideFunction
          .call(<String, dynamic>{'database': _databaseHelper.dbType});
      dynamic _res = responseStatusChecker(response.data);

      _res == null
          ? throw Exception(
              "Manually thrown Exception - Reason -> Response.data was null !")
          : mezcalmosSnackBar("Notice ~", _res);
      _waitingResponse.value = false;
    } catch (e) {
      mezcalmosSnackBar("Notice ~", "Failed to finish The ride :( ");
      _waitingResponse.value = false;
      print("Exception happend in finishRide : $e");
    }
  }

  void detachListeners() {
    if (_currentOrderListener != null) {
      _currentOrderListener!
          .cancel()
          .then((value) => print(
              "A listener was disposed on currentOrderController::detachListeners !"))
          .catchError((err) => print(
              "Error happend while trying to dispose currentOrderController::detachListeners !"));
    }
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> CurrentOrderController Auto Disposed !");
  }
}
