import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<TaxiAuthController>(force: true);
    await Get.delete<DeviceNotificationsController>(force: true);
    await Get.delete<MessageController>();
    await Get.delete<FBTaxiNotificationsController>();
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.lazyPut(() => TaxiAuthController(), fenix: true);
    Get.lazyPut(() => DeviceNotificationsController(), fenix: true);
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBTaxiNotificationsController());
  }
}
