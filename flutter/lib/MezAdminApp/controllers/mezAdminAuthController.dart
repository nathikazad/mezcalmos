import 'dart:async';

import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/models/MezAdmin.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/graphql/admin/hsAdmin.dart';
import 'package:mezcalmos/Shared/graphql/notifications/hsNotificationInfo.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/NotificationInfo.dart';

class MezAdminAuthController extends GetxController {
  Rxn<MezAdmin> _admin = Rxn();
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
      await getMezAdmin();
      mezDbgPrint("_admin.value ====> ${_admin.value}");
      unawaited(saveNotificationToken());
    }
  }

  Future<void> getMezAdmin() async {
    _admin.value = await get_admin(user_id: _authController.hasuraUserId!);
  }

  Future<void> saveNotificationToken() async {
    final String? deviceNotificationToken =
        await _notificationsController.getToken();
    final NotificationInfo? notifInfo = await get_notif_info(
        userId: _authController.hasuraUserId!, appType: "mez_admin");
    mezDbgPrint("inside save notif token=====>>>😍");
    mezDbgPrint("inside save notif token=====>>>${notifInfo?.token}");
    mezDbgPrint("inside save notif token=====>>>$deviceNotificationToken");
    try {
      if (notifInfo != null &&
          deviceNotificationToken != null &&
          notifInfo.token != deviceNotificationToken) {
        mezDbgPrint("🫡🫡 Updating notification info 🫡🫡");
        // ignore: unawaited_futures
        update_notif_info(
            notificationInfo: NotificationInfo(
                userId: _authController.hasuraUserId!,
                appType: "mezAdmin",
                id: notifInfo.id,
                token: deviceNotificationToken));
      } else if (deviceNotificationToken != null && notifInfo == null) {
        mezDbgPrint("🫡🫡 Saving notification info for the first time 🫡🫡");
        // ignore: unawaited_futures
        insert_notif_info(
            userId: _authController.hasuraUserId!,
            token: deviceNotificationToken,
            appType: "mezAdmin");
      }
    } catch (e, stk) {
      mezDbgPrint(e);
      mezDbgPrint(stk);
    }
  }

  @override
  Future<void> onClose() async {
    mezDbgPrint("[+] AdminAuthController::onClose ---------> Was invoked !");

    super.onClose();
  }
}
