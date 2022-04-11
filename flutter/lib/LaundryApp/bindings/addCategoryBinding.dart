/*
* Created By Mirai Devs.
* On 4/11/2022.
*/
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/addCategoryController.dart';

class AddCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCategoryController>(
      () => AddCategoryController(),
      fenix: true,
    );
  }
}
