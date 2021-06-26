import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/ListOrdersScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/AuthScreens/UnauthorizedScreen.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    TaxiAuthController _taxiAuthController = Get.put(TaxiAuthController());
    return Obx(() {
      print("authorizedTaxi");
      print(_taxiAuthController.authorizedTaxi);

      if (_taxiAuthController.authorizedTaxi == true) {
        if (_taxiAuthController.currentOrderId != null) {
          return CurrentOrderScreen();
        } else {
          return IncomingOrdersScreen();
        }
      } else {
        return UnauthorizedScreen();
      }
    });
  }
}
