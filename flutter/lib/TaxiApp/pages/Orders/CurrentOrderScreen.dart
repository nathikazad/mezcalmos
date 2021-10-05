import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  final LanguageController lang = Get.find<LanguageController>();
  final FBNotificationsController fbNotificationsController =
      Get.put<FBNotificationsController>(FBTaxiNotificationsController());

  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  // map stuff ==================================
  Set<Polyline> polylines;
  LatLng initialCameraPosition;
  List<CustomMarker> customMarkers;
  //==================================

  CurrentOrderScreen(
      this.polylines, this.customMarkers, this.initialCameraPosition);

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        MGoogleMap(
          customMarkers,
          initialCameraPosition,
          polylines: polylines,
        ),

        // no need for obx here.
        CurrentPositionedBottomBar(
            controller, taxiAuthController, lang, fbNotificationsController),
        CurrentPositionedFromToTopBar(controller, lang)
      ],
    );
  }
}
