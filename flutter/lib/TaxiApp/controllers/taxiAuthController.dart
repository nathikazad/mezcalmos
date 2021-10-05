import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
// import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
// import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:location/location.dart';

class TaxiAuthController extends GetxController with MezDisposable {
  Rx<TaxiDriver> _model = TaxiDriver.empty().obs;
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  // Rx<Widget> _dynamicScreen =
  //     (Center(child: CircularProgressIndicator()) as Widget).obs;
  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;
  RxBool _locationEnabled = false.obs;
  DeviceNotificationsController _messagingController =
      Get.put<DeviceNotificationsController>(DeviceNotificationsController());

  dynamic get currentOrderId => _model.value.currentOrder ?? null;
  dynamic get authorizedTaxi => _model.value.isAuthorized;
  bool get isLooking => _model.value.isLooking ?? false;
  // Widget get dynamicScreen => _dynamicScreen.value;
  LocationData get currentLocation => _currentLocation.value;
  bool get locationEnabled => _locationEnabled.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription<LocationData>? get currentLocationStream =>
      _locationListener;

  bool _checkedAppVersion = false;
  DateTime lastLocationUpdatedTime = DateTime.now();
  /*
    GetScreen function basically will return on of the 3 right Screens :
      - AnauthorizedScreen
      - IncommingOrders
      - CurrentOrder
  */

  @override
  void onInit() async {
    super.onInit();
    // Injecting all our c here
    // Get.lazyPut(() => CurrentOrderController());
    Get.lazyPut(() => IncomingOrdersController());
    // ------------------------------------------------------------------------

    print("User from TaxiAuthController >> ${_authController.user?.uid}");
    print("authorizedTaxi from TaxiAuthController >> ${authorizedTaxi}");
    print("currentOrderId from TaxiAuthController >> ${currentOrderId}");
    print(
        "TaxiAuthController  Messaging Token>> ${await _messagingController.getToken()}");

    if (_authController.user != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.user!.uid))
          .onValue
          .listen((event) async {
        _model.value = event.snapshot.value != null
            ? TaxiDriver.fromSnapshot(event.snapshot)
            : TaxiDriver(false, false, null, null, null, isEmpty: false);

        if (_checkedAppVersion == false) {
          if (_model.value.isAuthorized == true) {
            String VERSION = GetStorage().read(version);
            print("[+] TaxiDriver Currently using App v$VERSION");
            _databaseHelper.firebaseDatabase
                .reference()
                .child(taxiDriverAppVersionNode(_authController.user!.uid))
                .set(VERSION);

            _checkedAppVersion = true;
          }
        }
        // our magical Trick :p
        // _dynamicScreen.value = _getScreen();

        if (_model.value.isEmpty == true ||
            (_model.value.currentOrder == null &&
                _model.value.isLooking == false)) {
          await Location().enableBackgroundMode(enable: false);
          _locationListener?.pause();
          // print(
          //     " [=] ---------------------------------> Paused locationListener !");
        } else {
          if (!(await Location().isBackgroundModeEnabled()))
            await Location().enableBackgroundMode(enable: true);

          _locationListener?.resume();
          // print(
          //     " [=] ---------------------------------> Resumed locationListener !");
        }
      }).canceledBy(this);

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
      print("User is not signed in !");
    } else {
      Location location = Location();

      _locationEnabled.value = true;
      // location.enableBackgroundMode(enable: true);
      (_locationListener =
              location.onLocationChanged.listen((LocationData currentLocation) {
        DateTime currentTime = DateTime.now();
        if (currentTime.difference(lastLocationUpdatedTime).inSeconds > 5 &&
            currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          lastLocationUpdatedTime = currentTime;
          _currentLocation.value = currentLocation;

          Map<String, dynamic> positionUpdate = <String, dynamic>{
            "lastUpdateTime": currentTime.toUtc().toString(),
            "position": <String, dynamic>{
              "lat": currentLocation.latitude,
              "lng": currentLocation.longitude
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
        }
      }))
          .canceledBy(this);
    }
  }

  @override
  void dispose() async {
    print("[+] TaxiAuthController::dispose ---------> Was invoked !");
    // await _locationListener?.cancel();
    cancelSubscriptions();
    // Get.find<CurrentOrderController>().dispose();
    // Get.find<IncomingOrdersController>().dispose();
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.user!.uid))
        .set(false)
        .catchError((err) {
      print("Error turning [ isLooking = false ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.user!.uid))
        .set(true)
        .catchError((err) {
      print("Error turning [ isLooking = true ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
