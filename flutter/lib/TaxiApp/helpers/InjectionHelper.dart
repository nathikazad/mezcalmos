import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class TaxiInjectionHelper
{
  // it would be much easier if we maintain the toInjectAt(x) Functions in the SameDependency Orders
  
  static void toInjectAtWrapper()
  {
  }

  static void toInjectAtSignIn()
  {
    // stuff to inject on SignIn!
    print("toInjectAtSignIn -> called");
  }

  static void toInjectAtHome()
  {
    Get.lazyPut(() => SideMenuDraweController() , fenix: true);
    // Get.lazyPut(() => OrderController() , fenix: true);
  }





  // Listeners Revoking in case needed !
  static void revokeListenersOnSignOut()
  {
    print("revokeListenersOnSignOut -> called");

    Get.find<IncomingOrdersController>().detachListeners();
    Get.find<TaxiAuthController>().detachListeners();
    print("Disposing the OrderController and Revoking all the ::taxiOpenOrdersNode:: Listners !");
  }

}