import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/SharedEnums.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/components/CurrentOrderMapScreen/CPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/fbTaxiNotificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  final LanguageController lang = Get.find<LanguageController>();
  final FBNotificationsController fbNotificationsController =
      Get.find<FBTaxiNotificationsController>();

  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  // map stuff ========================================================
  Set<Polyline> polylines = <Polyline>{};
  Map<String, BitmapDescriptor?> bitmapDescriptors = {
    "customerImg": null,
    "taxiImg": null,
    "destinationImg": null
  };
  Rx<LatLng> initialCameraPosition = LatLng(0, 0).obs;
  RxList<Marker> customMarkers = <Marker>[].obs;
  //====================================================================

  Future<void> hotReladCallback() async {
    mezDbgPrint("CurrentOrderScreen :: addPostFrameCallback :: called !");
    mezDbgPrint("StreamBuilder----HasData start map loading!");
    _loadPolyline();
    await _handleEvent();
    mezDbgPrint("StreamBuilder----HasData Ended map loading!");
  }

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        StreamBuilder<CurrentOrder?>(stream:
                controller.currentOrderStreamRx.stream.distinct((prev, next) {
          mezDbgPrint("PREVIOUS ===> $prev");
          mezDbgPrint("NEXTOS ===> $next");
          return (prev?.event == next?.event) || next?.event == null;
        })
            //     .where((event) {
            //   // mezDbgPrint("Stream filter");
            //   // mezDbgPrint(event);
            //   mezDbgPrint(
            //       "Inside CurrentOrder::StreamBuilder::Stream::filter => ${event?.event}");
            //   return (event != null) && (event.event != null);
            // })
            , builder: (_, AsyncSnapshot<CurrentOrder?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            mezDbgPrint(
                "Inside CurrentOrder::StreamBuilder::ConnectionState.waiting");

            return Center(
              child: Container(
                height: 200,
                width: 200,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Transform.scale(scale: .8, child: MezLogoAnimation()),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return const Center(
                child: Icon(
                  Icons.wifi_off_outlined,
                  size: 40,
                ),
              );
            } else if (snapshot.hasData) {
              mezDbgPrint("INSIDE STREAM BUILDER :: HAS DATA !");
              mezDbgPrint(snapshot.data?.event);
              return FutureBuilder<CurrentOrder>(
                  future: loadMapAssets(),
                  builder:
                      (context, AsyncSnapshot<CurrentOrder> futureSnapshot) {
                    if (futureSnapshot.connectionState ==
                        ConnectionState.done) {
                      return MGoogleMap(
                        customMarkers,
                        initialCameraPosition.value,
                        polylines: polylines,
                        idWithSubscription: {
                          "taxi": taxiAuthController.currentLocationRx.stream
                        },
                      );
                    } else {
                      return Center(
                        child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Transform.scale(
                                scale: .8, child: MezLogoAnimation())),
                      );
                    }
                  });
            } else {
              mezDbgPrint(
                  "Inside TaxiWrapper::StreamBuilder::ConnectionState.done|active::EmptyData");
              return const Center(
                child: Icon(
                  Icons.hourglass_empty_sharp,
                  color: Colors.grey,
                  size: 40,
                ),
              );
            }
          } else {
            mezDbgPrint(
                "Else : Inside TaxiWrapper::StreamBuilder::ConnectionState.${snapshot.connectionState}");
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.purpleAccent,
                size: 40,
              ),
            );
          }
        }), // no need for obx here.
        CurrentPositionedBottomBar(),
        CurrentPositionedFromToTopBar()
      ],
    );
  }

  Future<CurrentOrder> loadMapAssets() {
    return controller.getOrder().then((currentOrder) {
      return hotReladCallback().then((_) => currentOrder);
    });
  }
  // Handling Event ------------------------------------------------------------------------------------

  Future<void> _handleEvent() async {
    mezDbgPrint("_handleEvent called !");
    if (controller.currentOrderStreamRx.value?.event != null) {
      mezDbgPrint("_handleEvent -> Event != null check passed ");

      controller.clearEvent();

      if (controller.currentOrderStreamRx.value?.event?.eventType ==
          CurrentOrderEventTypes.OrderStatusChange) {
        mezDbgPrint("_handleEvent -> Event == OrderStatusChange , passed ");

        if (controller.currentOrderStreamRx.value?.order.status ==
                "cancelled" &&
            controller.currentOrderStreamRx.value?.order.cancelledBy ==
                "customer") {
          mezDbgPrint(
              "======> Canceeeeeeeled =======>${controller.currentOrderStreamRx.value?.order.toJson()}");
          await MezcalmosSharedWidgets.mezcalmosDialogOrderCancelled(
              55, Get.height, Get.width);
          // Get.back(closeOverlays: true);
        } else if (controller.currentOrderStreamRx.value?.order.status ==
            "onTheWay") {
          mezDbgPrint("_handleEvent -> calling _loadMarkersForOTW() ");

          await _loadMarkersForOTW();
        } else if (controller.currentOrderStreamRx.value?.order.status ==
            "inTransit") {
          mezDbgPrint("_handleEvent -> calling _loadMarkersForIT() ");

          mezDbgPrint("_handleEvent called 5!");

          await _loadMarkersForIT();
        }
      }
    }
  }

  void _loadPolyline() {
    // check if polyline is empty
    if (polylines.isEmpty) {
      // check if event.order has data
      if (controller.currentEvent != null) {
        mezDbgPrint("_loadPolyline called :: Filling polylines !");

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
        mezDbgPrint(
            "_loadPolyline called :: Filling polylines done Successfully !");
      }
    }
  }

  // onTheWay - state
  Future<void> _loadMarkersForOTW() async {
    mezDbgPrint("_loadMarkersForOTW called !");

    await _loadBitmapDescriptors();

    initialCameraPosition.value = LatLng(
        taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    mezDbgPrint("_loadMarkersForOTW -> Sat initialCameraPosition's value !");
    // cancelMarkersSubs(customMarkers);
    mezDbgPrint("_loadMarkersForOTW -> cancelMarkerSubs() Done !");

    customMarkers.assignAll(<Marker>[
      // Customer's Marker
      Marker(
        markerId: MarkerId("customer"),
        icon: bitmapDescriptors["customerImg"]!,
        position: LatLng(
            controller.currentOrderStreamRx.value?.order.from.latitude,
            controller.currentOrderStreamRx.value?.order.from.longitude),
        // fitInBounds: true
      ),

      // Destination Marker
      Marker(
          markerId: MarkerId("destination"),
          icon: bitmapDescriptors["destinationImg"]!,
          position: LatLng(
              controller.currentOrderStreamRx.value?.order.to.latitude,
              controller.currentOrderStreamRx.value?.order.to.longitude)),

      // Taxi Marker - with subscription
      Marker(
        markerId: MarkerId("taxi"),
        icon: bitmapDescriptors["taxiImg"]!,
        position: LatLng(taxiAuthController.currentLocation.latitude!,
            taxiAuthController.currentLocation.longitude!),
        // locationStream: taxiAuthController.currentLocationRx,
        // onLocationChangeCallback: () => refreshTaxiMarker(controller),
        // fitInBounds: true
      ),
    ]);
    mezDbgPrint(
        "_loadMarkersForOTW -> Markers filling is done -> $customMarkers !");
  }

  // inTransit - state
  Future<void> _loadMarkersForIT() async {
    mezDbgPrint("_loadMarkersForIT called !");

    await _loadBitmapDescriptors();

    initialCameraPosition.value = LatLng(
        taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    mezDbgPrint("_loadMarkersForIT -> Sat initialCameraPosition's value !");
    // cancelMarkersSubs(customMarkers);
    mezDbgPrint("_loadMarkersForIT -> cancelMarkerSubs() Done !");

    customMarkers.assignAll(<Marker>[
      // Taxi Marker (Customer in Taxi too ) - with subscription
      Marker(
        markerId: MarkerId("taxi"),
        icon: bitmapDescriptors["taxiImg"]!,
        position: new LatLng(taxiAuthController.currentLocation.latitude!,
            taxiAuthController.currentLocation.longitude!),
        // locationStream: taxiAuthController.currentLocationRx,
        // onLocationChangeCallback: () => refreshTaxiMarker(controller),
        // fitInBounds: true
      ),

      // Destination Marker
      Marker(
        markerId: MarkerId("destination"),
        icon: bitmapDescriptors["destinationImg"]!,
        position: LatLng(
            controller.currentOrderStreamRx.value?.order.to.latitude,
            controller.currentOrderStreamRx.value?.order.to.longitude),
        // fitInBounds: true
      ),
    ]);
    mezDbgPrint(
        "_loadMarkersForIT -> Markers filling is done -> $customMarkers!");
  }

  Future<void> _loadBitmapDescriptors() async {
    mezDbgPrint("_loadBitmapDescriptors called !");

    // customer marker's Image
    if (bitmapDescriptors["customerImg"] == null) {
      mezDbgPrint("Assigning customerImg ... !!");

      // Create the BitmapDescriptor Object for the customer marker using the images's bytes.
      bitmapDescriptors["customerImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await http.get(Uri.parse(controller
                  .currentOrderStreamRx.value?.order.customer['image'])))
              .bodyBytes) as Uint8List),
          60,
          60,
          isBytes: true);
      mezDbgPrint("Assigned customerImg Successfully !");
    }
    // taxi marker's Image
    if (bitmapDescriptors["taxiImg"] == null) {
      mezDbgPrint("Assigning taxiImg ... !!");

      bitmapDescriptors["taxiImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await rootBundle.load(taxi_driver_marker_asset))
              .buffer
              .asUint8List())),
          60,
          60,
          isBytes: true);
      mezDbgPrint("Assigned taxiImg Successfully !");
    }

    // destination marker's Image
    if (bitmapDescriptors["destinationImg"] == null) {
      mezDbgPrint("Assigning destinationImg ... !!");

      bitmapDescriptors["destinationImg"] = await BitmapDescriptorLoader(
          (await cropRonded(
              (await rootBundle.load(purple_destination_marker_asset))
                  .buffer
                  .asUint8List())),
          60,
          60,
          isBytes: true);
      mezDbgPrint("Assigned destinationImg Successfully !");
    }
  }
}
