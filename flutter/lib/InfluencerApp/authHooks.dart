import 'package:get/get.dart';
import 'package:mezcalmos/InfluencerApp/controllers/influencerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] InfluencerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<MessageController>(force: true);
    await Get.delete<NativeBackgroundNotificationsController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<InfluencerAuthController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] InfluencerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put(ForegroundNotificationsController(), permanent: true);
    Get.put(NativeBackgroundNotificationsController(), permanent: true);
    Get.put(InfluencerAuthController(), permanent: true);
    Get.put(MessageController(), permanent: true);
  }
}
