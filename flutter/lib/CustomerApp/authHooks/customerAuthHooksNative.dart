import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/authHooks/customerAuthHooksBase.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class CustomerAuthHooksNative extends CustomerAuthHooksBase {
  @override
  static Future<void> onSignOutHook() async {
    await Get.delete<NativeBackgroundNotificationsController>(force: true);
    await CustomerAuthHooksBase.onSignOutHook();
  }

  static Future<void> onSignInHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");

    await CustomerAuthHooksBase.onSignInHook();
    Get.put<NativeBackgroundNotificationsController>(
      NativeBackgroundNotificationsController(),
      permanent: true,
    );
  }
}
