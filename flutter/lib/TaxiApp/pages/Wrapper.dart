import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/TaxiWrapper.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
// import 'package:mezcalmos/TaxiApp/pages/CurrentOrderScreen.dart';
// import 'package:mezcalmos/TaxiApp/pages/UnauthorizedScreen.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Obx(() {
      if (controller.user != null) {
        // Injecting TaxiAuthController Here so we can get it as Widget in TaxiWrapper
        //Get.put(TaxiAuthController());
        Get.put(SideMenuDraweController());
        return TaxiWrapper();
      } else
        return SignIn();
=======
    return Obx(() 
    {
        if( controller.user != null )
        {
          // Injecting TaxiAuthController Here so we can get it as Widget in TaxiWrapper
          Get.put(TaxiAuthController());
          Get.put(SideMenuDraweController() , permanent: true);
          return TaxiWrapper();
        }
        else return  SignIn();
>>>>>>> 866d09baaf1e0181d34ee57338b3b0d22d6ac14e
    });
    
  }
}
