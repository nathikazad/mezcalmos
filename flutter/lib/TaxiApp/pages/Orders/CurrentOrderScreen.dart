import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/FBTaxiNorificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentOrderScreen extends GetWidget<CurrentOrderController> {
  final LanguageController lang = Get.find<LanguageController>();
  final FBNotificationsController fbNotificationsController =
      Get.put<FBNotificationsController>(FBTaxiNotificationsController());

  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  // map stuff ==================================
  Set<Polyline> polylines = <Polyline>{};
  Map<String, BitmapDescriptor?> bitmapDescriptors = {
    "customerImg": null,
    "taxiImg": null,
    "destinationImg": null
  };
  LatLng initialCameraPosition = LatLng(0, 0);
  List<CustomMarker> customMarkers = <CustomMarker>[];
  //==================================
  // ------------
  Widget build(BuildContext context) {
    // controller.fillMarkersCallback = fillMarkers;
    Get.put<CurrentOrderController>(CurrentOrderController());

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        StreamBuilder(
            stream: controller.currentOrderStreamRx.stream,
            builder: (_, AsyncSnapshot<CurrentOrder?> snapshot) {
              if (!snapshot.hasData) {
                print("Snapshot Data ::::: ${snapshot.data}");
                return Center(child: CircularProgressIndicator());
              }

              _loadPolyline();
              _handleEvent();
              return MGoogleMap(
                customMarkers,
                initialCameraPosition,
                polylines: polylines,
              );
            }),
        // no need for obx here.
        CurrentPositionedBottomBar(
            controller, taxiAuthController, lang, fbNotificationsController),
        CurrentPositionedFromToTopBar(controller, lang)
      ],
    );
  }

  // Handling Event ------------------------------------------------------------------------------------

  Future<void> _handleEvent() async {
    if (controller.currentEvent != null) {
      if (controller.currentEvent!.eventType ==
          CurrentOrderEventTypes.OrderStatusChange) {
        if (controller.currentOrderStreamRx.value?.order.status ==
                "cancelled" &&
            controller.currentOrderStreamRx.value?.order.cancelledBy ==
                "customer") {
          print(
              "======> Canceeeeeeeled =======>${controller.currentOrderStreamRx.value?.order.toJson()}");
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
    await _loadBitmapDescriptors();

    initialCameraPosition = LatLng(taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    customMarkers.forEach((element) => element.cancelSub());
    customMarkers.assignAll(<CustomMarker>[
      // Customer's Marker
      CustomMarker(
          "customer",
          bitmapDescriptors["customerImg"]!,
          LatLng(controller.currentOrderStreamRx.value?.order.from.latitude,
              controller.currentOrderStreamRx.value?.order.from.longitude)),

      // Destination Marker
      CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"]!,
          LatLng(controller.currentOrderStreamRx.value?.order.to.latitude,
              controller.currentOrderStreamRx.value?.order.to.longitude)),

      // Taxi Marker - with subscription
      CustomMarker(
          "taxi",
          bitmapDescriptors["taxiImg"]!,
          LatLng(taxiAuthController.currentLocation.latitude!,
              taxiAuthController.currentLocation.longitude!),
          locationStream: taxiAuthController.currentLocationRx),
    ]);
  }

  // inTransit - state
  Future<void> _loadMarkersForIT() async {
    await _loadBitmapDescriptors();

    initialCameraPosition = LatLng(taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    customMarkers.assignAll(<CustomMarker>[
      // Taxi Marker (Customer in Taxi too ) - with subscription
      new CustomMarker(
          "from",
          bitmapDescriptors["taxiImg"]!,
          new LatLng(taxiAuthController.currentLocation.latitude!,
              taxiAuthController.currentLocation.longitude!),
          locationStream: taxiAuthController.currentLocationRx),

      // Destination Marker
      new CustomMarker(
          "destination",
          bitmapDescriptors["destinationImg"]!,
          LatLng(controller.currentOrderStreamRx.value?.order.to.latitude,
              controller.currentOrderStreamRx.value?.order.to.longitude)),
    ]);
  }

  Future<void> _loadBitmapDescriptors() async {
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
}
