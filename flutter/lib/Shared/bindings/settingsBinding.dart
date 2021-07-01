import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() 
  {
    Get.put(SettingsController() , permanent: true);
  }
  
} 