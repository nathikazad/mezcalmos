import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

import 'components/buildOrders.dart';

final f = new DateFormat('hh:mm a');

final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  RxList<Order> inProcessOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  OrderController controller = Get.find<OrderController>();
  LanguageController lang = Get.find<LanguageController>();
  StreamSubscription? _ordersListener;

  // ScrollController _ordersListViewController = ScrollController();
  // int fetchedOrders = 1;
  // int ordersCountByScroll = 10;
  // bool isLoading = false;

  List<Order> fetchByRange() {
    return controller.inProcessOrders().reversed.toList();
  }

  List<Order> fetchPastByRange() {
    return controller.pastOrders().reversed.toList();
  }

  @override
  void initState() {
    controller.clearNewOrderNotifications();
    inProcessOrders.value = fetchByRange();
    controller.inProcessOrders.stream.listen((_) {
      inProcessOrders.value = fetchByRange();
    });
    pastOrders.value = fetchPastByRange();
    controller.pastOrders.stream.listen((_) {
      pastOrders.value = fetchPastByRange();
    });

    // _ordersListViewController.addListener(() {
    //   mezDbgPrint(_ordersListViewController.offset);
    //   if (_ordersListViewController.offset <= 0.1) {
    //     // to remove that bounce back xd
    //     _ordersListViewController.position.jumpTo(0.0);
    //     // then fetch !
    //     inProcessOrders().addAll(fetchByRange());
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    _ordersListener?.cancel();
    _ordersListener = null;
    // _ordersListViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          controller.clearNewOrderNotifications();
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            key: Get.find<SideMenuDrawerController>().getNewKey(),
            appBar: deliveryAdminAppBar(AppBarLeftButtonType.Menu,
                withOrder: false,
                function: () =>
                    Get.find<SideMenuDrawerController>().openMenu()),
            // appBar: mezcalmosAppBar(
            //     "menu", Get.find<SideMenuDraweController>().openMenu),
            drawer: MezSideMenu(),
            body: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Text(lang.strings["customer"]["orders"]["title"],
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: inProcessOrders.value.length > 0
                          ? buildOrders(inProcessOrders)
                          : Center(
                              child: Text("No orders"),
                            ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Text('Past orders',
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: controller.pastOrders.value.length > 0
                          ? buildOrders(controller.pastOrders)
                          : Center(
                              child: Text("No orders"),
                            ),
                    ),
                  ],
                ),
              );i18n.st
            })));
  }
}
i18n.sti18n.sti18n.sti18n.sti18n.sti18n.sti18n.sti18n.sti18n.st