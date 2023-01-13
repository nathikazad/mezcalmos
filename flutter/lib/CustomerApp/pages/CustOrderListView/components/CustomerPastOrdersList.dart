import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/components/CustomerOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/CustOrderListView/controllers/CustomerOrdersListViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class CustomerPastOrdersList extends StatelessWidget {
  const CustomerPastOrdersList({
    Key? key,
    required this.txt,
    required this.viewController,
  }) : super(key: key);

  final TextTheme txt;
  final CustomerOrdersListViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => viewController.pastOrders().length >= 1
            ? pastOrdersWidget()
            : _noPastOrdersWidget(context),
      ),
    );
  }

  Column pastOrdersWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GroupedListView<Order, DateTime>(
          shrinkWrap: true,
          elements: viewController.pastOrders(),
          groupBy: (Order element) => DateTime(element.orderTime.year,
              element.orderTime.month, element.orderTime.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (Order element1, Order element2) =>
              element2.orderTime.compareTo(element1.orderTime),
          physics: NeverScrollableScrollPhysics(),
          groupHeaderBuilder: (Order element) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                (calculateDifference(element.orderTime) == 0)
                    ? _i18n()["shared"]["notification"]["today"]
                    : (calculateDifference(element.orderTime) == -1)
                        ? _i18n()["shared"]["notification"]["yesterday"]
                        : DateFormat('dd MMM yyyy').format(element.orderTime),
                style: txt.headline3,
              ),
            );
          },
          separator: SizedBox(
            height: 5,
          ),
          itemBuilder: (BuildContext context, Order element) {
            return CustomerOrderCard(order: element);
          },
        ),
      ],
    );
  }

  Center _noPastOrdersWidget(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(Icons.error, color: Colors.white),
          Text(
            _i18n()['orders']['noOrders'],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

int calculateDifference(DateTime date) {
  final DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
