import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

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
      mezDbgPrint("LENGHTS --------------------->>>>");
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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text("Orders view"),
          Text("${inProcessOrders.length}"),
          Text("${pastOrders.length}"),
          //   Text("Orders view"),
        ],
      ),
    );
  }
}
