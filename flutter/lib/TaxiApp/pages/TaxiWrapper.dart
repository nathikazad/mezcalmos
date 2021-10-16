import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/models/TaxiDriver.dart';

import 'package:mezcalmos/TaxiApp/router.dart';

class TaxiWrapper extends StatelessWidget {
  void handleState(TaxiState? state) {
    mezDbgPrint("TaxiWrapper::handleState $state");
    if (state != null) {
      if (!state.isAuthorized) {
        mezDbgPrint("TaxiWrapper::handleState going to unauthorized");
        Get.toNamed(kAunauthorizedRoute);
      } else if (state.currentOrder != null) {
        mezDbgPrint("TaxiWrapper::handleState going to current order");
        Get.toNamed(kCurrentOrderPage);
      } else {
        mezDbgPrint("TaxiWrapper::handleState going to incoming orders");
        Get.toNamed(kOrdersListPage);
      }
    } else {
      mezDbgPrint("TaxiWrapper::handleState state is null, ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    mezDbgPrint("TaxiWrapper:: build");
    Future.microtask(() {
      mezDbgPrint("TaxiWrapper::microtask handleState first time");
      TaxiState? taxiState = Get.find<TaxiAuthController>().taxiState;
      if (taxiState != null)
        handleState(taxiState);
      else
        Get.find<TaxiAuthController>()
            .stateStream
            .first
            .then((taxiState) => handleState(taxiState));
    });
    return Scaffold(
        key: Get.find<SideMenuDraweController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
            "menu", Get.find<SideMenuDraweController>().openMenu),
        body: MezLogoAnimation(centered: true));
  }
}
