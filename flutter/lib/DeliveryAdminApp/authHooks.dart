import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/Shared/controllers/ServiceProfileController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotifications/nativeBackgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    await Get.delete<DeliveryOpAuthController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ServiceProfileController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<NativeBackgroundNotificationsController>(force: true);
  }

  static void onSignInHook() {
    Get.put<ServiceProfileController>(ServiceProfileController(),
        permanent: true);
    Get.put<NativeBackgroundNotificationsController>(
        NativeBackgroundNotificationsController(),
        permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<DeliveryOpAuthController>(
      DeliveryOpAuthController(),
      permanent: true,
    );
  }
}
