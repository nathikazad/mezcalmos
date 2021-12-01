import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart' as MapHelper;
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/components/taxiDialogs.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/IPositionedFromToBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';

class IncommingOrderScreenView extends GetWidget<IncomingOrdersController>
    with MezDisposable {
  LanguageController lang = Get.find<LanguageController>();
  // when clicking on accept .. etc
  RxBool showLoading = false.obs;
  TaxiAuthController taxiAuthController = Get.find<TaxiAuthController>();

  // map stuff ==================================
  Set<Polyline> polylines = <Polyline>{};
  Map<String, BitmapDescriptor?> bitmapDescriptors = {
    "customerImg": null,
    "destinationImg": null
  };
  Rx<LatLng> initialCameraPosition = LatLng(0, 0).obs;
  RxList<Marker> customMarkers = <Marker>[].obs;
  //==================================

  Future<void> loadPolyLineAndMarkers() async {
    _loadPolyline();
    await _loadMarkers();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.orders.listen((_) async {
        mezDbgPrint("\t\t\t\t STILL LISTENING INCOMMINGORDERVIEW ---- !!!!");
        if (controller.selectedIncommingOrder?.orderId == null &&
            !showLoading.value &&
            Get.currentRoute == kSelectedIcommingOrder) {
          cancelSubscriptions();
          Get.back();
          await mezcalmosDialogOrderNoMoreAvailable(55, Get.height, Get.width);
        }
      }).canceledBy(this, debugId: "selectedOrderViewStream!");
    });

    return Scaffold(
      appBar: taxiAppBar(AppBarLeftButtonType.Menu,
          function: () => cancelSubscriptions()),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            FutureBuilder<void>(
                future: loadPolyLineAndMarkers(),
                builder: (contexto, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return MGoogleMap(
                      markers: customMarkers,
                      initialLocation: initialCameraPosition.value,
                      polylines: polylines,
                      debugString: "IncomingViewScreen",
                      myLocationButtonEnabled: false,
                    );
                  }

                  return MezLogoAnimation(centered: true);
                }),
            IncommingPositionedBottomBar(),
            Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey),
              child: Obx(() => TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(
                          Get.width / 1.05,
                          getSizeRelativeToScreen(20, Get.height, Get.width))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 79, 168, 35)),
                    ),
                    onPressed: !showLoading.value
                        ? () {
                            showLoading.value = true;
                            controller
                                .acceptTaxi(
                                    controller.selectedIncommingOrder!.orderId)
                                .then((serverResponse) {
                              cancelSubscriptions();
                              if (serverResponse.success) {
                                mezDbgPrint("Inside then after accept taxi");
                                // mezcalmosSnackBar("Success", "");
                                showLoading.value = false;
                                Get.offNamedUntil(kCurrentOrderPage,
                                    ModalRoute.withName(kHomeRoute));
                              } else {
                                // in case Taxi User failed accepting the order.
                                Get.back();
                                mezcalmosSnackBar(
                                    "Failed", serverResponse.errorMessage!);
                              }
                            });
                          }
                        : () => null,
                    child: !showLoading.value
                        ? Text(
                            lang.strings['taxi']['taxiView']["acceptOrders"],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : const SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            height: 20,
                            width: 20,
                          ),
                  )),
            ),
            IncomingPositionedFromToTopBar()
          ],
        ),
      ),
    );
  }

  void _loadPolyline() {
    // check if polyline is empty
    if (polylines.isEmpty) {
      polylines.add(Polyline(
        color: Color.fromARGB(255, 172, 89, 252),
        polylineId: PolylineId("polyline"),
        jointType: JointType.round,
        points: MapHelper.loadUpPolyline(
            controller.selectedIncommingOrder?.routeInformation.polyline),
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        // geodesic: true,
      ));
    }
  }

  Future<void> _loadMarkers() async {
    await _loadBitmapDescriptors();

    initialCameraPosition.value = LatLng(
        controller.selectedIncommingOrder?.from.latitude,
        controller.selectedIncommingOrder?.from.longitude);

    customMarkers.assignAll(<Marker>[
      // Customer's Marker
      Marker(
          markerId: MarkerId("customer"),
          icon: bitmapDescriptors["customerImg"]!,
          position: LatLng(controller.selectedIncommingOrder?.from.latitude,
              controller.selectedIncommingOrder?.from.longitude)),

      // Destination Marker
      Marker(
          markerId: MarkerId("destination"),
          icon: bitmapDescriptors["destinationImg"]!,
          position: LatLng(controller.selectedIncommingOrder?.to.latitude,
              controller.selectedIncommingOrder?.to.longitude)),
    ]);
  }

  Future<void> _loadBitmapDescriptors() async {
    // customer marker's Image
    if (bitmapDescriptors["customerImg"] == null) {
      // Create the BitmapDescriptor Object for the customer marker using the images's bytes.
      bitmapDescriptors["customerImg"] = await BitmapDescriptorLoader(
          (await cropRonded((await http.get(
                  Uri.parse(controller.selectedIncommingOrder!.customer.image)))
              .bodyBytes) as Uint8List),
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
