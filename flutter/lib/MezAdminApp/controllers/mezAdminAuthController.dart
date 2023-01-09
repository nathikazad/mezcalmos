import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/database/FirebaseDb.dart';

import 'package:mezcalmos/Shared/graphql/admin/hsAdmin.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class MezAdminAuthController extends GetxController {
  Rxn<MezAdmin> _admin = Rxn();
  FirebaseDb _databaseHelper = Get.find<FirebaseDb>();
  AuthController _authController = Get.find<AuthController>();

  BackgroundNotificationsController _notificationsController =
      Get.find<BackgroundNotificationsController>();

  MezAdmin? get admin => _admin.value;
  Stream<MezAdmin?> get adminStream => _admin.stream;
  // StreamSubscription? _adminNodeListener;

  bool _checkedAppVersion = false;
  @override
  Future<void> onInit() async {
    super.onInit();
    if (_authController.user != null) {
      _admin.value = await get_admin(user_id: _authController.hasuraUserId!);
      mezDbgPrint("_admin.value ====> ${_admin.value}");
    }

    // await _adminNodeListener?.cancel();
    // mezDbgPrint(userInfoNode(_authController.fireAuthUser!.uid));
    // mezDbgPrint((adminNode(_authController.fireAuthUser!.uid)));
    // _adminNodeListener = _databaseHelper.firebaseDatabase
    //     .ref()
    //     .child(adminNode(_authController.fireAuthUser!.uid))
    //     .onValue
    //     .listen((DatabaseEvent event) async {
    //   _admin.value = Admin.fromSnapshot(event.snapshot.value);
    //   if (_admin.value?.authorized ?? false) {
    //     if (_checkedAppVersion == false) {
    //       final String appVersion = GetStorage().read(getxAppVersion);
    //       print("[+] Customer currently using App v$appVersion");
    //       await _databaseHelper.firebaseDatabase
    //           .ref()
    //           .child(adminAppVersionNode(_authController.fireAuthUser!.uid))
    //           .set(appVersion);

    //       _checkedAppVersion = true;
    //     }

    //     final String? deviceNotificationToken =
    //         await _notificationsController.getToken();

    //     if (deviceNotificationToken != null)
    //       await _databaseHelper.firebaseDatabase
    //           .ref()
    //           .child(
    //               adminNotificationInfoNode(_authController.fireAuthUser!.uid))
    //           .set(<String, String>{
    //         'deviceNotificationToken': deviceNotificationToken
    //       });
    //   }
    // });
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint("[+] AdminAuthController::onClose ---------> Was invoked !");
    // await _adminNodeListener?.cancel();
    // _adminNodeListener = null;
    super.onClose();
  }
}
