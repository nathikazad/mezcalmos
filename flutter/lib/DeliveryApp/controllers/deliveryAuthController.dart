import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/deliveryNodes.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class DeliveryAuthController extends GetxController {
  Rxn<DeliveryDriver> _driver = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  DeliveryDriverState? get driverState => _driver.value?.deliveryDriverState;
  DeliveryDriver? get driver => _driver.value;

  Rxn<LocationData> _currentLocation = Rxn<LocationData>();

  LocationData? get currentLocation => _currentLocation.value;
  Rxn<LocationData> get currentLocationRxn => _currentLocation;

  Timer? _locationListener;
  late AppLaunchMode _launchMode;

  @override
  Future<void> onInit() async {
    // ------------------------------------------------------------------------
    mezDbgPrint("DeliveryAuthController: init $hashCode");
    mezDbgPrint(
        "DeliveryAuthController: calling handle state change first time");
    await setupDeliveryDriver();

    const String _tmpLmode =
        String.fromEnvironment('LMODE', defaultValue: "prod");
    _launchMode = _tmpLmode.toLaunchMode();

    if (driver != null && driver?.driverInfo.hasuraId != null) {
      unawaited(saveNotificationToken());
    }
    if (driver?.deliveryDriverId != null) {
      _locationListener?.cancel();
      _locationListener = _listenForLocation();
    }
    super.onInit();
  }

  Future<void> setupDeliveryDriver() async {
    mezDbgPrint("DeliveryAuthController: handle state change user value");
    _driver.value = await get_driver_by_user_id(
        userId: _authController.hasuraUserId!, withCache: false);
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    final NotificationInfo? notifInfo = await get_notif_info(
        userId: driver!.driverInfo.hasuraId, appType: "delivery");

    try {
      if (notifInfo != null &&
          deviceNotificationToken != null &&
          notifInfo.token != deviceNotificationToken) {
        mezDbgPrint("🫡🫡 Updating notification info 🫡🫡");
        // ignore: unawaited_futures
        update_notif_info(
            notificationInfo: NotificationInfo(
                userId: driver!.driverInfo.hasuraId,
                appType: "delivery",
                id: notifInfo.id,
                token: deviceNotificationToken));
      } else if (deviceNotificationToken != null && notifInfo == null) {
        mezDbgPrint("🫡🫡 saving notification info First Time🫡🫡");
        // ignore: unawaited_futures
        insert_notif_info(
            userId: driver!.driverInfo.hasuraId,
            token: deviceNotificationToken,
            appType: "delivery");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  Timer _listenForLocation() {
    final Location location = Location();
    return Timer.periodic(
        Duration(seconds: _launchMode == AppLaunchMode.prod ? 120 : 120),
        (Timer? timer) async {
      final LocationData currentLocation = await location.getLocation();
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
          mezDbgPrint("Updating location 😍 ${timer?.tick}");
          final Geography? data = await update_driver_location_by_id(
              driverId: driver!.deliveryDriverId,
              lat: currentLocation.latitude!,
              long: currentLocation.longitude!);
          if (data != null) {
            _currentLocation.value = data.toLocationData();
            mezDbgPrint(_currentLocation.value);
          }
        } catch (e, stk) {
          mezDbgPrint(e);
          mezDbgPrint(stk);
        }
      }
    });
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] DeliveryAuthController::dispose ---------> Was invoked ! $hashCode");

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

  Future setDeliveryCosts({num? minCost, num? costPerKm}) async {
    //
  }
}
