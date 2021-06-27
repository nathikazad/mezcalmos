import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';


class TaxiWrapper extends GetWidget<TaxiAuthController> 
{

  SideMenuDraweController   _sideMenuDrawerController = Get.find<SideMenuDraweController>();
  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sideMenuDrawerController.scaffoldKey,
      drawer: MezcalmosSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(_sideMenuDrawerController.openMenu),
      
      body: Obx(() => controller.dynamicScreen),
    );
  }
}
