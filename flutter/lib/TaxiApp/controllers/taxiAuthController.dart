import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';
// import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:location/location.dart';

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

  bool _checkedAppVersion = false;

  @override
  void onInit() async {
    super.onInit();
    // ------------------------------------------------------------------------

    mezDbgPrint(
        "\t\t\tUser from TaxiAuthController >> ${_authController.user?.uid}");
    Get.find<AuthController>().authStateChange.listen((user) {
      _taxiStateNodeListener?.cancel();
      _taxiStateNodeListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiStateNode(_authController.fireAuthUser!.uid))
          .onValue
          .listen((event) async {
        if (event.snapshot.value != null) {
          mezDbgPrint(event.snapshot.value);
          _state.value = TaxiState.fromSnapshot(event.snapshot.value);
          if ((_state.value!.currentOrder == null &&
              _state.value!.isLooking == false)) {
            await Location().enableBackgroundMode(enable: false);
            _locationListener?.pause();
          }
        } else {
          _state.value = null;
          if (!(await Location().isBackgroundModeEnabled()))
            await Location().enableBackgroundMode(enable: true);
          _locationListener?.resume();
        }
      });
      saveNotificationToken();
      mezDbgPrint(
          "/////////////////////////////////////////////${_state.value?.toJson()}////////////////////////////////////////////////////");
      _listenForLocation();
    });
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

  Future<void> _listenForLocation() async {
    if (_authController.fireAuthUser == null) {
      mezDbgPrint("User is not signed in !");
    } else {
      mezDbgPrint("Listening for location !");
      Location location = Location();
      await location.changeSettings(interval: 1000);
      // location.enableBackgroundMode(enable: true);
      await _locationListener?.cancel();
      _locationListener =
          location.onLocationChanged.listen((LocationData currentLocation) {
        mezDbgPrint("\t\t [TAXI AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
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
          mezDbgPrint(positionUpdate);
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
  }

  @override
  void onClose() {
    mezDbgPrint("[+] TaxiAuthController::dispose ---------> Was invoked !");

    _taxiStateNodeListener?.cancel();
    _taxiStateNodeListener = null;

    _locationListener?.cancel();
    _locationListener = null;
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
