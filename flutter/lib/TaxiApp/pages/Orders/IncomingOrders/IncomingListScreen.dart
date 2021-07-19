import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class IncomingOrdersScreen extends GetView<IncomingOrdersController> {
  LanguageController lang = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    // print("---------------- orders len > ${controller.orders.length}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: getSizeRelativeToScreen(40, sw, sh),
              right: getSizeRelativeToScreen(40, sw, sh)),
          child: Container(
            height: getSizeRelativeToScreen(300, sw, sh),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Transform.scale(
                    scale: 1.15,
                    child: Obx(
                      () => Text(
                        lang.strings['taxi']['incoming']["title"],
                        style: TextStyle(
                            // fontSize: getSizeRelativeToScreen(70, sw, sh),
                            fontSize: 38.5,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'psr'),
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: Obx(() => MezcalmosSwitch(
                          initialPosition: _taxiAuthController.isLooking,
                          values: ['ON', 'OFF'],
                          onToggleCallback: (v) {
                            // turn ut ON
                            if (v == 0) {
                              _taxiAuthController.turnOn();
                            } else {
                              _taxiAuthController.turnOff();
                            }
                          },
                          buttonColor: _taxiAuthController.isLooking == true
                              ? Colors.green
                              : Colors.red,
                          backgroundColor: Colors.transparent,
                          textColor: const Color(0xFFFFFFFF),
                        )))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                left: getSizeRelativeToScreen(40, sw, sh),
                right: getSizeRelativeToScreen(40, sw, sh)),

            // Removed the Native Glow Effect on list !
            child: Obx(() => _taxiAuthController.isLooking == true
                ? (controller.orders.length > 0
                    // incase there are orders
                    ? MezcalmosSharedWidgets.MezcalmosNoGlowScrollConfiguration(
                        ListView.builder(
                            itemCount: controller.orders.length,
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: GestureDetector(
                                  onTap: () async {
                                    print(
                                        "Clicked on order::${controller.orders[i].id}");
                                    controller.selectedIncommingOrder =
                                        controller.orders[i];
                                    Get.toNamed(kSelectedIcommingOrder);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 236, 236, 236),
                                            width: 0.5,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.all(16),
                                    // alignment: Alignment.centerLeft,
                                    child: Stack(
                                      clipBehavior: Clip.antiAlias,
                                      // alignment: Alignment.centerLeft,
                                      children: [
                                        Positioned(
                                          // bottom: 0,
                                          // left: Get.width - 150,
                                          right: 0,
                                          top: 0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // direction: Axis.horizontal,
                                            children: [
                                              Transform.scale(
                                                  scale: 1.8,
                                                  child: Container(
                                                    height: 10,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          money_asset),
                                                    )),
                                                  )),
                                              Text(
                                                controller
                                                    .orders[i].estimatedPrice
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'psb',
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          // maxRadius: getSizeRelativeToScreen(56, sw, sh),
                                          // minRadius: getSizeRelativeToScreen(55, sw, sh),
                                          backgroundColor: Colors.grey,
                                          backgroundImage: NetworkImage(
                                              controller
                                                  .orders[i].customer['image']),
                                          onBackgroundImageError: (e, s) => print(
                                              "Failed loading Customer openOrder::id::${controller.orders[i].id}"),
                                        ),
                                        // Positioned(
                                        //     child: Container(
                                        //   height: 38.5,
                                        //   width: 38.5,
                                        //   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                        // )),
                                        Positioned(
                                            left: 50,
                                            top: 0,
                                            child: Text(
                                              controller.orders[i]
                                                      .customer['name'] ??
                                                  tDefaultCustomerName,
                                              style: TextStyle(
                                                  fontFamily: 'psb',
                                                  fontSize: 16),
                                            )),

                                        // info line
                                        Positioned(
                                          left: 50,
                                          bottom: 0,
                                          child: Wrap(
                                            spacing:
                                                1.0, // gap between adjacent chips
                                            runSpacing:
                                                4.0, // gap between lines
                                            children: <Widget>[
                                              Icon(Icons.location_on_outlined,
                                                  size: getSizeRelativeToScreen(
                                                      32, sw, sh)),
                                              Text(
                                                controller
                                                        .orders[i].from.address
                                                        .substring(0, 10) +
                                                    "... ",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontFamily: 'psr',
                                                    fontSize: 14),
                                              ),
                                              Icon(Icons.my_location_rounded,
                                                  size: getSizeRelativeToScreen(
                                                      32, sw, sh)),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                controller.orders[i]
                                                            .routeInformation[
                                                        'distance']['text'] ??
                                                    "? km",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontFamily: 'psr',
                                                    fontSize: 14),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(Icons.social_distance,
                                                  size: getSizeRelativeToScreen(
                                                      32, sw, sh)),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                controller.orders[i]
                                                            .routeInformation[
                                                        'distance']['text'] ??
                                                    "? km",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontFamily: 'psr',
                                                    fontSize: 14),
                                              ),
                                              Icon(Icons.timer,
                                                  size: getSizeRelativeToScreen(
                                                      32, sw, sh)),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                controller.orders[i]
                                                            .routeInformation[
                                                        'duration']['text'] ??
                                                    "? mins",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontFamily: 'psr',
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        )
                                        // Positioned(
                                        //     left: 50,
                                        //     bottom: 0,
                                        //     child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                        // Icon(Icons.location_on_outlined, size: getSizeRelativeToScreen(32, sw, sh)),
                                        // Text(
                                        //   controller.orders[i].from['address'].toString().substring(0, 10) + "... ",
                                        //   overflow: TextOverflow.ellipsis,
                                        //   maxLines: 1,
                                        //   softWrap: false,
                                        //   style: TextStyle(fontFamily: 'psr', fontSize: 14),
                                        // ),
                                        // Icon(Icons.my_location_rounded, size: getSizeRelativeToScreen(32, sw, sh)),
                                        // SizedBox(
                                        //   width: 2,
                                        // ),
                                        // Text(
                                        //   controller.orders[i].routeInformation['distance']['text'] ?? "? km",
                                        //   overflow: TextOverflow.ellipsis,
                                        //   maxLines: 1,
                                        //   softWrap: false,
                                        //   style: TextStyle(fontFamily: 'psr', fontSize: 14),
                                        // ),
                                        // SizedBox(
                                        //   width: 5,
                                        // ),
                                        // Icon(Icons.social_distance, size: getSizeRelativeToScreen(32, sw, sh)),
                                        // SizedBox(
                                        //   width: 2,
                                        // ),
                                        // Text(
                                        //   controller.orders[i].routeInformation['distance']['text'] ?? "? km",
                                        //   overflow: TextOverflow.ellipsis,
                                        //   maxLines: 1,
                                        //   softWrap: false,
                                        //   style: TextStyle(fontFamily: 'psr', fontSize: 14),
                                        // ),
                                        // Icon(Icons.timer, size: getSizeRelativeToScreen(32, sw, sh)),
                                        // SizedBox(
                                        //   width: 2,
                                        // ),
                                        // Text(
                                        //   controller.orders[i].routeInformation['duration']['text'] ?? "? mins",
                                        //   overflow: TextOverflow.ellipsis,
                                        //   maxLines: 1,
                                        //   softWrap: false,
                                        //   style: TextStyle(fontFamily: 'psr', fontSize: 14),
                                        // ),
                                        //     ])),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(noOrdersFound_asset))),
                            ),
                          ),
                          Expanded(
                            child: Flex(
                              direction: Axis.vertical,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Obx(
                                    () => Text(
                                      lang.strings['taxi']['incoming']
                                          ["noOrdersTitle"],
                                      style: TextStyle(
                                          fontSize: 38.5, fontFamily: 'psr'),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Obx(
                                    () => Text(
                                      lang.strings['taxi']['incoming']
                                          ["noOrdersDesc"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'psr',
                                          color: Color.fromARGB(
                                              255, 168, 168, 168)),
                                    ),
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
                      Expanded(
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                lang.strings['taxi']['incoming']["toggleTitle"],
                                style: TextStyle(
                                    fontSize: 25.5, fontFamily: 'psr'),
                              ),
                            ),
                            Obx(
                              () => Text(
                                lang.strings['taxi']['incoming']["toggleDesc"],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'psr',
                                    color: Color.fromARGB(255, 168, 168, 168)),
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
    );
  }
}
