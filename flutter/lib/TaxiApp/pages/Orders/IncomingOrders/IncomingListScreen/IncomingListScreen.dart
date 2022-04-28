import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/MezSwitch.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/Components/NoScrollGlowBehaviour.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
    ["Orders"]["IncomingOrders"]["IncomingListScreen"]["IncomingListScreen"];

class IncomingOrdersScreen extends StatefulWidget {
  @override
  _IncomingOrdersScreenState createState() => _IncomingOrdersScreenState();
}

class _IncomingOrdersScreenState extends State<IncomingOrdersScreen> {
  IncomingOrdersController _controller = Get.find<IncomingOrdersController>();
  TaxiAuthController _taxiAuthController = Get.find<TaxiAuthController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: Get.find<SideMenuDrawerController>().getNewKey(),
        drawer: MezSideMenu(),
        backgroundColor: Colors.white,
        appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Header that has the title + ON-OFF toggler!
            viewHeader(),
            //the rest of the View Body
            viewBody()
          ],
        ),
      ),
    );
  }

  Widget viewHeader() {
    return Container(
      margin: EdgeInsets.only(top: 1.h, left: 24, right: 24),
      child: Container(
        height: 100.sp,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Obx(
                () => Text(
                  _i18n()["title"],
                  style: TextStyle(
                      // fontSize: getSizeRelativeToScreen(70, sw, sh),
                      fontSize: 25.5.sp,
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
            margin: EdgeInsets.only(top: 1.h, left: 24, right: 24),
            child: Obx(() {
              // if isLooking
              if (_taxiAuthController.taxiState?.isLooking == true) {
                // if there are Orders
                if (_controller.orders.length >= 1) {
                  return MezcalmosNoGlowScrollConfiguration(ListView.builder(
                      itemCount: _controller.orders.length,
                      itemBuilder: (BuildContext ctx, int i) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: orderCard(_controller.orders[i]));
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
    return InkWell(
      onTap: () {
        Get.toNamed<void>(getIncomingOrderRoute(order.orderId));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 236, 236, 236),
                width: 0.5,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 14.sp,
              backgroundColor: Colors.grey,
              backgroundImage: mLoadImage(
                      url: order.customer.image,
                      assetInCaseFailed: aDefaultAvatar)
                  .image,
              onBackgroundImageError: (Object e, StackTrace? s) => mezDbgPrint(
                  "Failed loading Customer openOrder::id::${order.orderId}"),
            ),

            // user img

            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // TopHalf widgets of the Card Info :
                    orderCardTopHalf(order),
                    // Spacer(),
                    SizedBox(
                      height: 5,
                    ),
                    // bottom half widgets of the Card Info :
                    orderCardBottomHalf(order),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*   -------  [ Top Half Related widgets ]  -------  */
  /// this holds [_userAvatarAndName] and [order.cost]
  Widget orderCardTopHalf(TaxiOrder order) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          order.customer.name,
          style: TextStyle(fontFamily: 'psb', fontSize: 11.sp),
        ),
        Row(
          children: <Widget>[
            Transform.scale(
                scale: 1.5,
                child: Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(money_asset),
                  )),
                )),
            Text(
              "\$${order.cost.toString()}",
              style: TextStyle(fontFamily: 'psb', fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }

  /*   -------  [ Bottom Half Related widgets ]  -------  */
  Widget orderCardBottomHalf(TaxiOrder order) {
    return Wrap(
      spacing: 1.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: <Widget>[
        emptyOrWidgetSmallPhones(
            child: Icon(MezcalmosIcons.map_marker, size: 2.h)),
        emptyOrWidgetSmallPhones(
            child: Text(
          order.from.address.substring(0, 5) + "... ",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
        )),
        Icon(MezcalmosIcons.map_pin, size: 2.h),
        SizedBox(
          width: 2,
        ),
        Text(
          order.distanceToClient.toStringAsFixed(1) + " km",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(MezcalmosIcons.route, size: 2.h),
        SizedBox(
          width: 2.w,
        ),
        Text(
          order.routeInformation!.distance.distanceStringInKm,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(MezcalmosIcons.stopwatch, size: 2.h),
        SizedBox(width: 2.w),
        Text(
          order.routeInformation!.duration.shortTextVersion,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: false,
          style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
        )
      ],
    );
  }

  /// When there are no Orders in [mGoogleController.orders] we show this Widget
  Widget noOrdersScreen() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
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
            children: <Widget>[
              Obx(
                () => Text(
                  _i18n()["noOrdersTitle"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.5.sp, fontFamily: 'psr'),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Obx(
                () => Text(
                  _i18n()["noOrdersDesc"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
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
      children: <Widget>[
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
            children: <Widget>[
              Obx(
                () => Text(
                  _i18n()["toggleTitle"],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.5.sp, fontFamily: 'psr'),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Obx(
                () => Text(
                  _i18n()["toggleDesc"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
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
              height: 41.sp,
              width: 100.sp,
              child: MezSwitch(
                buttonSize: Size(55.sp, 55.sp),
                initialPosition:
                    _taxiAuthController.taxiState?.isLooking ?? false,
                values: <String>['ON', 'OFF'],
                onToggleCallback: (int v) {
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
