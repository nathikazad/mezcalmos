import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/constants/routes.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/notificationsController.dart';
import 'package:mezcalmos/Shared/helpers/MapHelper.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/FBTaxiNorificationsController.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';
import 'package:mezcalmos/TaxiApp/pages/MTaxiGMapWraper.dart';

// import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController>
    with MTaxiGMapWrapper {
  List<CustomMarker> sub_markers = <CustomMarker>[];

  // overriding this to get the CustomerPicture
  // so when we call loadBitmapsUp , it will call this implemented userMarkerPicture(), and only happens if it's not loaded up yet.
  @override
  Future<BitmapDescriptor> userMarkerPicture() async {
    print("+ the implemented userMarkerPicture() got executed !");
    // print("========= ${GetStorage().read('custBitmap')} -=========");

    // return Future.value(GetStorage().read('custBitmap') as BitmapDescriptor);

    return await BitmapDescriptorLoader(
        (await cropRonded(
            (await http.get(Uri.parse(controller.value?.customer['image'])))
                .bodyBytes) as Uint8List),
        60,
        60,
        isBytes: true);
  }

  @override
  Future<bool> fillMarkers({String? orderStatus}) async {
    print(
        "+ the implemented fillMarkers() got executed with params => {orderStatus : $orderStatus} !");

    markers.clear();
    if (polylines.length == 0) setPolylines(loadUpPolyline(controller.value!));
    if (orderStatus == "onTheWay") {
      // 3 markers
      await loadBitmapsUp(); // happens only one
      markers = <CustomMarker>[
        new CustomMarker(
            "taxi",
            LatLng(taxiAuthController.currentLocation.latitude!,
                taxiAuthController.currentLocation.longitude!),
            taxiDescriptor!),
        new CustomMarker(
            "from",
            LatLng(controller.value?.from.latitude,
                controller.value?.from.longitude),
            taxiDescriptor!),
        new CustomMarker(
            "to",
            LatLng(
                controller.value?.to.latitude, controller.value?.to.longitude),
            toDescriptor!),
      ];
    } else if (orderStatus == "inTransit") {
      await loadBitmapsUp();

      markers = <CustomMarker>[
        new CustomMarker(
            "taxi",
            LatLng(taxiAuthController.currentLocation.latitude!,
                taxiAuthController.currentLocation.longitude!),
            taxiDescriptor!),
        new CustomMarker(
            "to",
            LatLng(
                controller.value?.to.latitude, controller.value?.to.longitude),
            toDescriptor!),
      ];
    }

    super.initialCameraLocation = LatLng(
        taxiAuthController.currentLocation.latitude!,
        taxiAuthController.currentLocation.longitude!);
    // depends on markers.
    print(
        "\n\n= = =Before= = =  ${controller.latLngBounds.value} == = = = = =\n\n");
    super.setBounds(createBounds());
    controller.latLngBounds.value = latLngBounds;
    sub_markers = markers;
    print(
        "\n\n= = =After= = =  ${controller.latLngBounds.value} == = = = = =\n\n");

    // print(mapReady.value);
    // print(polylines);
    // print(initialCameraLocation);
    // print(markers);
    // print(latLngBounds);
    return Future.value(true);
  }

  final LanguageController lang = Get.find<LanguageController>();
  final FBNotificationsController fbNotificationsController =
      Get.put<FBNotificationsController>(FBTaxiNotificationsController());
  // TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();
  RxBool showLoading = false.obs;
  RxBool clickedLaunchOnMap = false.obs;
  bool clickedYesCancelPopUp = false;

  Widget build(BuildContext context) {
    Get.put<CurrentOrderController>(CurrentOrderController());
    controller.fillMarkersCallback = fillMarkers;
    controller.dispatchCurrentOrder();

    // this.fillMarkers().then((_) => latLngBounds.value = createBounds());

    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() {
            if (controller.latLngBounds.value != null) {
              print("-----------> $markers .");
              print("-----------> $sub_markers .");

              return MGoogleMap(sub_markers, initialCameraLocation,
                  controller.latLngBounds.value!,
                  polylines: this.polylines);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: getSizeRelativeToScreen(25, Get.height, Get.width),
                // width: getSizeRelativeToScreen(180, Get.height, Get.width),
                width: Get.width / 1.05,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromARGB(255, 216, 225, 249),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 7)),
                    ]),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: Container(
                        child: Obx(() => TextButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(Size(
                                    getSizeRelativeToScreen(
                                        115, Get.height, Get.width),
                                    getSizeRelativeToScreen(
                                        12, Get.height, Get.width))),
                                backgroundColor:
                                    controller.value?.status != "inTransit"
                                        ? MaterialStateProperty.all(
                                            Color.fromARGB(255, 79, 168, 35))
                                        : MaterialStateProperty.all(
                                            Color.fromARGB(255, 234, 51, 38)),
                              ),
                              onPressed: () async {
                                showLoading.value = true;

                                print(
                                    "%%%%%%%%%%%%\n controller.value!.distanceToClient :: ${controller.distanceToClient}\n%%%%%%%%%%%%");
                                print(
                                    "%%%%%%%%%%%%\n controller.distanceFromFinish :: ${controller.distanceToFinish}\n%%%%%%%%%%%%");
                                controller.value?.status == "inTransit"
                                    // ignore: unnecessary_statements
                                    ? (controller.distanceToFinish > 0.5
                                        ? MezcalmosSharedWidgets
                                                .yesNoDefaultConfirmationDialog(
                                                    () async {
                                            Get.back();
                                            await controller.finishRide();
                                          },
                                                    lang.strings['taxi']
                                                            ['taxiView'][
                                                        "tooFarFromfinishRide"])
                                            .then((_) {
                                            //Get.offAllNamed(kTaxiWrapperRoute);
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            Get.back(closeOverlays: true);
                                          })
                                        : await controller.finishRide())
                                    // ignore: unnecessary_statements
                                    : (controller.distanceToClient > 0.5
                                        ? MezcalmosSharedWidgets
                                                .yesNoDefaultConfirmationDialog(
                                                    () async {
                                            Get.back();
                                            await controller.startRide();
                                          },
                                                    lang.strings['taxi']
                                                            ['taxiView']
                                                        ["tooFarFromstartRide"])
                                            .then((_) {
                                            // _mezcalmosCurrentOrderGoogleMapController
                                            //     .googleMapUpdate();
                                            //Get.back(closeOverlays: true);
                                          }).whenComplete(
                                                () => showLoading.value = false)
                                        : await controller
                                            .startRide()
                                            .whenComplete(() =>
                                                showLoading.value = false));
                              },
                              child: Center(
                                child: Text(
                                  controller.value?.status != "inTransit"
                                      ? lang.strings['taxi']['taxiView']
                                          ["startRide"]
                                      : lang.strings['taxi']['taxiView']
                                          ["finishRide"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'psr'),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                        child: SizedBox(
                      height:
                          getSizeRelativeToScreen(15, Get.height, Get.width),
                      child: VerticalDivider(
                          // width: Get.width / 20,
                          ),
                    )),
                    Flexible(
                        flex: 2,
                        child: Obx(
                          () => Text(
                              '\$' +
                                  (controller.value?.estimatedPrice
                                          ?.toString() ??
                                      "00"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        )),
                    Flexible(
                        child: SizedBox(
                      height:
                          getSizeRelativeToScreen(15, Get.height, Get.width),
                      child: VerticalDivider(
                          // width: Get.width / 20,
                          ),
                    )),
                    Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Row(
                          // direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          // runAlignment: WrapAlignment.end,
                          // alignment: WrapAlignment.end,
                          // spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: clickedLaunchOnMap.value
                                  ? null
                                  : () async {
                                      clickedLaunchOnMap.value = true;
                                      await mapLauncher(
                                          controller.value!.to.latitude,
                                          controller.value!.to.longitude);
                                      clickedLaunchOnMap.value = false;
                                    },
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 232, 239, 254),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 216, 225, 249),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Obx(
                                    () => clickedLaunchOnMap.value
                                        ? SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: CircularProgressIndicator(
                                              color: Colors.purple.shade400,
                                            ))
                                        : Icon(
                                            MezcalmosIcons.location_arrow,
                                            color: Color.fromARGB(
                                                255, 103, 121, 254),
                                            size: 16,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            GestureDetector(
                              onTap: () async {
                                await fbNotificationsController
                                    .setAllMessagesAsReadInDb();

                                Get.toNamed(kMessagesRoute)?.then((_) =>
                                    fbNotificationsController
                                        .clearAllMessageNotification());
                              },
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 232, 239, 254),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 216, 225, 249),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 2))
                                  ],
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Obx(
                                        () => fbNotificationsController
                                                .hasNewNotification
                                            ? Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Container(
                                                  height: 6,
                                                  width: 6,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      shape: BoxShape.circle),
                                                ))
                                            : SizedBox(),
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.mail,
                                          color: Color.fromARGB(
                                              255, 103, 121, 254),
                                          size: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),

                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            GestureDetector(
                              onTap: () async => await showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      title: Text(lang.strings?['taxi']
                                                  ?['cancelOrder']
                                              ?['confirmation_header'] ??
                                          "Por favor confirmar"),
                                      content: Text(lang.strings?['taxi']
                                                  ?['cancelOrder']
                                              ?['confirmation_text'] ??
                                          "¿Cancelar el viaje actual?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (!clickedYesCancelPopUp) {
                                                showLoading.value = true;
                                                controller
                                                    .cancelTaxi(null)
                                                    .then((_) => Get.back(
                                                        closeOverlays: true))
                                                    .catchError((onError) {
                                                  clickedYesCancelPopUp = false;
                                                }).whenComplete(() =>
                                                        showLoading.value =
                                                            false);
                                              }
                                            },
                                            // Navigator.of(context)
                                            //     .pop()),
                                            child: Text(lang.strings?['taxi']
                                                    ?['taxiView']?['yes'] ??
                                                'Si')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(lang.strings?['taxi']
                                                    ?['taxiView']?['no'] ??
                                                'No'))
                                      ],
                                    );
                                  }),
                              child: Container(
                                height: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                width: getSizeRelativeToScreen(
                                    16, Get.height, Get.width),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 247, 177, 179),
                                  borderRadius: BorderRadius.circular(4),
                                  // boxShadow: <BoxShadow>[BoxShadow(color: Color.fromARGB(255, 216, 225, 249), spreadRadius: 0, blurRadius: 1, offset: Offset(0, 5))],
                                ),
                                child: Center(
                                  child: Icon(
                                    MezcalmosIcons.times_circle,
                                    color: Color.fromARGB(255, 255, 0, 8),
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )),
          Positioned(
            top: 10,
            child: Container(
              // height: 65,
              width: Get.width / 1.05,
              // width: getSizeRelativeToScreen(180, Get.height, Get.width),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color.fromARGB(255, 216, 225, 249),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 7)),
                  ]),

              child: Flex(
                clipBehavior: Clip.hardEdge,
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    // fit: FlexFit.tight,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(
                                    lang.strings['shared']['inputLocation']
                                        ["from"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Obx(
                                () => GestureDetector(
                                  onTap: () => mezcalmosSnackBar(
                                      lang.strings['shared']['inputLocation']
                                          ["from"],
                                      controller.value?.from?.address ?? ""),
                                  child: Text(
                                    controller.value?.from?.address
                                                ?.toString()
                                                .length ==
                                            null
                                        ? "........."
                                        : controller.value!.from!.address!
                                                    .toString()
                                                    .length >
                                                13
                                            ? (controller.value?.from?.address
                                                        .toString()
                                                        .substring(0, 13) ??
                                                    "..........") +
                                                " .."
                                            : controller.value!.from!.address
                                                .toString(),
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'psr'),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      // fit: FlexFit.tight,
                      child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.passthrough,
                          children: [
                            VerticalDivider(
                              color: Color.fromARGB(255, 236, 236, 236),
                              thickness: 1,
                            ),
                            Container(
                              padding: EdgeInsets.all(getSizeRelativeToScreen(
                                  2.5, Get.height, Get.width)),
                              height: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
                              width: getSizeRelativeToScreen(
                                  17, Get.height, Get.width),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromARGB(255, 216, 225, 249),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: Offset(0, 7)),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 97, 127, 255),
                                      Color.fromARGB(255, 198, 90, 252),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Center(
                                child:
                                    Image.asset('assets/images/logoWhite.png'),
                              ),
                            ),
                          ])),
                  Expanded(
                    flex: 2,
                    // fit: FlexFit.tight,
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 0, top: 12, bottom: 12, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                lang.strings['shared']['inputLocation']["to"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () => mezcalmosSnackBar(
                                    lang.strings['shared']['inputLocation']
                                        ["to"],
                                    controller.value?.to?.address ?? ""),
                                child: Text(
                                  controller.value?.to?.address
                                              ?.toString()
                                              .length ==
                                          null
                                      ? "........."
                                      : controller.value!.to!.address!
                                                  .toString()
                                                  .length >
                                              13
                                          ? (controller.value?.to?.address
                                                      .toString()
                                                      .substring(0, 13) ??
                                                  "..........") +
                                              " .."
                                          : controller
                                              .value?.to?.address, //13+..
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'psr'),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
