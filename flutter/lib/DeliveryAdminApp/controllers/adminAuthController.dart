import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/DeliveryAdminApp/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/constants/databaseNodes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
import 'package:mezcalmos/DeliveryAdminApp/models/Admin.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class AdminAuthController extends GetxController {
  Rxn<Admin> _admin = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  Admin? get admin => _admin.value;
  Stream<Admin?> get adminStream => _admin.stream;
  StreamSubscription? _adminNodeListener;

  bool _checkedAppVersion = false;
  @override
  void onInit() async {
    super.onInit();

    // ------------------------------------------------------------------------

    mezDbgPrint(
        "Admin from AdminAuthController >> ${_authController.fireAuthUser!.uid}");
    _adminNodeListener?.cancel();
    mezDbgPrint(userInfo(_authController.fireAuthUser!.uid));
    _adminNodeListener = _databaseHelper.firebaseDatabase
        .reference()
        .child(adminNode(_authController.fireAuthUser!.uid))
        .onValue
        .listen((event) async {
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");
      mezDbgPrint(event.snapshot.value);
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");
      mezDbgPrint("=====================================");

      _admin.value = Admin.fromSnapshot(event.snapshot.value);
      if (_admin.value?.authorized ?? false) {
        if (_checkedAppVersion == false) {
          String appVersion = GetStorage().read(getxVersion);
          print("[+] Customer currently using App v$appVersion");
          _databaseHelper.firebaseDatabase
              .reference()
              .child(adminAppVersionNode(_authController.fireAuthUser!.uid))
              .set(appVersion);

          _checkedAppVersion = true;
        }

        String? deviceNotificationToken =
            await _notificationsController.getToken();
        mezDbgPrint(
            "AdminAuthController  Messaging Token>> ${deviceNotificationToken}");
        if (deviceNotificationToken != null)
          _databaseHelper.firebaseDatabase
              .reference()
              .child(
                  adminNotificationInfoNode(_authController.fireAuthUser!.uid))
              .set(<String, String>{
            'deviceNotificationToken': deviceNotificationToken
          });
      }
    });
  }

  @override
  void onClose() async {
    mezDbgPrint("[+] AdminAuthController::onClose ---------> Was invoked !");
    _adminNodeListener?.cancel();
    _adminNodeListener = null;
    super.onClose();
  }
}
