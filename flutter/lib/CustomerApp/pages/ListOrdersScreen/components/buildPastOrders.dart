import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/DateTitleComponent.dart';

import 'orderCardComponent.dart';
import 'package:intl/intl.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

Widget buildPastOrders(List<Order> pastOrders) {
  var dd = DateTime.now().toLocal();
  List<Widget> pastOrdersWidget = [];
  pastOrders.sort((a, b) => b.orderTime.compareTo(a.orderTime));
  if (pastOrders.length > 0) {
    if (pastOrders[0].orderTime.toLocal().isSameDate(dd)) {
      pastOrdersWidget.add(DateTitleComponent(
        date: "Today",
      ));
    }
  }
  return Column(
    children: pastOrders.fold<List<Widget>>(<Widget>[], (children, order) {
      checkTime(order.orderTime);
      mezDbgPrint(order.serviceProvider!.name);
      if (dd.isSameDate(order.orderTime)) {
        pastOrdersWidget.add(
          OrderCardComponenet(
            title: order.serviceProvider!.name,
            subTitle: order.to.address,
            date:
                "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
            price: "${currency.format(order.cost)}",
            type: order.orderType,
            url: order.serviceProvider!.image,
            onPress: () {
              Get.toNamed(getRestaurantOrderRoute(order.orderId));
            },
          ),
        );
      } else {
        dd = order.orderTime.toLocal();
        pastOrdersWidget.add(
          DateTitleComponent(
            date: "${f.format(dd)}",
            dateIcon: FaIcon(
              FontAwesomeIcons.calendarAlt,
              size: 12,
            ),
          ),
        );

        if (dd.isSameDate(order.orderTime.toLocal())) {
          pastOrdersWidget.add(
            OrderCardComponenet(
              title: order.serviceProvider!.name,
              subTitle: order.to.address,
              date:
                  "${DateFormat.jm().format(DateFormat("hh:mm").parse("${order.orderTime.toLocal().hour}:${order.orderTime.toLocal().minute}"))}",
              price: "${currency.format(order.cost)}",
              type: order.orderType,
              url: order.serviceProvider!.image,
              onPress: () {
                Get.toNamed(getRestaurantOrderRoute(order.orderId));
              },
            ),
          );
        }
      }

      children = pastOrdersWidget;
      return children;
    }),
  );
}

String checkTime(DateTime date) {
  var d = DateTime.now();
  if (d.difference(date).inDays == 0) {
    mezDbgPrint("Today");
    return "Today";
  } else {
    mezDbgPrint("${f.format(date)}");
    return "${f.format(date)}";
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
