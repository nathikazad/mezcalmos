import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:geolocator/geolocator.dart';

class TaxiAuthController extends GetxController {
  Rx<TaxiDriver> _model = TaxiDriver.empty().obs;
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  Rx<Widget> _dynamicScreen =
      (Center(child: CircularProgressIndicator()) as Widget).obs;
  Rx<Position> _currentLocation = Position.fromMap(
      <dynamic, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;
  RxBool _locationEnabled = false.obs;
  NotificationsController _messagingController =
      Get.find<NotificationsController>();
  dynamic get currentOrderId => _model.value.currentOrder ?? null;
  dynamic get authorizedTaxi => _model.value.isAuthorized ?? false;
  bool get isLooking => _model.value.isLooking ?? false;
  Widget get dynamicScreen => _dynamicScreen.value;
  Position get currentLocation => _currentLocation.value;
  bool get locationEnabled => _locationEnabled.value;
  Rx<Position> get currentLocationRx => _currentLocation;

  late StreamSubscription<Event> _taxiAuthListener;
  late StreamSubscription<Position> _locationListener;

  /*
    GetScreen function basically will return on of the 3 right Screens :
      - AnauthorizedScreen
      - IncommingOrders
      - CurrentOrder
  */

  Widget _getScreen() => authorizedTaxi == true
      ? (_model.value.currentOrder != null
          ? CurrentOrderScreen()
          : IncomingOrdersScreen())
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
    print(
        "TaxiAuthController  Messaging Token>> ${await _messagingController.getToken()}");

    if (_authController.user != null) {
      _taxiAuthListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.user?.uid ?? ''))
          .onValue
          .listen((event) {
        _model.value = event.snapshot.value != null
            ? TaxiDriver.fromSnapshot(event.snapshot)
            : TaxiDriver(false, false, null, null, null);
        // our magical Trick :p
        _dynamicScreen.value = _getScreen();
      });
      String? deviceNotificationToken = await _messagingController.getToken();
      if (deviceNotificationToken != null)
        _databaseHelper.firebaseDatabase
            .reference()
            .child(
                '${taxiAuthNode(_authController.user?.uid ?? '')}/notificationInfo/')
            .set(<String, String>{
          'deviceNotificationToken': deviceNotificationToken
        });
      print(
          "/////////////////////////////////////////////${_model.value.toJson()}////////////////////////////////////////////////////");
      _listenForLocation();
    }
  }

  Future<void> _listenForLocation() async {
    if (_authController.user == null) {
      print("User is not signed IN !");
    } else {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      _locationEnabled.value = true;
      _locationListener =
          Geolocator.getPositionStream().listen((Position position) {
        _currentLocation.value = position;
        Map<String, dynamic> positionUpdate = <String, dynamic>{
          "lastUpdateTime": DateTime.now().toUtc().toString(),
          "position": <String, dynamic>{
            "lat": position.latitude,
            "lng": position.longitude
          }
        };
        // print(positionUpdate);
        _databaseHelper.firebaseDatabase
            .reference()
            .child(taxiAuthNode(_authController.user?.uid ?? ''))
            .child('location')
            .set(positionUpdate);
        if (_model.value.currentOrder != null) {
          _databaseHelper.firebaseDatabase
              .reference()
              .child(orderId(_model.value.currentOrder))
              .child('driver/location')
              .set(positionUpdate);
        }
        //   print(position == null
        //       ? 'Unknown'
        //       : position.latitude.toString() +
        //           ', ' +
        //           position.longitude.toString());
      });
    }

   

    @override
    void onClose() async {
      print("[+] TaxiAuthController::onClose ---------> Was invoked !");
      await _locationListener.cancel();
      await _taxiAuthListener.cancel();
      super.onClose();
    }

    // @override
    // void dispose() {
    //   detachListeners();
    //   super.dispose();
    //   print("--------------------> OrderController Auto Disposed !");
    // }
  }
   void turnOff() {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiIsLookingField(_authController.user?.uid))
          .set(false)
          .catchError((err) {
        print("Error turning [ isLooking = false ] -> $err");
        mezcalmosSnackBar("Error ~", "Failed turning it off!");
      });
    }

    void turnOn() {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiIsLookingField(_authController.user?.uid))
          .set(true)
          .catchError((err) {
        print("Error turning [ isLooking = true ] -> $err");
        mezcalmosSnackBar("Error ~", "Failed turning_listenForLocation it on!");
      });
    }
}
