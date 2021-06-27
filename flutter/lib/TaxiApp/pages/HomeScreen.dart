import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
// import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) 
  {
    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;

    // ----------------------DI-----------------------

    // INJECTING OUR NEEDED CONTROLLERS

    TaxiInjectionHelper.toInjectAtHome();
    
    // USING FIND TO INITILIZE THE CONTROLLERS INJECTED USING LAZYPUT!

    // OrderController           _orderController            = Get.find<OrderController>();
    SideMenuDraweController   _sideMenuDrawerController = Get.find<SideMenuDraweController>();

    // ------------------------------------------------
    //    
    return Scaffold(
      key: _sideMenuDrawerController.scaffoldKey,
      drawer: MezcalmosSideMenu(),
      
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(_sideMenuDrawerController.openMenu),
      body: null
    );
  }
}