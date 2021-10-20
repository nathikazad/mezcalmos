import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/deviceNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaxiAuthController extends GetxController {
  Rxn<TaxiState> _state = Rxn();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  DeviceNotificationsController _messagingController =
      Get.find<DeviceNotificationsController>();

  TaxiState? get taxiState => _state.value;
  Stream<TaxiState?> get stateStream => _state.stream;

  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;

  LocationData get currentLocation => _currentLocation.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;
  StreamSubscription? _taxiStateNodeListener;
  StreamSubscription? _authStateChangeListener;

  bool _checkedAppVersion = false;
  String? _previousStateValue = "init";

  @override
  void onInit() async {
    super.onInit();
    // ------------------------------------------------------------------------

    mezDbgPrint("TaxiAuthController: init ${this.hashCode}");
    mezDbgPrint("TaxiAuthController: calling handle state change first time");
    handleStateChange(Get.find<AuthController>().fireAuthUser);
    _authStateChangeListener =
        Get.find<AuthController>().authStateChange.listen((user) {
      mezDbgPrint(
          "TaxiAuthController: calling handle state change from listener");
      handleStateChange(user);
    });
  }

  void handleStateChange(User? user) async {
    mezDbgPrint("TaxiAuthController: handle state change user value");
    mezDbgPrint(user);
    // mezDbgPrint(_authController.fireAuthUser);
    await _taxiStateNodeListener?.cancel();
    _taxiStateNodeListener = null;
    await _locationListener?.cancel();
    _locationListener = null;
    if (user == null) return;
    mezDbgPrint(
        "TaxiAuthController: _taxiStateNodeListener init ${taxiStateNode(user.uid)}");
    _taxiStateNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiStateNode(user.uid))
        .onValue
        .listen((event) async {
      mezDbgPrint(
          "TaxiAuthController${this.hashCode}: _taxiStateNodeListener event");
      if (event.snapshot.value.toString() == _previousStateValue) {
        mezDbgPrint(
            'TaxiAuthController:: same state event fired again, skipping it');
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
    });
    saveNotificationToken();
    mezDbgPrint(
        "/////////////////////////////////////////////${_state.value?.toJson()}////////////////////////////////////////////////////");
    _locationListener = await _listenForLocation();
  }

  void saveNotificationToken() async {
    mezDbgPrint(
        "TaxiAuthController  Messaging Token>> ${await _messagingController.getToken()}");
    String? deviceNotificationToken = await _messagingController.getToken();
    if (deviceNotificationToken != null)
      _databaseHelper.firebaseDatabase
          .reference()
          .child(
              '${taxiAuthNode(_authController.fireAuthUser?.uid ?? '')}/notificationInfo/')
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      });
  }

  void saveAppVersionIfNecessary() {
    if (_checkedAppVersion == false) {
      String VERSION = GetStorage().read(version);
      mezDbgPrint("[+] TaxiDriver Currently using App v$VERSION");
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiDriverAppVersionNode(_authController.fireAuthUser!.uid))
          .set(VERSION);
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
        // mezDbgPrint(positionUpdate);
        _databaseHelper.firebaseDatabase
            .reference()
            .child(taxiAuthNode(_authController.fireAuthUser?.uid ?? ''))
            .child('location')
            .set(positionUpdate);
        if (_state.value?.currentOrder != null) {
          _databaseHelper.firebaseDatabase
              .reference()
              .child(orderId(_state.value!.currentOrder!))
              .child('driver/location')
              .set(positionUpdate);
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

    _authStateChangeListener?.cancel();
    _authStateChangeListener = null;
    super.onClose();
  }

  void turnOff() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.fireAuthUser!.uid))
        .set(false)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = false ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning it off!");
    });
  }

  void turnOn() {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(taxiIsLookingField(_authController.fireAuthUser!.uid))
        .set(true)
        .catchError((err) {
      mezDbgPrint("Error turning [ isLooking = true ] -> $err");
      mezcalmosSnackBar("Error ~", "Failed turning_listenForLocation it on!");
    });
  }
}
