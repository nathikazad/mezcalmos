import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';
import 'package:get/get.dart';

import 'orderCardComponent.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

VoidCallback getOrderRouteByOrderType(OrderType type, String orderId) {
  switch (type) {
    case OrderType.Restaurant:
      return () => Get.toNamed(getRestaurantOrderRoute(orderId));

    case OrderType.Taxi:
      return () => Get.toNamed(getTaxiOrderRoute(orderId));
    default:
      return () {
        mezcalmosSnackBar("Info", "Comming soon !");
      };
  }
}

Widget buildInProcessOrders(List<Order> currentOrders) {
  mezDbgPrint(currentOrders);
  List<Widget> inProcessOrdersWidget = [
    DateTitleComponent(
      date: "In Process",
    ),
  ];
  currentOrders.sort((a, b) => b.orderTime.compareTo(a.orderTime));
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: const Color(0x29000000),
          offset: Offset(1, 1),
          blurRadius: 6,
          spreadRadius: 0)
    ], color: const Color(0xfffcdeb6).withOpacity(0.9966400265693665)),
    child: Column(
        children: currentOrders.fold<List<Widget>>(
      <Widget>[],
      (children, order) {
        mezDbgPrint(
            "--------------[ ${order.serviceProvider.toString()} ]-------------");
        inProcessOrdersWidget.add(OrderCardComponenet(
          title: order.serviceProvider?.name ?? "-",
          subTitle: order.to.address,
          date:
              "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
          price: "${currency.format(order.cost)}",
          type: order.orderType,
          url: order.serviceProvider?.image,
          onPress: getOrderRouteByOrderType(order.orderType, order.orderId),
        ));
        children = inProcessOrdersWidget;
        return children;
      },
    )),
  );
}
