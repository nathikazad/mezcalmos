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

class TaxiWrapper extends GetWidget<AuthController> {
  SideMenuDraweController _sideMenuDrawerController =
      Get.find<SideMenuDraweController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  //===================================================================
  Set<Polyline> polylines = <Polyline>{};
  Map<String, dynamic> bitmapDescriptors = {
    "customerImg": null,
    "taxiImg": null,
    "destinationImg": null
  };
  Rx<LatLng> initialCameraPosition = LatLng(0, 0).obs;
  RxList<CustomMarker> customMarkers = <CustomMarker>[].obs;

  // Handling Event ------------------------------------------------------------------------------------
  Future<void> _handleEvent() async {
    // customMarkers.refresh();
    CurrentOrderController controller = Get.find<CurrentOrderController>();

    if (controller.currentOrderStreamRx.value?.event != null) {
      if (controller.currentOrderStreamRx.value?.event?.eventType ==
          CurrentOrderEventTypes.OrderStatusChange) {
        if (controller.currentOrderStreamRx.value?.order.status ==
                "cancelled" &&
            controller.currentOrderStreamRx.value?.order.cancelledBy ==
                "customer") {
          await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
              55, Get.height, Get.width);
          // Get.back(closeOverlays: true);
        } else if (controller.currentOrderStreamRx.value?.order.status ==
            "onTheWay") {
          _loadMarkersForOTW();
        } else if (controller.currentOrderStreamRx.value?.order.status ==
            "inTransit") {
          _loadMarkersForIT();
        }
      }
      controller.clearEvent();
    }
  }

  void _loadPolyline() {
    // check if polyline is empty
    if (polylines.isEmpty) {
      CurrentOrderController controller = Get.find<CurrentOrderController>();
      // check if event.order has data
      if (controller.currentEvent != null) {
        // load the polyline

        polylines.add(Polyline(
          color: Color.fromARGB(255, 172, 89, 252),
          polylineId: PolylineId("polyline"),
          jointType: JointType.round,
          points: loadUpPolyline(controller.currentOrderStream?.order),
          width: 2,
          startCap: Cap.buttCap,
          endCap: Cap.roundCap,
          // geodesic: true,
        ));
      }
    }
  }

  // onTheWay - state
  Future<void> _loadMarkersForOTW() async {
    CurrentOrderController controller = Get.find<CurrentOrderController>();
    cancelMarkersSubs();
    await _loadBitmapDescriptors();

    initialCameraPosition.value = LatLng(
        _taxiAuthController.currentLocation.latitude!,
        _taxiAuthController.currentLocation.longitude!);

    customMarkers.assignAll(<CustomMarker>[
      // Customer's Marker
      CustomMarker(
          "customer",
          bitmapDescriptors["customerImg"],
          LatLng(controller.currentOrderStreamRx.value?.order.from.latitude,
              controller.currentOrderStreamRx.value?.order.from.longitude),
          fitInBounds: true),

      // Destination Marker
      CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"],
          LatLng(controller.currentOrderStreamRx.value?.order.to.latitude,
              controller.currentOrderStreamRx.value?.order.to.longitude)),

      // Taxi Marker - with subscription
      CustomMarker(
          "taxi",
          bitmapDescriptors["taxiImg"],
          LatLng(_taxiAuthController.currentLocation.latitude!,
              _taxiAuthController.currentLocation.longitude!),
          locationStream: _taxiAuthController.currentLocationRx,
          fitInBounds: true),
    ]);
  }

  // inTransit - state
  Future<void> _loadMarkersForIT() async {
    CurrentOrderController controller = Get.find<CurrentOrderController>();
    cancelMarkersSubs();
    customMarkers.forEach((element) {
      if (element.locationStream != null) element.cancelSubscriptions();
    });
    await _loadBitmapDescriptors();

    initialCameraPosition.value = LatLng(
        _taxiAuthController.currentLocation.latitude!,
        _taxiAuthController.currentLocation.longitude!);
    customMarkers.assignAll(<CustomMarker>[
      // Taxi Marker (Customer in Taxi too ) - with subscription
      new CustomMarker(
          "from",
          bitmapDescriptors["taxiImg"],
          new LatLng(_taxiAuthController.currentLocation.latitude!,
              _taxiAuthController.currentLocation.longitude!),
          locationStream: _taxiAuthController.currentLocationRx,
          fitInBounds: true),

      // Destination Marker
      new CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"],
          LatLng(controller.currentOrderStreamRx.value?.order.to.latitude,
              controller.currentOrderStreamRx.value?.order.to.longitude),
          fitInBounds: true),
    ]);
  }

  Future<void> _loadBitmapDescriptors() async {
    CurrentOrderController controller = Get.find<CurrentOrderController>();

    // customer marker's Image
    if (bitmapDescriptors["customerImg"] == null) {
      // Create the BitmapDescriptor Object for the customer marker using the images's bytes.
      bitmapDescriptors["customerImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await http.get(Uri.parse(controller
                  .currentOrderStreamRx.value?.order.customer['image'])))
              .bodyBytes) as Uint8List),
          60,
          60,
          isBytes: true);
    }
    // taxi marker's Image
    if (bitmapDescriptors["taxiImg"] == null) {
      bitmapDescriptors["taxiImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
              .buffer
              .asUint8List())),
          60,
          60,
          isBytes: true);
    }

    // destination marker's Image
    if (bitmapDescriptors["destinationImg"] == null) {
      bitmapDescriptors["destinationImg"] = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
    }
  }

  void cancelMarkersSubs() => customMarkers.forEach((element) {
        if (element.locationStream != null) element.cancelSubscriptions();
      });
  //===================================================================

  // pop Point!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sideMenuDrawerController.getNewKey(),
      drawer: MezSideMenu(),
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(
          "menu", _sideMenuDrawerController.openMenu),
      body: Obx(() => _taxiAuthController.authorizedTaxi != null
          ? (_taxiAuthController.authorizedTaxi == true
              ? (_taxiAuthController.currentOrderId != null
                  ? GetBuilder<CurrentOrderController>(
                      init: CurrentOrderController(),
                      didUpdateWidget: (_, _ctrl) {
                        this.cancelMarkersSubs();
                        this._loadPolyline();
                        this._handleEvent();
                      },
                      dispose: (_) => cancelMarkersSubs(),
                      builder: (_ctrl) {
                        Get.put<CurrentOrderController>(
                            CurrentOrderController());
                        return _ctrl.currentOrderStreamRx.value != null
                            ? CurrentOrderScreen(polylines, customMarkers,
                                initialCameraPosition.value)
                            : Center(
                                child: MezLogoAnimation(
                                    h: Get.height / 4, w: Get.height / 4),
                              );
                      },
                    )
                  : IncomingOrdersScreen())
              : UnauthorizedScreen())
          : Center(
              child: MezLogoAnimation(h: Get.height / 4, w: Get.height / 4),
            )),
    );
  }
}
