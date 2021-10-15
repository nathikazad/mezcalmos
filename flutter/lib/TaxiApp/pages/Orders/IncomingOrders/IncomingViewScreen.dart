import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/Extensions.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/components/IncommingOrderMapScreen/IPositionedBottomBar.dart';
import 'package:mezcalmos/TaxiApp/components/IncommingOrderMapScreen/IPositionedFromToBar.dart';
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
  @override
  Widget build(BuildContext context) {
    _loadPolyline();
    _loadMarkers();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      controller.orders.listen((_) async {
        mezDbgPrint("\t\t\t\t STILL LISTENING INCOMMINGORDERVIEW ---- !!!!");
        if (controller.selectedIncommingOrder?.id == null &&
            !showLoading.value &&
            Get.currentRoute == kSelectedIcommingOrder) {
          cancelSubscriptions();
          Get.back();
          await MezcalmosSharedWidgets.mezcalmosDialogOrderNoMoreAvailable(
              55, Get.height, Get.width);
        }
      }).canceledBy(this);
    });

    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() => !showLoading()
                ? MGoogleMap(
                    customMarkers,
                    initialCameraPosition.value,
                    "IncomingViewScreen",
                    polylines: polylines,
                  )
                : Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child:
                          Transform.scale(scale: .8, child: MezLogoAnimation()),
                    ),
                  )),
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
                                    controller.selectedIncommingOrder?.id)
                                .then((isSuccess) {
                              if (isSuccess) {
                                mezDbgPrint("Inside then after accept taxi");
                                cancelSubscriptions();
                                showLoading.value = false;
                                Get.offNamedUntil(kCurrentOrderPage, (route) {
                                  mezDbgPrint(
                                      "Nav Stack Routes ===> ${route.settings.name}");
                                  return route.settings.name ==
                                      kTaxiWrapperRoute;
                                });
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
                        : SizedBox(
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
        points: loadUpPolyline(controller.selectedIncommingOrder),
        width: 2,
        startCap: Cap.buttCap,
        endCap: Cap.roundCap,
        // geodesic: true,
      ));
    }
  }

// onTheWay - state
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
          (await cropRonded((await http.get(Uri.parse(
                  controller.selectedIncommingOrder?.customer['image'])))
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
