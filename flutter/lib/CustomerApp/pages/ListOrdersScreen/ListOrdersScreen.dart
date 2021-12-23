import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OldOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/OngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/taxiOldOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

import 'components/OngoingOrderCard.dart';
import 'components/TaxiOrderOngoingCard.dart';

final f = new DateFormat('MM.dd.yyyy');
final currency = new NumberFormat("#,##0.00", "en_US");

class ListOrdersScreen extends StatefulWidget {
  @override
  _ListOrdersScreen createState() => _ListOrdersScreen();
}

class _ListOrdersScreen extends State<ListOrdersScreen> {
  LanguageController _lang = Get.find<LanguageController>();
  OrderController controller = Get.put(OrderController());

  LanguageController lang = Get.find<LanguageController>();

  AuthController auth = Get.find<AuthController>();

  @override
  initState() {
    mezDbgPrint("ListOrdersScreen: onInit");

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomerAppBar(
        title: '${lang.strings["customer"]["orders"]["title"]}',
        autoBack: true,
      ),
      body: Obx(
        () => Get.find<AuthController>().user != null
            ? SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.currentOrders.isNotEmpty)
                    OngoingOrderList(txt: txt, controller: controller),
                  if (controller.pastOrders.isNotEmpty)
                    PastOrderList(txt: txt, controller: controller),
                ],
              ))
            : Container(
                child: Text("nothing"),
              ),
      ),
    );
  }
}

class PastOrderList extends StatelessWidget {
  const PastOrderList({
    Key? key,
    required this.txt,
    required this.controller,
  }) : super(key: key);

  final TextTheme txt;
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GroupedListView<Order, DateTime>(
              elements: controller.pastOrders(),
              groupBy: (element) => DateTime(element.orderTime.year,
                  element.orderTime.month, element.orderTime.day),
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              itemComparator: (element1, element2) =>
                  element1.orderTime.compareTo(element2.orderTime),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              groupHeaderBuilder: (element) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    (calculateDifference(element.orderTime) == 0)
                        ? ' Today '
                        : (calculateDifference(element.orderTime) == -1)
                            ? ' Yesterday '
                            : DateFormat('dd MMM yyyy')
                                .format(element.orderTime),
                    style: txt.headline3,
                  ),
                );
              },
              separator: SizedBox(
                height: 5,
              ),
              indexedItemBuilder: (context, order, index) {
                switch (controller.pastOrders()[index].orderType) {
                  case OrderType.Taxi:
                    return TaxiOldOrderCard(
                        order: controller.pastOrders()[index] as TaxiOrder);

                  case OrderType.Restaurant:
                    return OldOrderCard(
                        order:
                            controller.pastOrders()[index] as RestaurantOrder);

                  default:
                    return SizedBox(
                      height: 0,
                    );
                }
              }),
        ]),
      ),
    );
  }
}

class OngoingOrderList extends StatelessWidget {
  const OngoingOrderList({
    Key? key,
    required this.txt,
    required this.controller,
  }) : super(key: key);

  final TextTheme txt;
  final OrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Text(
              'Ongoing Orders',
              style: txt.headline3,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              reverse: true,
              itemCount: controller.currentOrders().length,
              itemBuilder: (context, index) {
                switch (controller.currentOrders()[index].orderType) {
                  case OrderType.Taxi:
                    return TaxiOngoingOrderCard(
                        order: controller.currentOrders()[index]);

                  case OrderType.Restaurant:
                    return OngoingOrderCard(
                        order: controller.currentOrders()[index]);

                  default:
                    return SizedBox(
                      height: 0,
                    );
                }
              }),
          Divider(),
        ]),
      ),
    );
  }
}

int calculateDifference(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day)
      .difference(DateTime(now.year, now.month, now.day))
      .inDays;
}
