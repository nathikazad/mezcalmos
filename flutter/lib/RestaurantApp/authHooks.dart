import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantOpAuthController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] CustomerApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<MessageController>(force: true);

    await Get.delete<ROpOrderController>(force: true);
    await Get.delete<RestaurantInfoController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<RestaurantOpAuthController>(force: true);
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] Restaurant App::AuthHooks::onSignInHook -> Callback Executed.");

    Get.put(ForegroundNotificationsController(), permanent: true);
    Get.put(BackgroundNotificationsController(), permanent: true);

    // Get.put(RestaurantInfoController(), permanent: true);

    Get.put(RestaurantOpAuthController(), permanent: true);
    Get.put(ROpOrderController(), permanent: true);

    Get.put(MessageController(), permanent: true);
  }
}
