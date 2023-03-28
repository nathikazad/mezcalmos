import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerCartController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustomerAuthHooksBase {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
      "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.",
    );

    await Get.delete<CustomerAuthController>(force: true);
    await Get.delete<CustomerOrderController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
  }

  static Future<void> onSignInHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");

    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<CustomerAuthController>(CustomerAuthController(), permanent: true);
    Get.put<CustomerOrderController>(CustomerOrderController(),
        permanent: true);
  }
}
