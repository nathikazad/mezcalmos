import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    // print("Auth binding");
    // Get.put<AuthController>(AuthController());
  }
}
