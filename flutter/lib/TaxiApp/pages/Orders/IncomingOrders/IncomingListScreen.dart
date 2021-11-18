import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDraweController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncomingOrdersScreen extends GetView<IncomingOrdersController> {
  LanguageController lang = Get.find<LanguageController>();

  IncomingOrdersScreen() {
    Get.put(IncomingOrdersController());
  }

  @override
  Widget build(BuildContext context) {
    print(
        " width :${MediaQuery.of(context).size.width}  height :${MediaQuery.of(context).size.height} ");
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

    responsiveSize(context);

    final sw = MediaQuery.of(context).size.width.w;
    final sh = MediaQuery.of(context).size.height.h;
    print("$sw");
    // mezDbgPrint("---------------- orders len > ${controller.orders.length}");
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          key: Get.find<SideMenuDraweController>().getNewKey(),
          drawer: MezSideMenu(),
          backgroundColor: Colors.white,
          appBar: taxiAppBar(AppBarLeftButtonType.Menu),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 15.sp,
                    left: getSizeRelativeToScreen(40.w, sw, sh),
                    right: getSizeRelativeToScreen(40.w, sw, sh)),
                child: Container(
                  height: 100.sp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Obx(
                          () => Text(
                            lang.strings['taxi']['incoming']["title"],
                            style: TextStyle(
                                // fontSize: getSizeRelativeToScreen(70, sw, sh),
                                fontSize: 38.5.sp,
                                fontFamily: 'psr'),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Obx(() => Container(
                                // color: Colors.black87,
                                // height: Get.height * 0.33,
                                height: 50.sp,
                                width: 115.sp,
                                child: MezSwitch(
                                  buttonSize: Size(60.sp, 50.sp),
                                  initialPosition: _taxiAuthController
                                          .taxiState?.isLooking ??
                                      false,
                                  values: ['ON', 'OFF'],
                                  onToggleCallback: (v) {
                                    // turn ut ON
                                    if (v == 0) {
                                      _taxiAuthController.turnOn();
                                    } else {
                                      _taxiAuthController.turnOff();
                                    }
                                  },
                                  buttonColor: _taxiAuthController
                                              .taxiState?.isLooking ==
                                          true
                                      ? Colors.green
                                      : Colors.red,
                                  backgroundColor: Colors.transparent,
                                  textColor: const Color(0xFFFFFFFF),
                                ),
                              )))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 25.sp,
                      left: getSizeRelativeToScreen(40, sw, sh),
                      right: getSizeRelativeToScreen(40, sw, sh)),

                  // Removed the Native Glow Effect on list !
                  child: Obx(() => _taxiAuthController.taxiState?.isLooking ==
                          true
                      ? (controller.orders.length > 0
                          // incase there are orders
                          ? MezcalmosSharedWidgets
                              .MezcalmosNoGlowScrollConfiguration(
                              ListView.builder(
                                  itemCount: controller.orders.length,
                                  itemBuilder: (ctx, i) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: GestureDetector(
                                        onTap: () async {
                                          Get.put<IncomingOrdersController>(
                                              IncomingOrdersController());
                                          mezDbgPrint(
                                              "Clicked on order::${controller.orders[i].orderId}");
                                          controller.selectedIncommingOrderKey =
                                              controller.orders[i].orderId;
                                          Get.toNamed(kSelectedIcommingOrder);
                                        },
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 236, 236, 236),
                                                  width: 0.5,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              top: 5,
                                              bottom: 5,
                                              right: 5),
                                          // alignment: Alignment.centerLeft,
                                          child: Stack(
                                            clipBehavior: Clip.antiAlias,
                                            // alignment: Alignment.centerLeft,
                                            children: [
                                              Positioned(
                                                // bottom: 0,
                                                // left: Get.width - 150,
                                                right: 10,
                                                top: 5,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  // direction: Axis.horizontal,
                                                  children: [
                                                    Transform.scale(
                                                        scale: 1.8,
                                                        child: Container(
                                                          height: 10,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                            image: AssetImage(
                                                                money_asset),
                                                          )),
                                                        )),
                                                    Text(
                                                      controller.orders[i]
                                                          .estimatedPrice
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily: 'psb',
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                top: 10,
                                                child: CircleAvatar(
                                                  // maxRadius: getSizeRelativeToScreen(56, sw, sh),
                                                  // minRadius: getSizeRelativeToScreen(55, sw, sh),
                                                  backgroundColor: Colors.grey,
                                                  backgroundImage: NetworkImage(
                                                      controller.orders[i]
                                                          .customer.image),
                                                  onBackgroundImageError:
                                                      (e, s) => mezDbgPrint(
                                                          "Failed loading Customer openOrder::id::${controller.orders[i].orderId}"),
                                                ),
                                              ),

                                              Positioned(
                                                  left: 50,
                                                  top: 10,
                                                  child: Text(
                                                    controller.orders[i]
                                                        .customer.name,
                                                    style: TextStyle(
                                                        fontFamily: 'psb',
                                                        fontSize: 16),
                                                  )),

                                              // info line

                                              Positioned(
                                                left: 50,
                                                bottom: 5,
                                                child: Wrap(
                                                  spacing:
                                                      1.0, // gap between adjacent chips
                                                  runSpacing:
                                                      4.0, // gap between lines
                                                  children: <Widget>[
                                                    emptyOrWidgetSmallPhones(
                                                        child: Icon(
                                                            MezcalmosIcons
                                                                .map_marker,
                                                            size:
                                                                getSizeRelativeToScreen(
                                                                        32,
                                                                        sw,
                                                                        sh)
                                                                    .w)),
                                                    emptyOrWidgetSmallPhones(
                                                        child: Text(
                                                      controller.orders[i].from
                                                              .address
                                                              .substring(0, 5) +
                                                          "... ",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontFamily: 'psr',
                                                          fontSize: 14.sp),
                                                    )),
                                                    Icon(MezcalmosIcons.map_pin,
                                                        size:
                                                            getSizeRelativeToScreen(
                                                                    32, sw, sh)
                                                                .w),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      controller.orders[i]
                                                              .distanceToClient
                                                              .toStringAsFixed(
                                                                  1) +
                                                          " km",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontFamily: 'psr',
                                                          fontSize: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(MezcalmosIcons.route,
                                                        size:
                                                            getSizeRelativeToScreen(
                                                                    32, sw, sh)
                                                                .w),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Text(
                                                      controller.orders[i]
                                                                  .routeInformation[
                                                              'distance']['text'] ??
                                                          "? km",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontFamily: 'psr',
                                                          fontSize: 14.sp),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                        MezcalmosIcons
                                                            .stopwatch,
                                                        size:
                                                            getSizeRelativeToScreen(
                                                                    32, sw, sh)
                                                                .w),
                                                    SizedBox(width: 2.w),
                                                    Text(
                                                      hoursMinsShortner(controller
                                                                      .orders[i]
                                                                      .routeInformation[
                                                                  'duration']
                                                              ['text']) ??
                                                          "0.0 mins",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontFamily: 'psr',
                                                          fontSize: 14.sp),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          // in case no order found
                          : Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                noOrdersFound_asset))),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Expanded(
                                  child: Flex(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                          lang.strings['taxi']['incoming']
                                              ["noOrdersTitle"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25.5.sp,
                                              fontFamily: 'psr'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Obx(
                                        () => Text(
                                          lang.strings['taxi']['incoming']
                                              ["noOrdersDesc"],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontFamily: 'psr',
                                              color: Color.fromARGB(
                                                  255, 168, 168, 168)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )))
                      // in case turned off
                      : Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(turnOn_asset))),
                              ),
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Expanded(
                              child: Flex(
                                direction: Axis.vertical,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => Text(
                                      lang.strings['taxi']['incoming']
                                          ["toggleTitle"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25.5.sp, fontFamily: 'psr'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Obx(
                                    () => Text(
                                      lang.strings['taxi']['incoming']
                                          ["toggleDesc"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'psr',
                                          color: Color.fromARGB(
                                              255, 168, 168, 168)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
                ),
              )
            ],
          )),
    );
  }
}
