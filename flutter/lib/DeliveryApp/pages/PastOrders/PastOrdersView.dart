import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrdersListScreen/Components/DriverOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
    ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"];

class DriverPastOrdersView extends StatefulWidget {
  const DriverPastOrdersView({Key? key}) : super(key: key);

  @override
  _DriverPastOrdersViewState createState() => _DriverPastOrdersViewState();
}

class _DriverPastOrdersViewState extends State<DriverPastOrdersView> {
  OrderController orderController = Get.find<OrderController>();
  RxList<DeliverableOrder> inProcessOrders = RxList.empty();
  RxList<DeliverableOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener = orderController.currentOrders.stream
        .listen((List<DeliverableOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener = orderController.pastOrders.stream
        .listen((List<DeliverableOrder> event) {
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
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: Get.back, title: "Past orders"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Obx(() => _pastOrdersList(context))],
        ),
      ),
    );
  }

  Widget _pastOrdersList(BuildContext context) {
    if (pastOrders.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pastOrders.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Text(
                _i18n()["pastOrders"],
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          Column(
            children: List.generate(
              pastOrders.length,
              (int index) => DriverOrderCard(
                order: pastOrders[index],
                isPastOrder: true,
              ),
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
