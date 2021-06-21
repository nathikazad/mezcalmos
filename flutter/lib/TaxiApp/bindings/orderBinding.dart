import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class OrderBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());   
  }
  
}