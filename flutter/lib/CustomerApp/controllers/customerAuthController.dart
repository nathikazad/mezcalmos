import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/Shared/firebaseNodes/customerNodes.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Location.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn<Customer>();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  Rxn<Customer> get customerRxn => _customer;

  bool _checkedAppVersion = false;

  StreamSubscription? _customerNodeListener;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (_authController.fireAuthUser?.uid != null) {
      mezDbgPrint(
          "User from CustomerAuthController >> ${_authController.fireAuthUser?.uid}");
      mezDbgPrint(
          "CustomerAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
      await _customerNodeListener?.cancel();
      _customerNodeListener = _databaseHelper.firebaseDatabase
          .reference()
          .child(customerNode(_authController.fireAuthUser!.uid))
          .onValue
          .listen((event) async {
        _customer.value = Customer.fromSnapshotData(event.snapshot.value);

        if (_checkedAppVersion == false) {
          final String VERSION = GetStorage().read(getxAppVersion);
          print("[+] Customer currently using App v$VERSION");
          await _databaseHelper.firebaseDatabase
              .reference()
              .child(customerAppVersionNode(_authController.fireAuthUser!.uid))
              .set(VERSION);

          _checkedAppVersion = true;
        }
      });

      final String? deviceNotificationToken =
          await _notificationsController.getToken();
      if (deviceNotificationToken != null)
        await _databaseHelper.firebaseDatabase
            .reference()
            .child(
                customerNotificationInfoNode(_authController.fireAuthUser!.uid))
            .set(<String, String>{
          'deviceNotificationToken': deviceNotificationToken
        });
      print(
          "/////////////////////////////////////////////${_customer.value?.toJson()}////////////////////////////////////////////////////");
    } else {
      mezDbgPrint("User is not signed it to init customer auth controller");
    }
  }

  void saveNewLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(savedLocationsNode(_authController.fireAuthUser!.uid))
        .push()
        .set(savedLocation.toFirebaseFormattedJson());
  }

  void editLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(savedLocationNode(
            _authController.fireAuthUser!.uid, savedLocation.id!))
        .set(savedLocation.toFirebaseFormattedJson());
  }

  void deleteLocation(SavedLocation savedLocation) {
    _databaseHelper.firebaseDatabase
        .reference()
        .child(savedLocationNode(
            _authController.fireAuthUser!.uid, savedLocation.id!))
        .remove();
  }

  Location? getLocationById(String locationId) {
    // we get the user Location by it's id!
    return _customer.value?.savedLocations
        .firstWhere((savedLocation) => savedLocation.id == locationId,
            orElse: null)
        .location;
  }

  @override
  void onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");
    await _customerNodeListener?.cancel();
    _customerNodeListener = null;
    super.onClose();
  }
}
