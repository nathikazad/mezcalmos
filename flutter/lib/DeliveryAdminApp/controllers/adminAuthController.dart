import 'dart:async';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/deviceNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/DatabaseHelper.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Admin.dart';

class AdminAuthController extends GetxController {
  Rxn<Admin> _admin = Rxn();
  DatabaseHelper _databaseHelper = Get.find<DatabaseHelper>();
  AuthController _authController = Get.find<AuthController>();

  DeviceNotificationsController _notificationsController =
      Get.find<DeviceNotificationsController>();


  Admin? get admin => _admin.value;
  Stream<Admin?> get adminStream => _admin.stream;
  StreamSubscription? _adminDataFromDbStream;
  @override
  void onInit() async {
    super.onInit();

    // ------------------------------------------------------------------------

    print("Admin from AdminAuthController >> ${_authController.user?.uid}");
    if (_authController.user != null) {
      _adminDataFromDbStream?.cancel();
      _adminDataFromDbStream = _databaseHelper.firebaseDatabase
          .reference()
          .child(adminNode(_authController.user!.uid))
          .onValue
          .listen((event) async {
        _admin.value = Admin.fromSnapshot(event.snapshot.value);
        print(
            "/////////////////////////////////////////////${_admin.value?.toJson()}////////////////////////////////////////////////////");
      });

      String? deviceNotificationToken =
          await _notificationsController.getToken();
          print(
          "AdminAuthController  Messaging Token>> ${deviceNotificationToken}");
      if (deviceNotificationToken != null)
        _databaseHelper.firebaseDatabase
            .reference()
            .child(adminNotificationInfoNode(_authController.user!.uid))
            .set(<String, String>{
          'deviceNotificationToken': deviceNotificationToken
        });
    }
  }

  @override
  void onClose() async {
    print("[+] AdminAuthController::onClose ---------> Was invoked !");
    _adminDataFromDbStream?.cancel();
    _adminDataFromDbStream = null;
    super.onClose();
  }
}
