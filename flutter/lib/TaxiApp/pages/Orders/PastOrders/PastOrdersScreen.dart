import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/Components/IncomingOrderCard.dart';
import 'package:mezcalmos/TaxiApp/taxiOrderCardBuilder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['ListOrdersScreen']['ListOrdersScreen'];

class PastOrderList extends StatelessWidget {
  PastOrderList({
    Key? key,
  }) : super(key: key);

  final OrderController controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        appBar: AppBar(
          leading: Center(
            child: GestureDetector(
              onTap: Get.back,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 97, 127, 255),
                    Color.fromARGB(255, 198, 90, 252),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
          title: Text("Past Orders"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => controller.pastOrders().length >= 1
                ? pastOrdersWidget()
                : _noPastOrdersWidget(context),
          ),
        ),
      ),
    );
  }

  Widget pastOrdersWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GroupedListView<TaxiOrder, DateTime>(
            shrinkWrap: true,
            elements: controller.pastOrders(),
            groupBy: (TaxiOrder element) => DateTime(element.orderTime.year,
                element.orderTime.month, element.orderTime.day),
            groupComparator: (DateTime value1, DateTime value2) =>
                value2.compareTo(value1),
            itemComparator: (TaxiOrder element1, TaxiOrder element2) =>
                element2.orderTime.compareTo(element1.orderTime),
            physics: NeverScrollableScrollPhysics(),
            groupHeaderBuilder: (TaxiOrder element) {
              return Container(
                margin: const EdgeInsets.all(8),
                child: Text(
                  (calculateDifference(element.orderTime) == 0)
                      ? _i18n()["shared"]["notification"]["today"]
                      : (calculateDifference(element.orderTime) == -1)
                          ? _i18n()["shared"]["notification"]["yesterday"]
                          : DateFormat('dd MMM yyyy').format(element.orderTime),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              );
            },
            separator: SizedBox(
              height: 5,
            ),
            itemBuilder: (BuildContext context, TaxiOrder element) {
              return Text("TO DO TAXI ORDER CARD");
              // OrderInfosCard(
              //   orderCardSubWidgets: buildTaxiOrderCardWidgets(element),
              //   order: element,
              // );

              //IncomingOrderCard(order: element, isPast: true);
              // switch (element.orderType) {
              //   case OrderType.Taxi:
              //     return TaxiPastOrderCard(order: element as TaxiOrder);
              //   case OrderType.Restaurant:
              //     return RestaurantPastOrderCard(
              //       order: element as RestaurantOrder,
              //     );
              //   case OrderType.Laundry:
              //     return LaundryPastOrderCard(order: element as LaundryOrder);
              //   default:
              //     return const SizedBox.shrink();
              // }
            },
          ),
        ],
      ),
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

  int calculateDifference(DateTime date) {
    final DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
