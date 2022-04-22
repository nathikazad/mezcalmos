import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class OrderEstimatedTimeComponent extends StatelessWidget {
  const OrderEstimatedTimeComponent({Key? key, required this.order})
      : super(key: key);
  final LaundryOrder order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Order Estimated Time "),
        SizedBox(
          height: 5,
        ),
        Card(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later,
                  size: 40,
                  color: keyAppColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "${DateFormat("dd MMMM yyyy hh:mm a").format(order.orderTime)}",
                  style: Get.theme.textTheme.bodyText1,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
