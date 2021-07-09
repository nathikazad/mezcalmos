import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class TaxiWrapper extends GetView<AuthController> {
  SideMenuDraweController _sideMenuDrawerController = Get.find<SideMenuDraweController>();

  // pop Point!
  @override
  Widget build(BuildContext context) {
    print("Putting Taxi Auth Controller");
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
    return Scaffold(
      key: _sideMenuDrawerController.scaffoldKey,
      drawer: MezcalmosSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("menu", _sideMenuDrawerController.openMenu),
      body: Obx(() => _taxiAuthController.dynamicScreen),
      // - Incomiing order Sc
      // - Anauthorized
      // - CurrentOrder
    );
  }
}
