import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/laundryOpAuthController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<MessageController>(force: true);

    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<LaundryOpAuthController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");

    Get.put(ForegroundNotificationsController(), permanent: true);
    Get.put(BackgroundNotificationsController(), permanent: true);

    Get.put(LaundryOpAuthController(), permanent: true);
  }
}
