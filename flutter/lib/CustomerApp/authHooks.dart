import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/fbNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/deviceNotificationsController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<CustomerAuthController>(force: true);
    await Get.delete<OrderController>(force: true);
    await Get.delete<RestaurantCartController>(force: true);
    await Get.delete<DeviceNotificationsController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<FBNotificationsController>(force: true);
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<DeviceNotificationsController>(DeviceNotificationsController(),
        permanent: true);
    Get.put<CustomerAuthController>(CustomerAuthController(), permanent: true);
    Get.put<FBNotificationsController>(FBNotificationsController(),
        permanent: true);
    Get.put<OrderController>(OrderController(), permanent: true);
    Get.put<RestaurantCartController>(RestaurantCartController(),
        permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);

  }
}
