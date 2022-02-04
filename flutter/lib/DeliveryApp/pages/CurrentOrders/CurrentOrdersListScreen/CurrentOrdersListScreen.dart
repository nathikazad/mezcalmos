import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

import 'Components/DriverOrderCard.dart';
import 'Components/MezSwitch.dart';
import 'Components/NoScrollGlowBehaviour.dart';

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  OrderController orderController = Get.find<OrderController>();
  LanguageController lang = Get.find<LanguageController>();
  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void dispose() {
    orderController.dispose();
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
            appBar: DeliveryAppBar(AppBarLeftButtonType.Menu),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Header that has the title + ON-OFF toggler!
                  viewHeader(),
                  //the rest of the View Body
                  viewBody(),
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
              if (_deliveryAuthController.deliveryDriverState?.isOnline ==
                  true) {
                // if there are Orders
                if (orderController.currentOrders.length >= 1) {
                  return MezcalmosNoGlowScrollConfiguration(ListView.builder(
                      itemCount: orderController.currentOrders.length,
                      itemBuilder: (ctx, i) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: DriverOrderCard(
                                order: orderController.currentOrders[i]));
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
  Widget orderCard(Order order) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(getCurrentOrderRoute(order.orderId));
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
            // card components
          ],
        ),
      ),
    );
  }

  /// When there are no Orders in [orderController.orders] we show this Widget
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
                    _deliveryAuthController.deliveryDriverState?.isOnline ??
                        false,
                values: ['ON', 'OFF'],
                onToggleCallback: (v) {
                  // turn ut ON
                  if (v == 0) {
                    _deliveryAuthController.turnOn();
                  } else {
                    _deliveryAuthController.turnOff();
                  }
                },
                buttonColor:
                    _deliveryAuthController.deliveryDriverState?.isOnline ==
                            true
                        ? Colors.green
                        : Colors.red,
                backgroundColor: Colors.transparent,
                textColor: const Color(0xFFFFFFFF),
              ),
            )));
  }
}
