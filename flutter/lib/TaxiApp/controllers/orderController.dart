import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/models/Order.dart';
import 'package:mezcalmos/TaxiApp/services/ApiService.dart';


class OrderController extends GetxController {

  RxList<Order> _orders =  <Order>[].obs; // this is observable which will be constaintly changing in realtime .
  AuthController _authController = Get.find<AuthController>(); // since it's already injected .


  List<Order> get orders => _orders;


  // executed once depending on the use state.
  Future<void> _fillOrders() async
  {
    if (_authController.user != null)
    {
        print("Current User ---> "+_authController.user.toString()+"\n\n");
        _orders.value = await ApiService.fetchOrders() as List<Order>;
    }
    print("+ Orders filled > "+orders.length.toString());
  }


  @override
  void onInit() async {
    super.onInit();
    // invoking on the onInit callack to pre-fill ordes.
    await this._fillOrders();
    print("[OrderController] > onInit callback done .");
  }


}
