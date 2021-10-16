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
    await Get.delete<MessageController>(force: true);
    await Get.delete<FBTaxiNotificationsController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put(DeviceNotificationsController(), permanent: true);
    Get.put(TaxiAuthController(), permanent: true);
    Get.put(MessageController(), permanent: true);
    Get.put(FBTaxiNotificationsController(), permanent: true);
  }
}
