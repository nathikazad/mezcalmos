import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/deliveryAuthController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNoOrdersComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverNotLookingComponent.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverOrderCard.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/IncomingOrders/IncomingOrdersOnOff.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class CurrentOrdersListScreen extends StatefulWidget {
  @override
  _CurrentOrdersListScreenState createState() =>
      _CurrentOrdersListScreenState();
}

class _CurrentOrdersListScreenState extends State<CurrentOrdersListScreen> {
  RxList<Order> incomingOrders = RxList.empty();
  RxList<Order> currentOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController orderController = Get.find<OrderController>();

  DeliveryAuthController _deliveryAuthController =
      Get.find<DeliveryAuthController>();

  @override
  void initState() {
    Get.find<SideMenuDrawerController>().showPastOrders = true;
    Get.find<SideMenuDrawerController>().pastOrdersRoute = kPastOrdersView;
    orderController.currentOrders.stream.listen((List<DeliverableOrder> value) {
      incomingOrders.value = value
          .where((DeliverableOrder element) => element.isIncoming() == true)
          .toList();
      currentOrders.value = value
          .where((DeliverableOrder element) => element.isIncoming() == false)
          .toList();
    });

    orderController.pastOrders.stream.listen((List<DeliverableOrder> value) {
      pastOrders.value = value;
    });
    orderController.clearNewOrderNotificationsOfPastOrders();
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
                  IncomingOrdersOnOff(
                    onTurnedOn: () {
                      _deliveryAuthController.turnOn();
                    },
                    onTurnedOff: () {
                      _deliveryAuthController.turnOff();
                    },
                    initialSwitcherValue:
                        _deliveryAuthController.deliveryDriverState?.isOnline ??
                            false,
                  ),
                  Obx(
                    () => Container(
                      child: (_deliveryAuthController
                              .deliveryDriverState!.isOnline)
                          ? _currentOrdersList(context)
                          : DriverNotLookingComponent(),
                    ),
                  ),
                  Obx(() => _incomingOrdersList(context)),
                ]),
              ),
            )));
  }

  Widget _incomingOrdersList(BuildContext context) {
    if (incomingOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              "Incoming Orders",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Column(
            children: List.generate(
                incomingOrders.length,
                (int index) => DriverOrderCard(
                      order: incomingOrders[index],
                      showLeftIcon: false,
                    )).reversed.toList(),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _currentOrdersList(BuildContext context) {
    if (currentOrders.isNotEmpty) {
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
                currentOrders.length,
                (int index) => DriverOrderCard(
                      order: currentOrders[index],
                      showLeftIcon: false,
                    )).reversed.toList(),
          ),
        ],
      );
    } else {
      return DriverNoOrdersComponent();
    }
  }
}
