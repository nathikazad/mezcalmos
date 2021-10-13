import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
// import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
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
  Rxn<TaxiDriver> _model = Rxn();
  Rxn<TaxiState> _state = Rxn();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();
  DeviceNotificationsController _messagingController =
      Get.find<DeviceNotificationsController>();

  TaxiState? get taxiState => _state.value;

  Rx<LocationData> _currentLocation = LocationData.fromMap(
      <String, dynamic>{"latitude": 15.851385, "longitude": -97.046429}).obs;

  LocationData get currentLocation => _currentLocation.value;
  Rx<LocationData> get currentLocationRx => _currentLocation;

  StreamSubscription<LocationData>? _locationListener;

  DateTime lastLocationUpdatedTime = DateTime.now();

  bool _checkedAppVersion = false;

  @override
  void onInit() async {
    super.onInit();
    // ------------------------------------------------------------------------

    mezDbgPrint(
        "User from TaxiAuthController >> ${_authController.fireAuthUser?.uid}");

    if (_authController.fireAuthUser != null) {
      _databaseHelper.firebaseDatabase
          .reference()
          .child(taxiAuthNode(_authController.fireAuthUser!.uid))
          .onValue
          .listen((event) async {
        if (event.snapshot.value != null) {
          _model.value = TaxiDriver.fromSnapshot(event.snapshot);
        } else {
          _model.value = null;
          return;
        }
        saveAppVersionIfNecessary();
      }).canceledBy(this);

      _databaseHelper.firebaseDatabase
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
      }).canceledBy(this);

      saveNotificationToken();
      mezDbgPrint(
          "/////////////////////////////////////////////${_model.value?.toJson()}////////////////////////////////////////////////////");
      _listenForLocation();
    }
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
      Location location = Location();
      // location.enableBackgroundMode(enable: true);
      (_locationListener =
              location.onLocationChanged.listen((LocationData currentLocation) {
        DateTime currentTime = DateTime.now();
        if (currentTime.difference(lastLocationUpdatedTime).inSeconds > 5 &&
            currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          mezDbgPrint("\t\t [TAXI AUTH CONTROLLER] LOCATION GOT UPDAAAATED !!");
          lastLocationUpdatedTime = currentTime;
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
          if (_model.value?.taxiState.currentOrder != null) {
            _databaseHelper.firebaseDatabase
                .reference()
                .child(orderId(_model.value!.taxiState.currentOrder!))
                .child('driver/location')
                .set(positionUpdate);
          }
        }
      }))
          .canceledBy(this);
    }
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] TaxiAuthController::dispose ---------> Was invoked !");
    cancelSubscriptions();
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
