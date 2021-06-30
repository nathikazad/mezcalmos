import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/helpers/databaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
// import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class TaxiAuthController extends GetxController {
  Rxn<TaxiDriver> _model = Rxn<TaxiDriver>();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  Rx<Widget> _dynamicScreen =
      (Center(child: CircularProgressIndicator()) as Widget).obs;

  String? get currentOrderId => _model.value?.currentOrder ?? null;
  dynamic get authorizedTaxi => _model.value?.isAuthorized ?? false;
  bool? get isLooking => _model.value?.isLooking ?? false;
  Widget get dynamicScreen => _dynamicScreen.value;

  late StreamSubscription<Event> _taxiAuthListener;

  /*
    GetScreen function basically will return on of the 3 right Screens :
      - AnauthorizedScreen
      - IncommingOrders
      - CurrentOrder
  */

  Widget _getScreen() => authorizedTaxi == true
      ? (currentOrderId != null ? CurrentOrderScreen() : IncomingOrdersScreen())
      : UnauthorizedScreen();

  @override
  void onInit() async {
    super.onInit();

    // Injecting all our TaxiOrderControllers here
    Get.lazyPut(() => CurrentOrderController());
    Get.lazyPut(() => IncomingOrdersController());
    // ------------------------------------------------------------------------

    print("User from TaxiAuthController >> ${_authController.user?.uid}");
    print("authorizedTaxi from TaxiAuthController >> ${authorizedTaxi}");
    print("currentOrderId from TaxiAuthController >> ${currentOrderId}");

    if (_authController.user != null) {
      _taxiAuthListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.user?.uid ?? ''))
          .onValue
          .listen((event) {
        _model.value = TaxiDriver.fromSnapshot(event.snapshot);
        // our magical Trick :p
        _dynamicScreen.value = _getScreen();
      });
    }
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiAuthNode(_authController.user?.uid ?? ''))
        .set(true);
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiAuthNode(_authController.user?.uid ?? ''))
        .set(false);
  }

  void toggleOnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiAuthNode(_authController.user?.uid ?? ''))
        .set(_model.value!.isLooking == true ? false : true);
  }

  void detachListeners() {
    _taxiAuthListener
        .cancel()
        .then((value) => print(
            "A listener was disposed on TaxiAuthController::detachListeners !"))
        .catchError((err) => print(
            "Error happend while trying to dispose TaxiAuthController::detachListeners !"));
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> OrderController Auto Disposed !");
  }
}
