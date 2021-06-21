import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';


class SplashScreen extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) {
    return controller.auth == null ? CircularProgressIndicator() : Wrapper();
  }
}