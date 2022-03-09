import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/components/DeliveryAdminAppbar.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ListOrdersScreen/components/LaundryOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';

import 'components/buildOrders.dart';

final f = new DateFormat('hh:mm a');

final currency = new NumberFormat("#,##0.00", "en_US");

// dynamic _i18n = Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
// ["Orders"]["ListOrdersScreen"];

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> { 
  RxList<Order> inProcessOrders = RxList.empty();
  RxList<Order> pastOrders = RxList.empty();
  RxList<Order> laundryInProcessOrders = RxList.empty();
  RxList<Order> laundryPastOrders = RxList.empty();
  RestaurantOrderController controller = Get.find<RestaurantOrderController>();
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();
  dynamic _i18n =
      Get.find<LanguageController>().strings["CustomerApp"]["pages"];
  StreamSubscription? _ordersListener;
  StreamSubscription? _laundryOrdersListener;

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

  List<Order> laundryFetchByRange() {
    return laundryOrderController.inProcessOrders().reversed.toList();
  }

  List<Order> laundryFetchPastByRange() {
    return laundryOrderController.pastOrders().reversed.toList();
  }

  @override
  void initState() {
    controller.clearNewOrderNotifications();
    laundryOrderController.clearNewOrderNotifications();

    inProcessOrders.value = fetchByRange();
    controller.inProcessOrders.stream.listen((_) {
      inProcessOrders.value = fetchByRange();
    });
    pastOrders.value = fetchPastByRange();
    controller.pastOrders.stream.listen((_) {
      pastOrders.value = fetchPastByRange();
    });
    laundryInProcessOrders.value = laundryFetchByRange();
    laundryOrderController.inProcessOrders.stream.listen((_) {
      laundryInProcessOrders.value = laundryFetchByRange();
    });
    laundryPastOrders.value = laundryFetchPastByRange();
    laundryOrderController.pastOrders.stream.listen((_) {
      laundryPastOrders.value = laundryFetchPastByRange();
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
    _laundryOrdersListener?.cancel();
    _laundryOrdersListener = null;
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
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              key: Get.find<SideMenuDrawerController>().getNewKey(),
              appBar: deliveryAdminAppBar(AppBarLeftButtonType.Menu,
                  withOrder: false,
                  tabbar: deliveryAdminTabbar(context),
                  function: () =>
                      Get.find<SideMenuDrawerController>().openMenu()),
              // appBar: mezcalmosAppBar(
              //     "menu", Get.find<SideMenuDraweController>().openMenu),
              drawer: MezSideMenu(),
              body: Obx(() {
                return TabBarView(children: [
                  // Restaurant orders list view
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              lang.strings["customer"]["orders"]["title"],
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
                                  child: Text(lang.strings['deliveryAdminApp']
                                      ['laundry']['noOrders']),
                                ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          alignment: Alignment.centerLeft,
                          child: Text(
                              lang.strings['deliveryAdminApp']['laundry']
                                  ['pastOrders'],
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
                                  child: Text(lang.strings['deliveryAdminApp']
                                      ['laundry']['noOrders']),
                                ),
                        ),
                      ],
                    ),
                  ),
                  // Laundry orders list view
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                lang.strings["customer"]["orders"]["title"],
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.left),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: laundryInProcessOrders.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        laundryInProcessOrders.length,
                                        (index) => LaundryOrderCard(
                                            order: laundryInProcessOrders[index]
                                                as LaundryOrder)),
                                  )
                                : Center(
                                    child: Text(lang.strings['deliveryAdminApp']
                                        ['laundry']['noOrders']),
                                  ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                lang.strings['deliveryAdminApp']['laundry']
                                    ['pastOrders'],
                                style: Theme.of(context).textTheme.headline1,
                                textAlign: TextAlign.left),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: laundryPastOrders.isNotEmpty
                                ? Column(
                                    children: List.generate(
                                        laundryPastOrders.length,
                                        (index) => LaundryOrderCard(
                                            order: laundryPastOrders[index]
                                                as LaundryOrder)),
                                  )
                                : Center(
                                    child: Text(lang.strings['deliveryAdminApp']
                                        ['laundry']['noOrders']),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]);
              })),
        ));
  }

  TabBar deliveryAdminTabbar(BuildContext context) {
    return TabBar(tabs: [
      Obx(
        () => Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                lang.strings['deliveryAdminApp']['laundry']['restaurantOrders'],
                style: Theme.of(context).textTheme.bodyText2,
              )),
              SizedBox(
                width: 5,
              ),
              if (inProcessOrders.isNotEmpty)
                CircleAvatar(
                  radius: 8,
                  child: Text(
                    '${inProcessOrders.length}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                )
            ],
          ),
        ),
      ),
      Obx(
        () => Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                lang.strings['deliveryAdminApp']['laundry']['laundryOrders'],
                style: Theme.of(context).textTheme.bodyText2,
              )),
              SizedBox(
                width: 5,
              ),
              if (laundryInProcessOrders.isNotEmpty)
                CircleAvatar(
                  radius: 8,
                  child: Text(
                    '${laundryInProcessOrders.length}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                )
            ],
          ),
        ),
      ),
    ]);
  }
}
