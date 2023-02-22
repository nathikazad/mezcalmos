import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/delivery_driver/hsDeliveryDriver.dart';
import 'package:mezcalmos/Shared/graphql/hasuraTypes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Drivers/DeliveryDriver.dart';

class DeliveryAuthController extends GetxController {
  Rxn<DeliveryDriver> _driver = Rxn();
  AuthController _authController = Get.find<AuthController>();

  DeliveryDriverState? get driverState => _driver.value?.deliveryDriverState;
  DeliveryDriver? get driver => _driver.value;

  Rxn<LocationData> _currentLocation = Rxn<LocationData>();

  LocationData? get currentLocation => _currentLocation.value;
  Rxn<LocationData> get currentLocationRxn => _currentLocation;

  Timer? _locationListener;

  @override
  Future<void> onInit() async {
    // ------------------------------------------------------------------------
    mezDbgPrint("DeliveryAuthController: init $hashCode");
    mezDbgPrint(
        "DeliveryAuthController: calling handle state change first time");
    await setupDeliveryDriver();

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

  Timer _listenForLocation() {
    final Location location = Location();
    return Timer.periodic(Duration(seconds: 150), (Timer? timer) async {
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
}
