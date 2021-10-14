import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<CurrentOrderController>(force: true);
    await Get.delete<TaxiAuthController>();
    await Get.delete<DeviceNotificationsController>(force: true);
    await Get.delete<MessageController>();
    await Get.delete<FBTaxiNotificationsController>();
    await Get.delete<IncomingOrdersController>();
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.lazyPut(() => TaxiAuthController());
    Get.lazyPut(() => DeviceNotificationsController(), fenix: true);
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBTaxiNotificationsController());
    Get.put(CurrentOrderController(), permanent: true);
  }
}
