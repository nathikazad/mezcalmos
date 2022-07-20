import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/RestaurantApp/pages/CurrentOrdersList/components/ROpOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['DashboardView']['OrdersListView']['LaundryOpOrdersListView'];

class LaundryOpCurrentOrdersListView extends StatefulWidget {
  const LaundryOpCurrentOrdersListView({Key? key}) : super(key: key);

  @override
  State<LaundryOpCurrentOrdersListView> createState() =>
      _LaundryOpCurrentOrdersListViewState();
}

class _LaundryOpCurrentOrdersListViewState
    extends State<LaundryOpCurrentOrdersListView> {
  ROpOrderController orderController = Get.find<ROpOrderController>();
  RxList<RestaurantOrder> inProcessOrders = RxList.empty();
  RxList<RestaurantOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener = orderController.currentOrders.stream
        .listen((List<RestaurantOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener =
        orderController.pastOrders.stream.listen((List<RestaurantOrder> event) {
      pastOrders.value = event;
    });

    super.initState();
  }

  @override
  void dispose() {
    _pastOrdersListener?.cancel();
    _inProcessOrdersListener?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Menu,
      ),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      body: Obx(
        () => Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${_i18n()["currentOrders"]}",
                  style: textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                (inProcessOrders.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: inProcessOrders.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int index) {
                          return ROpOrderCard(
                            order: inProcessOrders[index],
                          );
                        },
                      )
                    : Container(
                        margin: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Text(
                          "No current orders at the moment",
                          style: Get.textTheme.bodyText2,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}