import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/LaundryApp/pages/DashboardView/OrdersListView/components/LaundryOpOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['DashboardView']['OrdersListView']['LaundryOpOrdersListView'];

class LaundryOpOrdersListView extends StatefulWidget {
  const LaundryOpOrdersListView({Key? key}) : super(key: key);

  @override
  State<LaundryOpOrdersListView> createState() =>
      _LaundryOpOrdersListViewState();
}

class _LaundryOpOrdersListViewState extends State<LaundryOpOrdersListView> {
  OrderController orderController = Get.find<OrderController>();
  RxList<LaundryOrder> inProcessOrders = RxList.empty();
  RxList<LaundryOrder> pastOrders = RxList.empty();
  StreamSubscription? _inProcessOrdersListener;
  StreamSubscription? _pastOrdersListener;
  @override
  void initState() {
    // TODO: implement initState
    inProcessOrders = orderController.currentOrders;
    pastOrders = orderController.pastOrders;
    _inProcessOrdersListener =
        orderController.currentOrders.stream.listen((List<LaundryOrder> event) {
      inProcessOrders.value = event;
    });
    _pastOrdersListener =
        orderController.pastOrders.stream.listen((List<LaundryOrder> event) {
      mezDbgPrint(event.length);
      pastOrders.value = event;
      mezDbgPrint(pastOrders.value.length);
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
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // padding: const EdgeInsets.all(10),
          children: <Widget>[
            Text(
              "${_i18n()["currentOrders"]}",
              style: textTheme.bodyText1,
            ),
            const SizedBox(height: 5),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: inProcessOrders.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return LaundryOpOrderCard(
                    laundryOrder: inProcessOrders[index],
                  );
                },
              ),
            ),
            Divider(),
            Text(
              "${_i18n()["pastOrders"]}",
              style: textTheme.bodyText1,
            ),
            const SizedBox(height: 5),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: pastOrders.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) {
                  return LaundryOpOrderCard(
                    laundryOrder: pastOrders[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
