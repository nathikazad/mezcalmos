import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNoOrdersComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNotLookingComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/MezSwitch.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController orderController = Get.find<OrderController>();

  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    orderController.currentOrders.stream.listen((List<DeliverableOrder> value) {
      currentOrders.value = value;
    });

    orderController.pastOrders.stream.listen((List<DeliverableOrder> value) {
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
            appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu),
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
              _i18n()["pastOrders"],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Column(
            children: List.generate(
                    orderController.pastOrders.length,
                    (int index) => DriverOrderCard(
                        order: orderController.pastOrders[index]))
                .reversed
                .toList(),
          )
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
              _i18n()["currentOrders"],
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Column(
            children: List.generate(
                orderController.currentOrders.length,
                (int index) => DriverOrderCard(
                      order: orderController.currentOrders[index],
                      showLeftIcon: false,
                    )).reversed.toList(),
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
                _i18n()["title"],
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
              height: 40.sp,
              width: 115.sp,
              child: MezSwitch(
                buttonSize: Size(50.sp, 40.sp),
                initialPosition:
                    _deliveryAuthController.deliveryDriverState?.isOnline ??
                        false,
                values: [' ON ', ' OFF '],
                onToggleCallback: (int v) {
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
