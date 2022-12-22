import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    // await Get.delete<BackgroundNotificationsController>(force: true);
    // await Get.delete<MessageController>(force: true);
    // await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<DeliveryOperatorAuthController>(force: true);
  }

  static void onSignInHook() {
    Get.put<DeliveryOperatorAuthController>(
      DeliveryOperatorAuthController(),
      permanent: true,
    );
    // Get.put<BackgroundNotificationsController>(
    //     BackgroundNotificationsController(),
    //     permanent: true);
    // Get.put<ForegroundNotificationsController>(
    //     ForegroundNotificationsController(),
    //     permanent: true);

    // Get.put<MessageController>(MessageController(), permanent: true);
  }
}
