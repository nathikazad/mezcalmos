import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();

  // pop Point!
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Inside TaxiWrapper Builder");
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
    return Scaffold(
      key: _sideMenuDrawerController.getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),

      body: StreamBuilder(
          stream: _taxiAuthController.taxiDriverDataEventRx.stream,
          builder: (_, AsyncSnapshot<AgentDataEvent> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              mezDbgPrint(
                  "Inside TaxiWrapper::StreamBuilder::ConnectionState.waiting");

              return Center(
                child: Transform.scale(scale: 0.3, child: MezLogoAnimation()),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                mezDbgPrint(
                    "Inside TaxiWrapper::StreamBuilder::ConnectionState.done|active::hasError");
                return const Center(
                  child: Icon(
                    Icons.wifi_off_outlined,
                    size: 40,
                  ),
                );
              } else if (snapshot.hasData) {
                switch (snapshot.data) {
                  case AgentDataEvent.DataNotLoadedYet:
                    return Center(
                      child: Transform.scale(
                          scale: 0.4, child: MezLogoAnimation()),
                    );
                  case AgentDataEvent.Unauthorized:
                    return UnauthorizedScreen();
                  case AgentDataEvent.InCurrentOrder:
                    return CurrentOrderScreen();
                  // Show List Orders Screen
                  default:
                    return IncomingOrdersScreen();
                }
              } else {
                mezDbgPrint(
                    "Inside TaxiWrapper::StreamBuilder::ConnectionState.done|active::EmptyData");
                return const Text('Empty data');
              }
            } else {
              mezDbgPrint(
                  "Else : Inside TaxiWrapper::StreamBuilder::ConnectionState.${snapshot.connectionState}");
              return Text('State: ${snapshot.connectionState}');
            }
          }),

      // body: Obx(() => _taxiAuthController.authorizedTaxi != null
      //     ? (_taxiAuthController.authorizedTaxi == true
      //         ? (_taxiAuthController.currentOrderId != null
      //             ? CurrentOrderScreen()
      //             : IncomingOrdersScreen())
      //         : UnauthorizedScreen())
      //     : Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.pink,
      //         ),
      //       )),
      // - Incomiing order Sc
      // - Anauthorized
      // - CurrentOrder
    );
  }
}
