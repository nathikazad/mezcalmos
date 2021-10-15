import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Inside TaxiWrapper Builder");

    // Navigate to current orders if any after build
    Future.microtask(() {
      _taxiAuthController.stateStream.first.then((state) {
        if (state != null) {
          if (!state.isAuthorized) {
            Get.offNamed(kAunauthorizedRoute);
          } else if (state.currentOrder != null) {
            Get.lazyPut(() => CurrentOrderController());
            Get.offNamed(kCurrentOrderPage);
          } else {
            Get.lazyPut(() => IncomingOrdersController());
            Get.offNamed(kOrdersListPage);
          }
        }
      });
    });

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDraweController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
                "menu", Get.find<SideMenuDraweController>().openMenu),
            body: Center(
              child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Transform.scale(scale: .8, child: MezLogoAnimation()),
              ),
            )
            // FutureBuilder(
            //   future: _ta,
            //   builder: (c, snapshot) {
            //   return Text("data");
            // })

            //  Obx(() {
            //   mezDbgPrint("Inside TaxiWrapper");
            //   mezDbgPrint(_taxiAuthController.taxiState?.toJson());
            //   if (_taxiAuthController.taxiState == null) {
            //     mezDbgPrint("Taxi State not loaded yet >");
            //     return Center(
            //       child: Container(
            //         height: 200,
            //         width: 200,
            //         decoration:
            //             BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            //         child: Transform.scale(scale: .8, child: MezLogoAnimation()),
            //       ),
            //     );
            //   } else if (!_taxiAuthController.taxiState!.isAuthorized) {
            //     mezDbgPrint("User not Unauthorized >");
            //     return UnauthorizedScreen();
            //   } else if (_taxiAuthController.taxiState!.currentOrder != null) {
            //     mezDbgPrint("InCurrentOrder >");
            //     return CurrentOrderScreen();
            //   } else {
            //     mezDbgPrint("Incoming orders >");
            //     return IncomingOrdersScreen();
            //   }
            // }),
            // );

            ));
  }
}
