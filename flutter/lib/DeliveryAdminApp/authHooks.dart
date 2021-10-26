import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/deviceNotificationsController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';

import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<AdminAuthController>(force: true);
    // await Get.delete<OrderController>(force: true);
    await Get.delete<DeviceNotificationsController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<FBNotificationsController>(force: true);
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<DeviceNotificationsController>(DeviceNotificationsController(),
        permanent: true);
    Get.put<AdminAuthController>(AdminAuthController(), permanent: true);
    // Get.put<OrderController>(OrderController(), permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<FBNotificationsController>(FBNotificationsController(),
        permanent: true);
  }
}
