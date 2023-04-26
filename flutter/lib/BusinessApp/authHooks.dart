import 'package:get/get.dart';
import 'package:mezcalmos/BusinessApp/controllers/BusinessOpAuthController.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    await Get.delete<BusinessOpAuthController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ServiceProfileController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
  }

  static void onSignInHook() {
    Get.put<ServiceProfileController>(ServiceProfileController(),
        permanent: true);
    Get.put<BackgroundNotificationsController>(
        BackgroundNotificationsController(),
        permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<BusinessOpAuthController>(
      BusinessOpAuthController(),
      permanent: true,
    );
  }
}
