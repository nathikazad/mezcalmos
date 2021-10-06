import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/UnauthorizedScreen.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen.dart';

class TaxiWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  // pop Point!
  @override
  Widget build(BuildContext context) {
    mezDbgPrint("Inside TaxiWrapper Builder");
    return Scaffold(
      key: _sideMenuDrawerController.getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),
      body: StreamBuilder<AgentDataEvent>(
          stream: _taxiAuthController.taxiDriverDataEventRx.stream,
          builder: (_, AsyncSnapshot<AgentDataEvent> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              mezDbgPrint(
                  "Inside TaxiWrapper::StreamBuilder::ConnectionState.waiting");

              return Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Transform.scale(scale: .8, child: MezLogoAnimation()),
                ),
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
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Transform.scale(
                            scale: .8, child: MezLogoAnimation()),
                      ),
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
                return Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Icon(
                      Icons.error,
                      size: 40,
                      color: Colors.purple.shade200,
                    ),
                  ),
                );
              }
            } else {
              mezDbgPrint(
                  "Else : Inside TaxiWrapper::StreamBuilder::ConnectionState.${snapshot.connectionState}");
              return Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.error,
                    size: 40,
                    color: Colors.purple.shade200,
                  ),
                ),
              );
            }
          }),
    );
  }
}
