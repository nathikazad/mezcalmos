import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DeliveryAuthController extends GetxController {
  Rxn<DeliveryDriverState> _state = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  DeliveryDriverState? get deliveryDriverState => _state.value;
  Stream<DeliveryDriverState?> get stateStream => _state.stream;

  Rxn<LocationData> _currentLocation = Rxn<LocationData>(
      // LocationData.fromMap({"latitude": 15.8337, "longitude": -97.04205})
      );

  LocationData? get currentLocation => _currentLocation.value;
  Rxn<LocationData> get currentLocationRxn => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription<dynamic>? _deliveryDriverStateNodeListener;
  StreamSubscription<MainUserInfo>? _userInfoStreamListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("DeliveryAuthController: init $hashCode");
    mezDbgPrint(
        "DeliveryAuthController: calling handle state change first time");
    setupDeliveryDriver(_authController.fireAuthUser!);
    super.onInit();
  }

  Future<void> setupDeliveryDriver(User user) async {
    mezDbgPrint("DeliveryAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);

    mezDbgPrint(
        "DeliveryAuthController: _DeliveryDriverStateNodeListener init ${deliveryDriverStateNode(user.uid)}");
    await _deliveryDriverStateNodeListener?.cancel();
    _deliveryDriverStateNodeListener = null;
    _deliveryDriverStateNodeListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(deliveryDriverStateNode(user.uid))
        .onValue
        .listen((DatabaseEvent event) async {
      mezDbgPrint(
          "[++++++ = === ==] DeliveryAuthController$hashCode: _DeliveryDriverStateNodeListener event => ${event.snapshot.value}");
      if (event.snapshot.value.toString() == _previousStateValue) {
        mezDbgPrint(
            'DeliveryAuthController:: same state event fired again, skipping it');
        return;
      }
      _previousStateValue = event.snapshot.value.toString();
      if (event.snapshot.value != null) {
        // mezDbgPrint(event.snapshot.value);
        _state.value = DeliveryDriverState.fromSnapshot(event.snapshot.value);
      } else {
        _state.value =
            DeliveryDriverState(isAuthorized: false, isOnline: false);
      }
      mezDbgPrint(
          "/////////////////////////////////////////////${_state.value?.toJson()}////////////////////////////////////////////////////");
      if (_state.value?.isAuthorized ?? false) {
        saveAppVersionIfNecessary();
        await saveNotificationToken();
      }

      if (_state.value!.isOnline == false) {
        await Location().enableBackgroundMode(enable: false);
        _locationListener?.pause();
      } else {
        await Location().enableBackgroundMode(enable: true);
        _locationListener?.resume();
      }
    });
    await _locationListener?.cancel();
    _locationListener = await _listenForLocation();

    await _userInfoStreamListener?.cancel();
    _authController.userInfoStream.listen((MainUserInfo? userInfo) {
      if (userInfo != null) {
        _databaseHelper.firebaseDatabase
            .ref()
            .child(deliveryDriverInfoNode(user.uid))
            .set(userInfo.toFirebaseFormatJson());
      }
    });
  }

  Future<void> saveNotificationToken() async {
    mezDbgPrint(
        "DeliveryAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null)
      await _databaseHelper.firebaseDatabase
          .ref()
          .child(
              '${deliveryDriverAuthNode(_authController.fireAuthUser?.uid ?? '')}/notificationInfo/')
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      });
  }

  void saveAppVersionIfNecessary() {
    if (_checkedAppVersion == false) {
      final String VERSION = GetStorage().read(getxAppVersion);
      _databaseHelper.firebaseDatabase
          .ref()
          .child(
              deliveryDriverAppVersionNode(_authController.fireAuthUser!.uid))
          .set(VERSION);
      _checkedAppVersion = true;
    }
  }

  Future<StreamSubscription<LocationData>> _listenForLocation() async {
    mezDbgPrint("Listening for location !");
    final Location location = Location();
    await location.changeSettings(interval: 1000);
    // location.enableBackgroundMode(enable: true);
    return location.onLocationChanged.listen((LocationData currentLocation) {
      // mezDbgPrint("\t\t [DELIVERY AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
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
        try {
          mezDbgPrint(positionUpdate);
          _databaseHelper.firebaseDatabase
              .ref()
              .child(deliveryDriverAuthNode(_authController.fireAuthUser!.uid))
              .child('location')
              .set(positionUpdate);
          final OrderController _orderController = Get.find<OrderController>();

          _orderController.currentOrders.forEach((DeliverableOrder order) {
            // updating driver location in deliveryDrivers/inProcessOrders
            _databaseHelper.firebaseDatabase
                .ref()
                .child(deliveryDriverInProcessOrderDriverLocationNode(
                    orderId: order.orderId,
                    deliveryDriverId: _authController.fireAuthUser!.uid,
                    driverAddress: order.driverDatabaseAddress()))
                .set(positionUpdate);

            // updating driver location in root orders/inProcess/<OrderType>
            _databaseHelper.firebaseDatabase
                .ref()
                .child(rootInProcessOrderDriverLocationNode(
                    orderId: order.orderId,
                    orderType: order.orderType,
                    driverAddress: order.driverDatabaseAddress()))
                .set(positionUpdate);

            _databaseHelper.firebaseDatabase
                .ref()
                .child(customerInProcessOrderDriverLocationNode(
                    orderId: order.orderId,
                    customerId: order.customer.id,
                    driverAddress: order.driverDatabaseAddress()))
                .set(positionUpdate);
          });
        } catch (e) {
          mezDbgPrint("Write driver position to db error");
        }
      }
    });
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] DeliveryAuthController::dispose ---------> Was invoked ! $hashCode");

    _deliveryDriverStateNodeListener?.cancel();
    _deliveryDriverStateNodeListener = null;

    _locationListener?.cancel();
    _locationListener = null;
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(deliveryDriverIsOnlineField(_authController.fireAuthUser!.uid))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      MezSnackbar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(deliveryDriverIsOnlineField(_authController.fireAuthUser!.uid))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      MezSnackbar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
