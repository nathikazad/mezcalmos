import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryAdminAuth.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    await Get.delete<OrderController>(force: true);
    await Get.delete<DeliveryOperatorAuthController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
  }

  static void onSignInHook() {
    Get.put<BackgroundNotificationsController>(
        BackgroundNotificationsController(),
        permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<DeliveryOperatorAuthController>(
      DeliveryOperatorAuthController(),
      permanent: true,
    );
    Get.put<OrderController>(
      OrderController(),
      permanent: true,
    );
  }
}
