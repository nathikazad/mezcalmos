import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/components/DeliveryAppBar.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNoOrdersComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNotLookingComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
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
  void initState() {
    orderController.currentOrders.stream.listen((value) {
      currentOrders.value = value;
    });

    orderController.pastOrders.stream.listen((value) {
      pastOrders.value = value;
    });
    super.initState();
  }

  @override
  void dispose() {
    orderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            drawer: MezSideMenu(),
            appBar: DeliveryAppBar(AppBarLeftButtonType.Menu),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  viewHeader(),
                  Obx(
                    () => Container(
                      child: (_deliveryAuthController
                              .deliveryDriverState!.isOnline)
                          ? _currentOrdersList(context)
                          : DriverNotLookingComponent(),
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
                        order: orderController.currentOrders[index]))
                .reversed
                .toList(),
          ),
        ],
      );
    } else {
      return DriverNoOrdersComponent();
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

  /// this is a Container wrapping the [MezSwitch]!
  Widget onOffSwitcher() {
    return Flexible(
        child: Obx(() => Container(
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
