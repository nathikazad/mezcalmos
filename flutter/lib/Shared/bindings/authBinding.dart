import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController() , permanent: true);
  }
  
} 
