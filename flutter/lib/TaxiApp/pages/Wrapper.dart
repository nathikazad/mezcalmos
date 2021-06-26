import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/HomeScreen.dart';

class Wrapper extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Obx((){
      dynamic _user = Get.find<AuthController>().user;

      if ( _user != null )
      {
        print("Initialized Wrapper::AuthController::user >> "+ _user.displayName);
        return HomeScreen();
      }
      else return SignIn();

    });
  }
  
}