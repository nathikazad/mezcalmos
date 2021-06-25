import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class TaxiInjectionHelper
{

  static void toInjectAtSignIn()
  {
    // stuff to inject on SignIn!
    print("toInjectAtSignIn -> called");
  }


  static void revokeListenersOnSignOut()
  {
    print("revokeListenersOnSignOut -> called");

    Get.find<OrderController>().dettahListeners();
    print("Disposing the OrderController and Revoking all the ::taxiOpenOrdersNode:: Listners !");
  }
}