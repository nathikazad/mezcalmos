import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/components/taxiAppBar.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';

import 'Components/MezSwitch.dart';
import 'Components/NoScrollGlowBehaviour.dart';

class IncomingOrdersScreen extends StatefulWidget {
  @override
  _IncomingOrdersScreenState createState() => _IncomingOrdersScreenState();
}

class _IncomingOrdersScreenState extends State<IncomingOrdersScreen> {
  IncomingOrdersController controller =
      Get.put<IncomingOrdersController>(IncomingOrdersController());
  LanguageController lang = Get.find<LanguageController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            backgroundColor: Colors.white,
            appBar: taxiAppBar(AppBarLeftButtonType.Menu),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Header that has the title + ON-OFF toggler!
                  viewHeader(),
                  //the rest of the View Body
                  viewBody()
                ])));
  }

  Widget viewHeader() {
    return Container(
      margin: EdgeInsets.only(
          top: 15.sp,
          left: getSizeRelativeToScreen(40.w, Get.width.w, Get.height.h),
          right: getSizeRelativeToScreen(40.w, Get.width.w, Get.height.h)),
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
            onOffSwitcher()
          ],
        ),
      ),
    );
  }

  Widget viewBody() {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(
                top: 25.sp,
                left: getSizeRelativeToScreen(40, Get.width.w, Get.height.h),
                right: getSizeRelativeToScreen(40, Get.width.w, Get.height.h)),
            child: Obx(() {
              // if isLooking
              if (_taxiAuthController.taxiState?.isLooking == true) {
                // if there are Orders
                if (controller.orders.length >= 1) {
                  return MezcalmosNoGlowScrollConfiguration(ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (ctx, i) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: orderCard(controller.orders[i]));
                      }));
                } else {
                  // if there are No Orders
                  return noOrdersScreen();
                }
              } else {
                // if not isLooking
                return isNotLooking();
              }
            })));
  }

  /*   -------  [ Order Card ]  -------  */
  Widget orderCard(TaxiOrder order) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(getIncomingOrderRoute(order.orderId));
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 236, 236, 236),
                width: 0.5,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            // TopHalf widgets of the Card Info :
            ...orderCardTopHalf(order),
            // bottom half widgets of the Card Info :
            orderCardBottomHalf(order)
          ],
        ),
      ),
    );
  }

  /*   -------  [ Top Half Related widgets ]  -------  */
  /// this holds [_userAvatarAndName] and [order.cost]
  List<Widget> orderCardTopHalf(TaxiOrder order) {
    return [
      ..._userAvatarAndName(order),
      Positioned(
        // bottom: 0,
        // left: Get.width - 150,
        right: 10,
        top: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // direction: Axis.horizontal,
          children: [
            Transform.scale(
                scale: 1.8,
                child: Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(money_asset),
                  )),
                )),
            Text(
              order.cost.toString(),
              style: TextStyle(fontFamily: 'psb', fontSize: 16),
            )
          ],
        ),
      )
    ];
  }

  List<Widget> _userAvatarAndName(TaxiOrder order) {
    return [
      Positioned(
        top: 10,
        child: CircleAvatar(
          // maxRadius: getSizeRelativeToScreen(56, sw, sh),
          // minRadius: getSizeRelativeToScreen(55, sw, sh),
          backgroundColor: Colors.grey,
          backgroundImage: mLoadImage(
                  url: order.customer.image, assetInCaseFailed: aDefaultAvatar)
              .image,
          onBackgroundImageError: (e, s) => mezDbgPrint(
              "Failed loading Customer openOrder::id::${order.orderId}"),
        ),
      ),
      Positioned(
          left: 50,
          top: 10,
          child: Text(
            order.customer.name,
            style: TextStyle(fontFamily: 'psb', fontSize: 16),
          )),
    ];
  }

  /*   -------  [ Bottom Half Related widgets ]  -------  */
  Widget orderCardBottomHalf(TaxiOrder order) {
    return Positioned(
      left: 50,
      bottom: 5,
      child: Wrap(
        spacing: 1.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: <Widget>[
          emptyOrWidgetSmallPhones(
              child: Icon(MezcalmosIcons.map_marker,
                  size: getSizeRelativeToScreen(32, Get.width.w, Get.height.h)
                      .w)),
          emptyOrWidgetSmallPhones(
              child: Text(
            order.from.address.substring(0, 5) + "... ",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontFamily: 'psr', fontSize: 14.sp),
          )),
          Icon(MezcalmosIcons.map_pin,
              size: getSizeRelativeToScreen(32, Get.width.w, Get.height.h).w),
          SizedBox(
            width: 2,
          ),
          Text(
            order.distanceToClient.toStringAsFixed(1) + " km",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontFamily: 'psr', fontSize: 14.sp),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(MezcalmosIcons.route,
              size: getSizeRelativeToScreen(32, Get.width.w, Get.height.h).w),
          SizedBox(
            width: 2.w,
          ),
          Text(
            order.routeInformation.distance.distanceStringInKm,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontFamily: 'psr', fontSize: 14.sp),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(MezcalmosIcons.stopwatch,
              size: getSizeRelativeToScreen(32, Get.width.w, Get.height.h).w),
          SizedBox(width: 2.w),
          Text(
            order.routeInformation.duration.shortTextVersion,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(fontFamily: 'psr', fontSize: 14.sp),
          )
        ],
      ),
    );
  }

  /// When there are no Orders in [controller.orders] we show this Widget
  Widget noOrdersScreen() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(noOrdersFound_asset))),
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
                  lang.strings['taxi']['incoming']["noOrdersTitle"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.5.sp, fontFamily: 'psr'),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Obx(
                () => Text(
                  lang.strings['taxi']['incoming']["noOrdersDesc"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'psr',
                      color: Color.fromARGB(255, 168, 168, 168)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  /// When the Driver has [_taxiAuthController.taxiState.isLooking] set to False  , we show this widget!
  Widget isNotLooking() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(turnOn_asset))),
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
                  lang.strings['taxi']['incoming']["toggleTitle"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.5.sp, fontFamily: 'psr'),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Obx(
                () => Text(
                  lang.strings['taxi']['incoming']["toggleDesc"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'psr',
                      color: Color.fromARGB(255, 168, 168, 168)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  /// this is a Container wrapping the [MezSwitch]!
  Widget onOffSwitcher() {
    return Flexible(
        child: Obx(() => Container(
              // color: Colors.black87,
              // height: Get.height * 0.33,
              height: 50.sp,
              width: 115.sp,
              child: MezSwitch(
                buttonSize: Size(60.sp, 50.sp),
                initialPosition:
                    _taxiAuthController.taxiState?.isLooking ?? false,
                values: ['ON', 'OFF'],
                onToggleCallback: (v) {
                  // turn ut ON
                  if (v == 0) {
                    _taxiAuthController.turnOn();
                  } else {
                    _taxiAuthController.turnOff();
                  }
                },
                buttonColor: _taxiAuthController.taxiState?.isLooking == true
                    ? Colors.green
                    : Colors.red,
                backgroundColor: Colors.transparent,
                textColor: const Color(0xFFFFFFFF),
              ),
            )));
  }
}
