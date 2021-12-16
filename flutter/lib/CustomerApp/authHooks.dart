import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
// TODO : these deletes should not delete stuff that should be Globaly injected (on Signin And SiGnout)
    await Get.delete<CustomerAuthController>(force: true);
    // await Get.delete<OrderController>(force: true);
    // await Get.delete<TaxiController>(force: true);
    // await Get.delete<RestaurantController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<MessageController>(force: true);
    // await Get.delete<ForegroundNotificationsController>(force: true);
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<BackgroundNotificationsController>(
        BackgroundNotificationsController(),
        permanent: true);
    Get.put<CustomerAuthController>(CustomerAuthController(), permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<OrderController>(OrderController(), permanent: true);
    Get.put<TaxiController>(TaxiController(), permanent: true);
    Get.put<RestaurantController>(RestaurantController(), permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
  }
}
