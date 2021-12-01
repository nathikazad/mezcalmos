import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/components/taxiDialogs.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/CurrentOrderScreen/CPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  final LanguageController lang = Get.find<LanguageController>();

  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();
  // map stuff ========================================================
  Set<Polyline> polylines = <Polyline>{};
  Map<String, BitmapDescriptor?> bitmapDescriptors = {
    "customerImg": null,
    "taxiImg": null,
    "destinationImg": null
  };
  LatLng initialCameraPosition = LatLng(0, 0);
  List<Marker> customMarkers = <Marker>[];
  //======================================  ==============================

  CurrentOrderScreen() {
    Get.put(CurrentOrderController());
    controller.listenForOrderStatus();
    controller.clearOrderNotifications();
  }

  Future<void> hotReladCallback(TaxiOrder order) async {
    mezDbgPrint("CurrentOrderScreen :: addPostFrameCallback :: called !");
    mezDbgPrint("StreamBuilder----HasData start map loading!");
    _loadPolyline(order);
    await _handleEvent(order);
    mezDbgPrint("StreamBuilder----HasData Ended map loading!");
  }

  Widget build(BuildContext context) {
    // make sure can't be poped, unless we do.

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          appBar: taxiAppBar(AppBarLeftButtonType.Menu),
          body: SafeArea(
            child: StreamBuilder<TaxiOrder>(
                stream: controller.orderStream.distinct((_old, _new) {
              mezDbgPrint(
                  "\n\n\n\n old = ${_old.status} | new ${_new.status} \n\n\n\n");
              return _new == null || _old == _new;
            }), builder: (_, AsyncSnapshot<TaxiOrder> snapshot) {
              mezDbgPrint("\t\t\t\t S N A P S H O T ===> ${snapshot.data}");
              if (snapshot.connectionState == ConnectionState.waiting) {
                mezDbgPrint("INSIDE STREAM BUILDER :: waiting !");

                return MezLogoAnimation(centered: true);
              } else if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError) {
                  mezDbgPrint("INSIDE STREAM BUILDER :: HAS ERR !");

                  return const Center(
                    child: Icon(
                      Icons.wifi_off_outlined,
                      size: 40,
                    ),
                  );
                } else if (snapshot.hasData) {
                  mezDbgPrint("INSIDE STREAM BUILDER :: HAS DATA !");
                  mezDbgPrint(snapshot.data!.toJson());
                  return FutureBuilder<void>(
                      future: hotReladCallback(snapshot.data!),
                      builder: (context, AsyncSnapshot futureSnapshot) {
                        mezDbgPrint(
                            "INSIDE FUTUREBUILDER CURRENT ORDER CONTROLLER > ${controller.isClosed}");
                        if (futureSnapshot.connectionState ==
                            ConnectionState.done) {
                          return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                MGoogleMap(
                                  markers: customMarkers,
                                  initialLocation: initialCameraPosition,
                                  polylines: polylines,
                                  myLocationButtonEnabled: false,
                                  idWithSubscription: {
                                    "taxi": taxiAuthController
                                        .currentLocationRx.stream
                                  },
                                  debugString: "CurrentOrderScreen",
                                ),
                                CurrentPositionedBottomBar(snapshot.data!),
                                CurrentPositionedFromToTopBar(snapshot.data!)
                              ]);
                        } else {
                          return Center(
                            child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
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
            }),
          )),
    ); // no need for obx here.
  }
  // Handling Event ------------------------------------------------------------------------------------

  Future<void> _handleEvent(TaxiOrder order) async {
    mezDbgPrint("_handleEvent called !");
    mezDbgPrint("_handleEvent -> Event == OrderStatusChange , passed ");

    mezDbgPrint("\t\tORDER STATUS CHANGED ${order.toJson()}");
    if (order.status == TaxiOrdersStatus.CancelledByCustomer) {
      mezDbgPrint("======> Canceeeeeeeled =======>${order.toJson()}");

      Future.microtask(() {
        mezDbgPrint("CurrentOrderScreen showing dialog");
        mezcalmosDialogOrderCancelled(55, Get.height, Get.width).then((value) {
          mezDbgPrint(
              "CurrentOrderScreen after cancel navigating to kOrdersListPage");
          Get.offNamedUntil(kOrdersListPage, ModalRoute.withName(kHomeRoute));
          ;
        });
      });
    } else if (order.status == TaxiOrdersStatus.OnTheWay) {
      mezDbgPrint("_handleEvent -> calling _loadMarkersForOTW() ");

      await _loadMarkersForOTW(order);
    } else if (order.status == TaxiOrdersStatus.InTransit) {
      mezDbgPrint("_handleEvent -> calling _loadMarkersForIT() ");

      mezDbgPrint("_handleEvent called 5!");

      await _loadMarkersForIT(order);
    }
  }

  void _loadPolyline(TaxiOrder order) {
    // check if polyline is empty
    if (polylines.isEmpty) {
      // check if event.order has dat

      // load the polyline

      polylines.add(Polyline(
        color: Color.fromARGB(255, 172, 89, 252),
        polylineId: PolylineId("polyline"),
        jointType: JointType.round,
        points: MapHelper.loadUpPolyline(order.routeInformation.polyline),
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        // geodesic: true,
      ));
      mezDbgPrint(
          "_loadPolyline called :: Filling polylines done Successfully !");
    }
  }

  // onTheWay - state
  Future<void> _loadMarkersForOTW(TaxiOrder order) async {
    mezDbgPrint("_loadMarkersForOTW called !");

    await _loadBitmapDescriptors(order);

    initialCameraPosition = LatLng(taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    mezDbgPrint("_loadMarkersForOTW -> Sat initialCameraPosition's value !");
    // cancelMarkersSubs(customMarkers);
    // mezDbgPrint("_loadMarkersForOTW -> cancelMarkerSubs() Done !");

    customMarkers.assignAll(<Marker>[
      // Customer's Marker
      Marker(
        markerId: MarkerId("customer"),
        icon: bitmapDescriptors["customerImg"]!,
        position: LatLng(order.from.latitude, order.from.longitude),
        // fitInBounds: true
      ),

      // Destination Marker
      Marker(
          markerId: MarkerId("destination"),
          icon: bitmapDescriptors["destinationImg"]!,
          position: LatLng(order.to.latitude, order.to.longitude)),

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
  Future<void> _loadMarkersForIT(TaxiOrder order) async {
    mezDbgPrint("_loadMarkersForIT called !");

    await _loadBitmapDescriptors(order);

    initialCameraPosition = LatLng(taxiAuthController.currentLocation.latitude!,
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
        position: LatLng(order.to.latitude, order.to.longitude),
        // fitInBounds: true
      ),
    ]);
    mezDbgPrint(
        "_loadMarkersForIT -> Markers filling is done -> $customMarkers!");
  }

  Future<void> _loadBitmapDescriptors(TaxiOrder order) async {
    mezDbgPrint("_loadBitmapDescriptors called !");

    // customer marker's Image
    if (bitmapDescriptors["customerImg"] == null) {
      mezDbgPrint("Assigning customerImg ... !!");

      // Create the BitmapDescriptor Object for the customer marker using the images's bytes.
      bitmapDescriptors["customerImg"] = await BitmapDescriptorLoader(
          (await cropRonded(
                  (await http.get(Uri.parse(order.customer.image))).bodyBytes)
              as Uint8List),
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
