import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class PastListOrders extends StatelessWidget {
  PastListOrders(
      {Key? key,
      // required this.controller,
      required this.txt,
      this.isWebVersion})
      : super(key: key);
  //final OrderController controller;
  final TextTheme txt;
  bool? isWebVersion = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       GroupedListView<Order, DateTime>(
  //         shrinkWrap: true,
  //         elements: controller.pastOrders(),
  //         groupBy: (Order element) => DateTime(element.orderTime.year,
  //             element.orderTime.month, element.orderTime.day),
  //         groupComparator: (DateTime value1, DateTime value2) =>
  //             value2.compareTo(value1),
  //         itemComparator: (Order element1, Order element2) =>
  //             element2.orderTime.compareTo(element1.orderTime),
  //         physics: NeverScrollableScrollPhysics(),
  //         groupHeaderBuilder: (Order element) {
  //           return Container(
  //             margin: const EdgeInsets.symmetric(vertical: 8),
  //             child: Text(
  //               (calculateDifference(element.orderTime) == 0)
  //                   ? _i18n()["shared"]["notification"]["today"]
  //                   : (calculateDifference(element.orderTime) == -1)
  //                       ? _i18n()["shared"]["notification"]["yesterday"]
  //                       : DateFormat('dd MMM yyyy').format(element.orderTime),
  //               style: txt.headline3!.copyWith(fontSize: 25),
  //             ),
  //           );
  //         },
  //         separator: SizedBox(
  //           height: 5,
  //         ),
  //         itemBuilder: (BuildContext context, Order element) {
  //           return CustomerOrderCard(
  //             order: element,
  //             isWebVersion: true,
  //           );
  //         },
  //       ),
  //     ],
  //   );
  //   ;
  // }
}

int calculateDifference(DateTime date) {
  final DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
