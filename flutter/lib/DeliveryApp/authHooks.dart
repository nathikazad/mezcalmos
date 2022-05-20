import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<MessageController>(force: true);

    await Get.delete<OrderController>(force: true);
    await Get.delete<RestaurantOrderController>(force: true);
    await Get.delete<LaundryOrderController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<DeliveryAuthController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");

    Get.put(ForegroundNotificationsController(), permanent: true);
    Get.put(BackgroundNotificationsController(), permanent: true);
    Get.put(OrderController(), permanent: true);
    Get.put(DeliveryAuthController(), permanent: true);
    Get.put(LaundryOrderController(), permanent: true);
    Get.put(RestaurantOrderController(), permanent: true);
    Get.put(MessageController(), permanent: true);
  }
}
