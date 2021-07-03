import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/smsController.dart';

class SmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmsController>(() => SmsController());
  }
}
