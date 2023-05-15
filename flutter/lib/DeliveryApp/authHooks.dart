import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<MessageController>(force: true);

    await Get.delete<NativeBackgroundNotificationsController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<DeliveryAuthController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");

    Get.put(ForegroundNotificationsController(), permanent: true);
    Get.put(NativeBackgroundNotificationsController(), permanent: true);

    Get.put(DeliveryAuthController(), permanent: true);

    Get.put(MessageController(), permanent: true);
  }
}
