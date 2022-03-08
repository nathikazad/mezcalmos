import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/adminAuthController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/deliveryDriverController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/controllers/backgroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/foregroundNotificationsController.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class AuthHooks {
  static Future<void> onSignOutHook() async {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Executed.");
    await Get.delete<AdminAuthController>(force: true);
    await Get.delete<RestaurantOrderController>(force: true);
    await Get.delete<LaundryOrderController>(force: true);
    await Get.delete<BackgroundNotificationsController>(force: true);
    await Get.delete<MessageController>(force: true);
    await Get.delete<ForegroundNotificationsController>(force: true);
    await Get.delete<DeliveryDriverController>(force: true);
    await Get.delete<TaxiOrderController>(force: true);
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignOutHook -> Callback Finished.");
  }

  static void onSignInHook() {
    mezDbgPrint(
        "[+] DeliveryAdminApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.put<BackgroundNotificationsController>(
        BackgroundNotificationsController(),
        permanent: true);
    Get.put<AdminAuthController>(AdminAuthController(), permanent: true);
    Get.put<ForegroundNotificationsController>(
        ForegroundNotificationsController(),
        permanent: true);
    Get.put<RestaurantOrderController>(RestaurantOrderController(),
        permanent: true);
    Get.put<LaundryOrderController>(LaundryOrderController(), permanent: true);
    Get.put<MessageController>(MessageController(), permanent: true);
    Get.put<DeliveryDriverController>(DeliveryDriverController(),
        permanent: true);
    Get.put<TaxiOrderController>(TaxiOrderController(), permanent: true);
  }
}
