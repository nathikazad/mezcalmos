import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantCartController.dart';
class AuthHooks {
  static Future<void> onSignOutHook() async {
    print("[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<CustomerAuthController>(force: true);
    await Get.delete<OrderController>(force: true);
    await Get.delete<RestaurantCartController>(force: true);
    await Get.delete<DeviceNotificationsController>();
    await Get.delete<MessageController>();
    await Get.delete<FBNotificationsController>();
    print("[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    print("[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<CustomerAuthController>(CustomerAuthController(), permanent: true);
    Get.put<OrderController>(OrderController(), permanent: true);
    Get.put<RestaurantCartController>(RestaurantCartController(),
        permanent: true);
    Get.lazyPut(() => DeviceNotificationsController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBTaxiNotificationsController());
  }
}
