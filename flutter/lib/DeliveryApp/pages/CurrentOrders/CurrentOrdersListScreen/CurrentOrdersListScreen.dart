import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/constants/assets.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

import 'Components/DriverOrderCard.dart';
import 'Components/MezSwitch.dart';

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
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
  void initState() {
    orderController.currentOrders.stream.listen((value) {
      currentOrders.value = value;
    });

    orderController.pastOrders.stream.listen((value) {
      pastOrders.value = value;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    responsiveSize(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            appBar: DeliveryAppBar(AppBarLeftButtonType.Menu),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Header that has the title + ON-OFF toggler!
                      viewHeader(),
                      //the rest of the View Body
                      Obx(
                        () => Container(
                          child: (_deliveryAuthController
                                  .deliveryDriverState!.isOnline)
                              ? _currentOrdersList(context)
                              : isNotLooking(),
                        ),
                      ),
                      Divider(),
                      Obx(() => _pastOrdersList(context)),
                    ]),
              ),
            )));
  }

  Widget _pastOrdersList(BuildContext context) {
    if (orderController.pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Past orders',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              reverse: true,
              itemCount: orderController.pastOrders.length,
              itemBuilder: (context, index) {
                return DriverOrderCard(
                    order: orderController.pastOrders[index]);
              }),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _currentOrdersList(BuildContext context) {
    if (orderController.currentOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Current orders',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Column(
            children: List.generate(
                orderController.currentOrders.length,
                (index) => DriverOrderCard(
                    order: orderController.currentOrders[index])),
          ),
        ],
      );
    } else {
      return noOrdersScreen();
    }
  }

  Widget viewHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Obx(
              () => Text(
                lang.strings['taxi']['incoming']["title"],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          onOffSwitcher()
        ],
      ),
    );
  }

  /// When there are no Orders in [orderController.orders] we show this Widget
  Widget noOrdersScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(noOrdersFound_asset))),
        ),
        SizedBox(
          height: 15.sp,
        ),
        Column(
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
      ],
    );
  }

  /// When the Driver has [_taxiAuthController.taxiState.isLooking] set to False  , we show this widget!
  Widget isNotLooking() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(turnOn_asset))),
        ),
        SizedBox(
          height: 15.sp,
        ),
        Column(
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
      ],
    );
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
                backgroundColor: Colors.white,
                buttonColor:
                    _deliveryAuthController.deliveryDriverState?.isOnline ==
                            true
                        ? Colors.green
                        : Colors.red,
                textColor: const Color(0xFFFFFFFF),
              ),
            )));
  }
}
