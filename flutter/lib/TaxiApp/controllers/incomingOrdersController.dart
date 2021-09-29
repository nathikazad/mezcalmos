import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/appLifeCycleController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';

class IncomingOrdersController extends GetxController {
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
  List<StreamSubscription<Event>> _listeners = <StreamSubscription<Event>>[];
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
    print("--------------------> IncomingOrderController Initialized !");

    if (_authController.user != null) {
      _listeners.addAll([
        // Added Order!
        _databaseHelper.firebaseDatabase
            .reference()
            .child(taxiOpenOrdersNode)
            .onValue
            .listen((event) async {
          orders.value = <Order>[];
          if (event.snapshot.value != null) {
            event.snapshot.value.forEach((dynamic key, dynamic value) async {
              print(
                  "\n\n\n\n\n New Customer Order Inserted : $key , \n$value\n\n\n\n\n");

              BitmapDescriptor picMarker = await BitmapDescriptorLoader(
                  (await cropRonded(
                      (await http.get(Uri.parse(value['customer']['image'])))
                          .bodyBytes) as Uint8List),
                  60,
                  60,
                  isBytes: true);

              await GetStorage().write('custBitmap', picMarker);

              print("\n\n\n [bytes] $picMarker\n\n\n");
              Order order = Order.fromJson(key, value, pictureBytes: picMarker);
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

            orders.sort(
                (a, b) => a.distanceToClient.compareTo(b.distanceToClient));
          }
          if (orders
                  .where((element) =>
                      element.id == _selectedIncommingOrderKey.value)
                  .length ==
              0) {
            if (Get.currentRoute == kSelectedIcommingOrder) {
              await MezcalmosSharedWidgets.mezcalmosDialogOrderNoMoreAvailable(
                  55, Get.height, Get.width);
              Get.back(closeOverlays: true);
            }
          }
        })
      ]);

      print("Attached Listeners on taxiOpenOrdersNode : ${_listeners.length}");

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
    _listeners.forEach((sub) => sub
        .cancel()
        .then((value) =>
            print("A listener was disposed on incomingOrdersController !"))
        .catchError((err) => print(
            "Error happend while trying to dispose incomingOrdersController!")));

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
      // _waitingResponse.value = false;
      _selectedIncommingOrderKey.value = "";
      Get.back(closeOverlays: true);
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
