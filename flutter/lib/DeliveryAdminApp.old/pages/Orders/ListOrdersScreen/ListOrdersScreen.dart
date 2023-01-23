import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/laundryOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/restaurantOrderController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ListOrdersScreen/components/LaundryOrdersListComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ListOrdersScreen/components/RestaurantOrdersListComponent.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/pages/Orders/ListOrdersScreen/components/TaxiOrdersListComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezSideMenu.dart';
import 'package:sizer/sizer.dart';

final DateFormat f = new DateFormat('hh:mm a');

final NumberFormat currency = new NumberFormat("#,##0.00", "en_US");

// dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
// ["Orders"]["ListOrdersScreen"];

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({Key? key}) : super(key: key);

  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  RxList<Order> inProcessOrders = RxList<Order>.empty();
  RxList<Order> pastOrders = RxList<Order>.empty();
  // RxList<Order> laundryInProcessOrders = RxList<Order>.empty();
  // RxList<Order> laundryPastOrders = RxList<Order>.empty();
  // RxList<Order> taxiInProcessOrders = RxList<Order>.empty();
  // RxList<Order> taxiOpenOrders = RxList<Order>.empty();
  // RxList<Order> taxiPastOrders = RxList<Order>.empty();

  /// RestaurantOrderController
  final RestaurantOrderController controller =
      Get.find<RestaurantOrderController>();

  /// LaundryOrderController
  final LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();

  /// TaxiOrderController
  TaxiOrderController taxiOrderController = Get.find<TaxiOrderController>();

  dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
      ["pages"]["Orders"]["ListOrdersScreen"]["ListOrdersScreen"];

  StreamSubscription? _ordersListener;
  // StreamSubscription? _laundryOrdersListener;
  // StreamSubscription? _taxiOrdersListener;

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

  List<Order> taxiCurrentFetchByRange() {
    return taxiOrderController.inProcessOrders().reversed.toList();
  }

  List<Order> taxiOpenFetchByRange() {
    return taxiOrderController.openOrders().reversed.toList();
  }

  List<Order> taxiFetchPastByRange() {
    return taxiOrderController.pastOrders().reversed.toList();
  }

  @override
  void initState() {
    /// controller
    controller.clearNewOrderNotifications();

    /// laundryOrderController
    laundryOrderController.clearNewOrderNotifications();

    /// inProcessOrders
    inProcessOrders.value = fetchByRange();
    controller.inProcessOrders.stream.listen((_) {
      inProcessOrders.value = fetchByRange();
    });

    /// pastOrders
    pastOrders.value = fetchPastByRange();
    controller.pastOrders.stream.listen((_) {
      pastOrders.value = fetchPastByRange();
    });

    /// taxiInProcessOrders
    // taxiInProcessOrders.value = taxiCurrentFetchByRange();
    // taxiOrderController.inProcessOrders.stream.listen((_) {
    //   taxiInProcessOrders.value = taxiCurrentFetchByRange();
    // });

    // /// taxiOpenOrders
    // taxiOpenOrders.value = taxiOpenFetchByRange();
    // taxiOrderController.openOrders.stream.listen((_) {
    //   taxiOpenOrders.value = taxiOpenFetchByRange();
    // });

    // /// taxiPastOrders
    // taxiPastOrders.value = taxiFetchPastByRange();
    // taxiOrderController.pastOrders.stream.listen((_) {
    //   taxiPastOrders.value = taxiFetchPastByRange();
    // });

    // /// laundryInProcessOrders
    // laundryInProcessOrders.value = laundryFetchByRange();
    // laundryOrderController.inProcessOrders.stream.listen((_) {
    //   laundryInProcessOrders.value = laundryFetchByRange();
    // });

    // /// laundryPastOrders
    // laundryPastOrders.value = laundryFetchPastByRange();
    // laundryOrderController.pastOrders.stream.listen((_) {
    //   laundryPastOrders.value = laundryFetchPastByRange();
    // });

    super.initState();
  }

  @override
  void dispose() {
    _ordersListener?.cancel();
    _ordersListener = null;
    // _laundryOrdersListener?.cancel();
    // _laundryOrdersListener = null;
    // _taxiOrdersListener?.cancel();
    // _taxiOrdersListener = null;
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
        length: 3,
        child: Scaffold(
          key: Get.find<SideMenuDrawerController>().getNewKey(),
          appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
              tabBar: deliveryAdminTabbar(context), showNotifications: true),
          //   withOrder: false,
          //  ,
          //   function: () => Get.find<SideMenuDrawerController>().openMenu()),
          // appBar: mezcalmosAppBar(
          //     "menu", Get.find<SideMenuDraweController>().openMenu),
          drawer: MezSideMenu(),
          body: TabBarView(
            children: <Widget>[
              // Restaurant orders list view
              RestaurantOrdersList(
                pastOrders: controller.pastOrders,
                currentOrders: controller.inProcessOrders,
              ),
              // Laundry orders list view
              LaundryOrdersList(
                pastOrders: laundryOrderController.pastOrders,
                currentOrders: laundryOrderController.inProcessOrders,
              ),
              TaxiOrdersList(
                pastOrders: taxiOrderController.pastOrders,
                currentOrders: taxiOrderController.inProcessOrders,
                openOrders: taxiOrderController.openOrders,
              )
            ],
          ),
        ),
      ),
    );
  }

  TabBar deliveryAdminTabbar(BuildContext context) {
    return TabBar(
      tabs: <Widget>[
        Obx(
          () => Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    _i18n()['restaurantOrders'],
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 10.sp,
                        ),
                  ),
                ),
                const SizedBox(width: 5),
                if (inProcessOrders.isNotEmpty)
                  CircleAvatar(
                    radius: 8,
                    child: Text(
                      '${inProcessOrders.length}',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                          ),
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
              children: <Widget>[
                Flexible(
                  child: Text(
                    _i18n()['laundryOrders'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 10.sp),
                  ),
                ),
                const SizedBox(width: 5),
                // if (laundryInProcessOrders.isNotEmpty)
                //   CircleAvatar(
                //     radius: 8,
                //     child: Text(
                //       '${laundryInProcessOrders.length}',
                //       style: Theme.of(context)
                //           .textTheme
                //           .subtitle1!
                //           .copyWith(color: Colors.white),
                //     ),
                //   ),
              ],
            ),
          ),
        ),
        Obx(
          () => Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    _i18n()['taxiOrders'],
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 10.sp),
                  ),
                ),
                const SizedBox(width: 5),
                // if (taxiOpenOrders.isNotEmpty)
                //   CircleAvatar(
                //     radius: 8,
                //     child: Text(
                //       '${taxiOpenOrders.length}',
                //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
                //             color: Colors.white,
                //           ),
                //     ),
                //   )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
