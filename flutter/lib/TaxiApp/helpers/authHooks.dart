import 'dart:ffi';

import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/messageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class AuthHooks {
  AuthController _authController = Get.find<AuthController>();

  void onSignOutHook() async {
    print("[+] TaxiApp::AuthHooks::onSignOutHook -> Callback Executed.");
    _authController.userInfoListener?.pause();
    Get.find<TaxiAuthController>().dispose();
    Get.find<DeviceNotificationsController>().dispose();
    Get.delete<MessageController>();
    Get.delete<FBNotificationsController>();
  }

  void onSignInHook() {
    _authController.userInfoListener?.resume();

    print("[+] TaxiApp::AuthHooks::onSignInHook -> Callback Executed.");
    Get.lazyPut(() => TaxiAuthController());
    Get.lazyPut(() => DeviceNotificationsController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => FBTaxiNotificationsController());
  }
  // SignInHook :
  // Inject The controllers here !
  // do routing from there !
  // Aunauthorized - PermissionPage - (1 of the three orders pages)

  AuthHooks() {
    print("[+] TaxiApp::AuthHooks::Constructor");
    _authController.attachOnSignOutHook(onSignOutHook);
    _authController.attachOnSignInHook(onSignInHook);
  }
}
