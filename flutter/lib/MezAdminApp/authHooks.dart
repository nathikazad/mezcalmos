import 'package:get/get.dart';
import 'package:mezcalmos/MezAdminApp/controllers/mezAdminAuthController.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    await Get.delete<MezAdminAuthController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<NativeBackgroundNotificationsController>(force: true);
    await Get.delete<ServiceProfileController>(force: true);
  }

  static void onSignInHook() {
    Get.put<NativeBackgroundNotificationsController>(
        NativeBackgroundNotificationsController(),
        permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<MezAdminAuthController>(
      MezAdminAuthController(),
      permanent: true,
    );
    Get.put<ServiceProfileController>(
      ServiceProfileController(),
      permanent: true,
    );
  }
}
