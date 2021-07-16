import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosGoogleMap.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';

class IncommingOrderScreenView extends GetView<IncomingOrdersController> {
 LanguageController lang =Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back()),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => controller.waitingResponse ||
                  controller.selectedIncommingOrder?.id == null
              ? Center(child: CircularProgressIndicator())
              : new OrderGoogleMap(controller.selectedIncommingOrder!)),
          Positioned(
              bottom: GetStorage().read(getxGmapBottomPaddingKey) + 55,
              child: Container(
                height: getSizeRelativeToScreen(30, Get.height, Get.width),
                width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
                      child: CircleAvatar(
                        child: ClipOval(
                          child: controller.selectedIncommingOrder
                                      ?.customer['image'] ==
                                  null
                              ? Image.asset(aDefaultAvatar)
                              : Image.network(controller
                                  .selectedIncommingOrder?.customer['image']),
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 12,
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
                      bottom: 12,
                      child: Text(
                        "${controller.selectedIncommingOrder?.routeInformation['distance']['text'] ?? '? km'} ${lang.strings['taxi']['incoming']["far"]}",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'psr',
                            color: Colors.grey),
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
                            Text(
                              "${controller.selectedIncommingOrder?.estimatedPrice?.toString() ?? '? km'}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'psb',
                                  color: Colors.black),
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 15,
                        right: 10,
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.alt_route_rounded,
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
                        top: 15,
                        right: 10,
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.timer_rounded,
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
                  fixedSize: MaterialStateProperty.all(Size(
                      getSizeRelativeToScreen(180, Get.height, Get.width),
                      getSizeRelativeToScreen(20, Get.height, Get.width))),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 79, 168, 35)),
                ),
                onPressed: () async => await controller
                    .acceptTaxi(controller.selectedIncommingOrder?.id),
                child: Text(
                  lang.strings['taxi']['taxiView']["acceptOrders"],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          Positioned(
            top: 10,
            child: Container(
              height: getSizeRelativeToScreen(30, Get.height, Get.width),
              width: getSizeRelativeToScreen(180, Get.height, Get.width),
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
                // direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                alignment: Alignment.center,
                children: [
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                        getSizeRelativeToScreen(2.5, Get.height, Get.width)),
                    height: getSizeRelativeToScreen(20, Get.height, Get.width),
                    width: getSizeRelativeToScreen(20, Get.height, Get.width),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromARGB(255, 216, 225, 249),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(0, 7)),
                      ],
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 97, 127, 255),
                        Color.fromARGB(255, 198, 90, 252),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/logoWhite.png'),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 13,
                    child: Text(
                     lang.strings['shared']['inputLocation']["from"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 30,
                    child: GestureDetector(
                      onTap: () => mezcalmosSnackBar(
                          lang.strings['shared']['inputLocation']["from"],
                          controller.selectedIncommingOrder?.from.address ??
                              ""),
                      child: Text(
                        (controller.selectedIncommingOrder?.from.address
                                    .toString()
                                    .substring(0, 13) ??
                                "..........") +
                            " ..", //13+..
                        style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (getSizeRelativeToScreen(180, Get.height, Get.width) /
                            2) +
                        40,
                    top: 13,
                    child: Text(
                      lang.strings['shared']['inputLocation']["to"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: (getSizeRelativeToScreen(180, Get.height, Get.width) /
                            2) +
                        40,
                    top: 30,
                    child: GestureDetector(
                      onTap: () => mezcalmosSnackBar(lang.strings['shared']['inputLocation']["to"],
                          controller.selectedIncommingOrder?.to.address ?? ""),
                      child: Text(
                        (controller.selectedIncommingOrder?.to.address
                                    .toString()
                                    .substring(0, 13) ??
                                "..........") +
                            " ..", //13+..
                        style: TextStyle(fontSize: 16, fontFamily: 'psr'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// Order expired
// Customer canceled the order
// Another driver has picked up the order !
//
