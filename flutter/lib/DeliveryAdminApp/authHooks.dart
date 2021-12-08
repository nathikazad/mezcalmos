import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';

import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<AdminAuthController>(force: true);
    await Get.delete<OrderController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<BackgroundNotificationsController>(
        BackgroundNotificationsController(),
        permanent: true);
    Get.put<AdminAuthController>(AdminAuthController(), permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<OrderController>(OrderController(), permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);

  }
}
