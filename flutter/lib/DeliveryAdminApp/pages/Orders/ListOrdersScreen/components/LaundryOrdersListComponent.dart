import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'LaundryOrderCard.dart';

dynamic i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["ListOrdersScreen"]["ListOrdersScreen"];

class LaundryOrdersList extends StatelessWidget {
  /// Component responsible of building  laundry orders list inside the tabbarview of the delivery admin app
  const LaundryOrdersList({
    Key? key,
    required this.pastOrders,
    required this.currentOrders,
  }) : super(key: key);

  final RxList<LaundryOrder> pastOrders;
  final RxList<LaundryOrder> currentOrders;

  /// LanguageController
  static final LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(i18n()["title"],
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Container(
                child: currentOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                          currentOrders.length,
                          (int index) =>
                              LaundryOrderCard(order: currentOrders[index]),
                        ),
                      )
                    : Center(child: Text(i18n()['noOrders'])),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                i18n()['pastOrders'],
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Container(
                child: pastOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                          pastOrders.length,
                          (int index) =>
                              LaundryOrderCard(order: pastOrders[index]),
                        ),
                      )
                    : Center(child: Text(i18n()['noOrders'])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
