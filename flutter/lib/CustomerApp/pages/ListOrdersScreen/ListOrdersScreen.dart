import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/CustomerApp/components/Appbar.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/LaundryOngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/LaundryPastOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/RestaurantOngoingOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/RestaurantPastOrderCard.dart';
import 'package:mezcalmos/CustomerApp/pages/ListOrdersScreen/components/TaxiPastOrderCard.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

import 'components/RestaurantOngoingOrderCard.dart';
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
    mezDbgPrint(
        "ListOrdersScreen: onInit current : ${controller.currentOrders.length} past : ${controller.pastOrders.length}");

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
        () => controller.currentOrders.length + controller.pastOrders.length > 0
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
            : NoOrdersWidget(lang),
      ),
    );
  }

  Center NoOrdersWidget(LanguageController lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.black, size: 30),
          Text(
            lang.strings['customer']['orders']['noOrders'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14),
          )
        ],
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
    LanguageController lang = Get.find<LanguageController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => controller.pastOrders().length >= 1
            ? pastOrdersWidget(lang)
            : NoPastOrdersWidget(lang, context),
      ),
    );
  }

  Column pastOrdersWidget(LanguageController lang) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GroupedListView<Order, DateTime>(
          elements: controller.pastOrders(),
          groupBy: (element) => DateTime(element.orderTime.year,
              element.orderTime.month, element.orderTime.day),
          groupComparator: (DateTime value1, DateTime value2) =>
              value2.compareTo(value1),
          itemComparator: (element1, element2) =>
              element2.orderTime.compareTo(element1.orderTime),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          groupHeaderBuilder: (element) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                (calculateDifference(element.orderTime) == 0)
                    ? ' ${lang.strings["shared"]["notification"]["today"]} '
                    : (calculateDifference(element.orderTime) == -1)
                        ? ' ${lang.strings["shared"]["notification"]["yesterday"]} '
                        : DateFormat('dd MMM yyyy').format(element.orderTime),
                style: txt.headline3,
              ),
            );
          },
          separator: SizedBox(
            height: 5,
          ),
          itemBuilder: (context, element) {
            switch (element.orderType) {
              case OrderType.Taxi:
                return TaxiPastOrderCard(order: element as TaxiOrder);

              case OrderType.Restaurant:
                return RestaurantPastOrderCard(
                    order: element as RestaurantOrder);
              case OrderType.Laundry:
                return LaundryPastOrderCard(order: element as LaundryOrder);

              default:
                return SizedBox(
                  height: 0,
                );
            }
          }),
    ]);
  }

  Center NoPastOrdersWidget(LanguageController lang, BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.error, color: Colors.white),
          Text(
            lang.strings['customer']['orders']['noOrders'],
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          )
        ],
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
    LanguageController lang = Get.find<LanguageController>();
    return Container(
      color: Colors.green.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              '${lang.strings["customer"]["orders"]["onGoingOrders"]}',
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
                    return RestaurantOngoingOrderCard(
                        order: controller.currentOrders()[index]);
                  case OrderType.Laundry:
                    return LaundryOngoigOrderCard(
                        order: controller.currentOrders()[index]);

                  default:
                    return SizedBox(
                      height: 0,
                    );
                }
              }),
          SizedBox(
            height: 10,
          )
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
