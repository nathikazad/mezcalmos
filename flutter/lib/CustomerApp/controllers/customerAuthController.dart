import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/CustomerApp/constants/databaseNodes.dart';

import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/deviceNotificationsController.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';

class CustomerAuthController extends GetxController {
  Rxn<Customer> _customer = Rxn();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  RxBool _locationEnabled = false.obs;
  DeviceNotificationsController _notificationsController =
      Get.find<DeviceNotificationsController>();

  Rxn<Customer> get customerStream => _customer;
  bool _checkedAppVersion = false;

  StreamSubscription? _customerNodeListener;

  @override
  void onInit() async {
    super.onInit();

    // ------------------------------------------------------------------------

    print(
        "User from CustomerAuthController >> ${_authController.fireAuthUser!.uid}");
    print(
        "CustomerAuthController  Messaging Token>> ${await _notificationsController.getToken()}");
    _customerNodeListener?.cancel();
    _customerNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(customerNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      _customer.value = Customer.fromSnapshot(event.snapshot.value);

      if (_checkedAppVersion == false) {
        String VERSION = GetStorage().read(getxVersion);
        print("[+] Customer currently using App v$VERSION");
        _databaseHelper.firebaseDatabase
            .reference()
            .child(customerAppVersionNode(_authController.fireAuthUser!.uid))
            .set(VERSION);

        _checkedAppVersion = true;
      }
    });

    String? deviceNotificationToken = await _notificationsController.getToken();
    if (deviceNotificationToken != null)
      _databaseHelper.firebaseDatabase
          .reference()
          .child(
              customerNotificationInfoNode(_authController.fireAuthUser!.uid))
          .set(<String, String>{
        'deviceNotificationToken': deviceNotificationToken
      });
    print(
        "/////////////////////////////////////////////${_customer.value?.toJson()}////////////////////////////////////////////////////");
  }

  @override
  void onClose() async {
    print("[+] CustomerAuthController::onClose ---------> Was invoked !");
    _customerNodeListener?.cancel();
    _customerNodeListener = null;
    super.onClose();
  }
}
