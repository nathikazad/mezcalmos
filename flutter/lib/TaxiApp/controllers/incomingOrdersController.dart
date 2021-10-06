import 'dart:async';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

class IncomingOrdersController extends GetxController with MezDisposable {
  RxList<Order> orders = <Order>[]
      .obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController =
      Get.find<AuthController>(); // since it's already injected .
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  DatabaseHelper _databaseHelper =
      Get.find<DatabaseHelper>(); // Already Injected in main function

  AppLifeCycleController _appLifeCycleController =
      Get.find<AppLifeCycleController>();

  // RxBool _waitingResponse = RxBool(false);
  RxString _selectedIncommingOrderKey = "".obs;

  // Storing all the needed Listeners here
  late Worker _updateOrderDistanceToClient;

  // dynamic get waitingResponse => _waitingResponse.value;

  Order? get selectedIncommingOrder => (_selectedIncommingOrderKey.value != "")
      ? orders.firstWhere(
          (element) => element.id == _selectedIncommingOrderKey.value,
          orElse: () => Order.empty())
      : null;
  Function fillMarkersCallback = () => null; // returns null by default

  set selectedIncommingOrderKey(String selectedOrderKey) {
    _selectedIncommingOrderKey.value = selectedOrderKey;
  }

  @override
  void onInit() async {
    // _selectedIncommingOrder.value = null;
    super.onInit();

    if (_authController.user != null) {
      // Added Order!
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiOpenOrdersNode)
          .onValue
          .listen((event) async {
        orders.value = <Order>[];
        if (event.snapshot.value != null) {
          event.snapshot.value.forEach((dynamic key, dynamic value) async {
            Order order = Order.fromJson(key, value);
            order.distanceToClient = MapHelper.calculateDistance(
                order.from.position, _taxiAuthController.currentLocation);
            orders.add(order);
            if (_appLifeCycleController.appState == AppLifecycleState.resumed)
              _databaseHelper.firebaseDatabase
                  .reference()
                  .child(notificationStatusReadNode(
                      key, _authController.user!.uid))
                  .set(true);
          });

          orders
              .sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
        }
        // if (orders
        //         .where(
        //             (element) => element.id == _selectedIncommingOrderKey.value)
        //         .length ==
        //     0) {
        //   if (Get.currentRoute == kSelectedIcommingOrder) {
        //     await MezcalmosSharedWidgets.mezcalmosDialogOrderNoMoreAvailable(
        //         55, Get.height, Get.width);
        //     Get.back(closeOverlays: true);
        //   }
        // }
      }).canceledBy(this);

      _updateOrderDistanceToClient =
          ever(_taxiAuthController.currentLocationRx, (userLocation) {
        orders.forEach((order) {
          order.distanceToClient = MapHelper.calculateDistance(
              order.from.position, userLocation as LocationData);
        });
        orders.sort((a, b) => a.distanceToClient.compareTo(b.distanceToClient));
      });
    }

    _appLifeCycleController.attachCallback(AppLifecycleState.resumed, () {
      print("[+] Callback executed :: app resumed !");
      orders.forEach((element) {
        _databaseHelper.firebaseDatabase
            .reference()
            .child(notificationStatusReadNode(
                element.id, _authController.user!.uid))
            .set(true);
      });
    });
  }

  // I added this to avoid possible dangling pointers ...
  void detachListeners() {
    cancelSubscriptions();
    _updateOrderDistanceToClient.dispose();
    _appLifeCycleController.cleanAllCallbacks();
  }

  Future<void> acceptTaxi(String orderId) async {
    HttpsCallable acceptTaxiFunction =
        FirebaseFunctions.instance.httpsCallable('acceptTaxiOrder');
    try {
      // _waitingResponse.value = true;
      HttpsCallableResult response = await acceptTaxiFunction
          .call(<String, dynamic>{
        'orderId': orderId,
        'database': _databaseHelper.dbType
      });
      // _selectedIncommingOrderKey.value = "";
      // Get.back(closeOverlays: true);
      mezcalmosSnackBar("Notice ~", "A new Order has been accpeted !");
      print("Accept Taxi Response");
      print(response.data);
    } catch (e) {
      // _waitingResponse.value = false;
      mezcalmosSnackBar("Notice ~", "Failed to accept the taxi order :( ");
      print("Exception happend in acceptTaxi : $e");
    }
  }

  @override
  void dispose() {
    detachListeners();
    super.dispose();
    print("--------------------> Incoming Order Controller disposed");
  }
}
