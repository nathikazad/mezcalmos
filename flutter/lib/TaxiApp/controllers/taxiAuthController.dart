import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/firebaseNodes/ordersNode.dart';
import 'package:mezcalmos/Shared/firebaseNodes/taxiNodes.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/models/Drivers/TaxiDriver.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class TaxiAuthController extends GetxController {
  Rxn<TaxiState> _state = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();
  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  TaxiState? get taxiState => _state.value;
  Stream<TaxiState?> get stateStream => _state.stream;

  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;

  LocationData get currentLocation => _currentLocation.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription<dynamic>? _taxiStateNodeListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";
  final AppLaunchMode lmode = getAppLaunchMode();

  @override
  void onInit() {
    // ------------------------------------------------------------------------
    mezDbgPrint("TaxiAuthController: init $hashCode");
    mezDbgPrint("TaxiAuthController: calling handle state change first time");
    setupTaxi(Get.find<AuthController>().fireAuthUser!);
    super.onInit();
  }

  Future<void> setupTaxi(User user) async {
    mezDbgPrint("TaxiAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);

    mezDbgPrint(
        "TaxiAuthController: _taxiStateNodeListener init ${taxiStateNode(user.uid)}");
    await _taxiStateNodeListener?.cancel();
    _taxiStateNodeListener = null;
    _taxiStateNodeListener = _databaseHelper.firebaseDatabase
        .ref()
        .child(taxiStateNode(user.uid))
        .onValue
        .listen((dynamic event) async {
      if (event.snapshot.value.toString() == _previousStateValue) {
        return;
      }
      _previousStateValue = event.snapshot.value.toString();
      if (event.snapshot.value != null) {
        mezDbgPrint(event.snapshot.value);
        _state.value = TaxiState.fromSnapshot(event.snapshot.value);
        if ((_state.value!.currentOrder == null &&
            _state.value!.isLooking == false)) {
          await Location().enableBackgroundMode(enable: false);
          _locationListener?.pause();
        }
      } else {
        _state.value = TaxiState(false, false);
        if (!(await Location().isBackgroundModeEnabled()))
          await Location().enableBackgroundMode(enable: true);
        _locationListener?.resume();
      }
      if (_state.value?.isAuthorized ?? false) {
        saveAppVersionIfNecessary();
        saveNotificationToken();
      }
    });
    await _locationListener?.cancel();
    _locationListener = await _listenForLocation();
  }

  void saveNotificationToken() async {
    mezDbgPrint(
        "TaxiAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    if (deviceNotificationToken != null)
      // ignore: unawaited_futures
      _databaseHelper.firebaseDatabase
          .ref()
          .child(
              '${taxiAuthNode(_authController.fireAuthUser?.uid ?? '')}/notificationInfo/')
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      });
  }

  void saveAppVersionIfNecessary() {
    if (_checkedAppVersion == false) {
      final String _version = GetStorage().read(getxAppVersion);
      mezDbgPrint("[+] TaxiDriver Currently using App v$_version");
      _databaseHelper.firebaseDatabase
          .ref()
          .child(taxiDriverAppVersionNode(_authController.fireAuthUser!.uid))
          .set(_version);
      _checkedAppVersion = true;
    }
  }

  Future<StreamSubscription<LocationData>> _listenForLocation() async {
    mezDbgPrint("Listening for location !");
    Location location = Location();
    await location.changeSettings(interval: 1000);
    // location.enableBackgroundMode(enable: true);
    return location.onLocationChanged.listen((LocationData currentLocation) {
      // mezDbgPrint("\t\t [TAXI AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
      DateTime currentTime = DateTime.now();
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        _currentLocation.value = currentLocation;

        Map<String, dynamic> positionUpdate = <String, dynamic>{
          "lastUpdateTime": currentTime.toUtc().toString(),
          "position": <String, dynamic>{
            "lat": currentLocation.latitude,
            "lng": currentLocation.longitude
          }
        };
        try {
          // mezDbgPrint(positionUpdate);
          _databaseHelper.firebaseDatabase
              .ref()
              .child(taxiAuthNode(_authController.fireAuthUser!.uid))
              .child('location')
              .set(positionUpdate);
          if (_state.value?.currentOrder != null) {
            // updating driver location in taxis/inProcessOrders
            _databaseHelper.firebaseDatabase
                .ref()
                .child(taxiInProcessOrderDriverLocationNode(
                    orderId: _state.value!.currentOrder!,
                    taxiId: _authController.fireAuthUser!.uid))
                .set(positionUpdate);

            // updating driver location in root orders/inProcess/taxi
            _databaseHelper.firebaseDatabase
                .ref()
                .child(rootTaxiInProcessOrderDriverLocationNode(
                    _state.value!.currentOrder!))
                .set(positionUpdate);

            // updating driver location in customers/inProcessOrders
            String? currentOrderCustomerId = Get.find<OrderController>()
                .getOrder(_state.value!.currentOrder!)
                ?.customer
                .id;
            if (currentOrderCustomerId != null)
              _databaseHelper.firebaseDatabase
                  .ref()
                  .child(customerInProcessOrderDriverLocationNode(
                      orderId: _state.value!.currentOrder!,
                      customerId: currentOrderCustomerId))
                  .set(positionUpdate);
          }
          positionUpdate["online"] = _state.value?.isLooking;
          positionUpdate["inOrder"] = _state.value?.currentOrder != null;
          if (lmode != "prod") {
            positionUpdate["name"] = _authController.user!.name;
          }

          _databaseHelper.firebaseDatabase
              .ref()
              .child(onlineTaxiDrivers(
                  driverId: _authController.fireAuthUser!.uid))
              .set(positionUpdate);
        } catch (e) {
          mezDbgPrint("Write driver position to db error");
        }
      }
    });
  }

  @override
  void onClose() {
    mezDbgPrint(
        "[+] TaxiAuthController::dispose ---------> Was invoked ! ${this.hashCode}");

    _taxiStateNodeListener?.cancel();
    _taxiStateNodeListener = null;

    _locationListener?.cancel();
    _locationListener = null;
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(taxiIsLookingField(_authController.fireAuthUser!.uid))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      MezSnackbar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .ref()
        .child(taxiIsLookingField(_authController.fireAuthUser!.uid))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      MezSnackbar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
