import 'dart:async';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class LocationController extends GetxController {
  StreamController<bool> _hasLocationPermissionStreamController =
      StreamController<bool>.broadcast(sync: false);

  Stream<bool> get locationPermissionStream =>
      _hasLocationPermissionStreamController.stream;
  Timer? _locationListenerTimer;

  @override
  void onInit() async {
    super.onInit();
    startPeriodicLocationPermissionsListener();
  }

  /// this Calls [requestPermission] on [package:location/location.dart] , and emmit a new event to
  ///
  /// [this._hasLocationPermissionStreamController] if Permissions were given.
  ///
  /// the return of this is  Future of [PermissionStatus].
  Future<PermissionStatus> requestLocationPermissions() async {
    PermissionStatus status = await Location().requestPermission();
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.grantedLimited) {
      // send new event to LocationStreamController saying that the location permissions has been given Successfully!
      _hasLocationPermissionStreamController.add(true);
    } else {
      _hasLocationPermissionStreamController.add(false);
    }
    return status;
  }

  void startPeriodicLocationPermissionsListener() {
    _locationListenerTimer =
        Timer.periodic(Duration(milliseconds: 500), (Timer t) async {
      _locationListenerTimer?.cancel();
      _locationListenerTimer = null;
      bool locationPermission = await _getLocationPermission();
      if (!locationPermission && Get.currentRoute != kLocationPermissionPage) {
        Future.delayed(Duration.zero, () {
          Get.toNamed(kLocationPermissionPage);
        });
      }
      _hasLocationPermissionStreamController.add(locationPermission);
      startPeriodicLocationPermissionsListener();
    });
  }

  Future<bool> _getLocationPermission() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) return false;
    PermissionStatus _tempLoca = await Location().hasPermission();

    return _tempLoca == PermissionStatus.granted;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
