import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    print("[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<TaxiAuthController>();
    await Get.delete<DeviceNotificationsController>();
    await Get.delete<MessageController>();
    await Get.delete<FBNotificationsController>();
  }

  static void onSignInHook() {
    print("[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.lazyPut(() => TaxiAuthController());
    Get.lazyPut(() => DeviceNotificationsController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBTaxiNotificationsController());
  }
}
