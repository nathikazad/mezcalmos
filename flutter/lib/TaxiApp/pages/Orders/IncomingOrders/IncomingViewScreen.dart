import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/MGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';

class IncommingOrderScreenView extends GetView<IncomingOrdersController> {
  LanguageController lang = Get.find<LanguageController>();
  // when clicking on accept .. etc
  RxBool showLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() =>
                // controller.waitingResponse ||
                showLoading.value ||
                        controller.selectedIncommingOrder?.id == null ||
                        controller.customMarkers.isEmpty ||
                        controller.polylines.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : MGoogleMap(
                        controller.customMarkers,
                        controller.initialCameraLocation,
                        controller.boundsSource!,
                        controller.boundsDestination!,
                        polylines: controller.polylines)),
            Positioned(
                bottom: GetStorage().read(getxGmapBottomPaddingKey) + 55,
                child: Container(
                  height: getSizeRelativeToScreen(30, Get.height, Get.width),
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
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                          left: 10,
                          child: SizedBox(
                            // height: getSizeRelativeToScreen(300, sw, sh),
                            // width: double.infinity,
                            child: CircleAvatar(
                              // radius: 30.0,
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: controller.selectedIncommingOrder
                                            ?.customer['image'] ==
                                        null
                                    ? Image.asset(
                                        aDefaultAvatar,
                                        width: getSizeRelativeToScreen(
                                            100, context.height, context.width),
                                        height: getSizeRelativeToScreen(
                                            100, context.height, context.width),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        controller.selectedIncommingOrder
                                                ?.customer['image'] +
                                            "?type=large",
                                        fit: BoxFit.cover,
                                        height: getSizeRelativeToScreen(
                                            100, context.height, context.width),
                                        width: getSizeRelativeToScreen(
                                            100, context.height, context.width),
                                      ),
                              ),
                              backgroundColor: Colors.grey
                                  .shade100, //Color.fromARGB(255, 222, 222, 222),
                              // radius: 1,
                            ),
                          )
                          // child: CircleAvatar(
                          //   child: ClipOval(
                          //     child: controller.selectedIncommingOrder
                          //                 ?.customer['image'] ==
                          //             null
                          //         ? Image.asset(aDefaultAvatar)
                          //         : Image.network(controller
                          //             .selectedIncommingOrder?.customer['image']),
                          //   ),
                          //   backgroundColor: Colors.grey.shade200,
                          // ),
                          ),
                      Positioned(
                        left: 60,
                        top: getSizeRelativeToScreen(5, Get.height, Get.width),
                        child: Text(
                          controller.selectedIncommingOrder?.customer['name'] ??
                              "Customer",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'psb',
                          ),
                        ),
                      ),
                      Positioned(
                        left: 60,
                        bottom:
                            getSizeRelativeToScreen(5, Get.height, Get.width),
                        child: Obx(
                          () => Text(
                            "${controller.selectedIncommingOrder?.distanceToClient.toStringAsFixed(1) ?? '? '} km ${lang.strings['taxi']['incoming']["far"]}",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'psr',
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          top: 10,
                          right: getSizeRelativeToScreen(
                                  180, Get.height, Get.width) /
                              3.5,
                          child: VerticalDivider(
                            width: 0.5,
                            color: Color.fromARGB(255, 236, 236, 236),
                            thickness: 1,
                          )),
                      Positioned(
                          bottom: 10,
                          top: 10,
                          right: getSizeRelativeToScreen(
                                  180, Get.height, Get.width) /
                              1.9,
                          child: VerticalDivider(
                            width: 0.5,
                            color: Color.fromARGB(255, 236, 236, 236),
                            thickness: 1,
                          )),
                      Positioned(
                          right: getSizeRelativeToScreen(
                                  180, Get.height, Get.width) /
                              3.2,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 0,
                            runSpacing: 0,
                            direction: Axis.horizontal,
                            children: [
                              Transform.scale(
                                  scale: 2,
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(money_asset),
                                    )),
                                  )),
                              Obx(
                                () => Text(
                                  "${controller.selectedIncommingOrder?.estimatedPrice?.toString() ?? '? \$'}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'psb',
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          bottom: getSizeRelativeToScreen(
                              5.5, Get.height, Get.width),
                          right: 10,
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              Icon(
                                MezcalmosIcons.route,
                                size: 16,
                              ),
                              Text(
                                "${controller.selectedIncommingOrder?.routeInformation['distance']['text'] ?? '? km'}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'psr',
                                    color: Colors.black),
                              ),
                            ],
                          )),
                      Positioned(
                          top: getSizeRelativeToScreen(
                              5.5, Get.height, Get.width),
                          right: 10,
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.spaceBetween,
                            spacing: 4,
                            children: [
                              Icon(
                                MezcalmosIcons.stopwatch,
                                size: 16,
                              ),
                              Text(
                                "${controller.selectedIncommingOrder?.routeInformation['duration']['text'] ?? '? mins'}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'psr',
                                    color: Colors.black),
                              ),
                            ],
                          )),
                    ],
                  ),
                )),
            Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey),
              child: TextButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
                      getSizeRelativeToScreen(20, Get.height, Get.width))),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 79, 168, 35)),
                ),
                onPressed: () {
                  showLoading.value = true;
                  controller
                      .acceptTaxi(controller.selectedIncommingOrder?.id)
                      .then((_) => Get.back())
                      .whenComplete(() => showLoading.value = true);
                },
                child: Text(
                  lang.strings['taxi']['taxiView']["acceptOrders"],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: Container(
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
                  clipBehavior: Clip.hardEdge,
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 12, bottom: 12, right: 8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                      lang.strings['shared']['inputLocation']
                                          ["from"],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () => mezcalmosSnackBar(
                                          lang.strings['shared']
                                              ['inputLocation']["from"],
                                          controller.selectedIncommingOrder
                                                  ?.from?.address ??
                                              ""),
                                      child: Text(
                                        controller.selectedIncommingOrder?.from
                                                    ?.address
                                                    ?.toString()
                                                    .length ==
                                                null
                                            ? "........."
                                            : controller.selectedIncommingOrder!
                                                        .from!.address!
                                                        .toString()
                                                        .length >
                                                    13
                                                ? (controller
                                                            .selectedIncommingOrder
                                                            ?.from
                                                            ?.address
                                                            .toString()
                                                            .substring(0, 13) ??
                                                        "..........") +
                                                    " .."
                                                : controller
                                                    .selectedIncommingOrder
                                                    ?.from
                                                    ?.address, //13+..
                                        style: TextStyle(
                                            fontSize: 16, fontFamily: 'psr'),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ]))),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
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
                                        color:
                                            Color.fromARGB(255, 216, 225, 249),
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
                                  child: Image.asset(
                                      'assets/images/logoWhite.png'),
                                ),
                              ),
                            ])),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 12, bottom: 12, right: 8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                      lang.strings['shared']['inputLocation']
                                          ["to"],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => GestureDetector(
                                      onTap: () => mezcalmosSnackBar(
                                          lang.strings['shared']
                                              ['inputLocation']["to"],
                                          controller.selectedIncommingOrder?.to
                                                  ?.address ??
                                              ""),
                                      child: Text(
                                        controller.selectedIncommingOrder?.to
                                                    ?.address
                                                    ?.toString()
                                                    .length ==
                                                null
                                            ? "........."
                                            : controller.selectedIncommingOrder!
                                                        .to!.address!
                                                        .toString()
                                                        .length >
                                                    13
                                                ? (controller
                                                            .selectedIncommingOrder
                                                            ?.to
                                                            ?.address
                                                            .toString()
                                                            .substring(0, 13) ??
                                                        "..........") +
                                                    " .."
                                                : controller
                                                    .selectedIncommingOrder
                                                    ?.to
                                                    ?.address, //13+..
                                        style: TextStyle(
                                            fontSize: 16, fontFamily: 'psr'),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ]))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// Order expired
// Customer canceled the order
// Another driver has picked up the order !
//
