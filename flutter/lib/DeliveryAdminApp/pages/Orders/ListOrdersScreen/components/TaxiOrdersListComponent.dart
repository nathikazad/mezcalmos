import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'TaxiCurrentOrderCard.dart';
import 'TaxiOpenOrderCard.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
        ["Orders"]["ListOrdersScreen"]["components"]["taxiOrdersListComponent"];

class TaxiOrdersList extends StatelessWidget {
  /// Component responsible of building the taxi orders list inside the tabbarview of the delivery admin app
  TaxiOrdersList({
    Key? key,
    required this.pastOrders,
    required this.currentOrders,
    required this.openOrders,
  }) : super(key: key);

  final RxList<TaxiOrder> pastOrders;
  final RxList<TaxiOrder> openOrders;
  final RxList<TaxiOrder> currentOrders;
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["openOrders"]}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left,
              ),
            ),
            Obx(
              () => Container(
                child: openOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                          openOrders.length,
                          (index) =>
                              TaxiOpenOrderCard(order: openOrders[index]),
                        ),
                      )
                    : Center(
                        child: Text("${_i18n()["noOrders"]}"),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["currentOrders"]}",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.left,
              ),
            ),
            Obx(
              () => Container(
                child: currentOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                          currentOrders.length,
                          (int index) =>
                              TaxiCurrentOrderCard(order: currentOrders[index]),
                        ),
                      )
                    : Center(
                        child: Text("${_i18n()["noOrders"]}"),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                "${_i18n()["pastOrders"]}",
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
                              TaxiCurrentOrderCard(order: pastOrders[index]),
                        ).reversed.toList(),
                      )
                    : Center(
                        child: Text("${_i18n()["noOrders"]}"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
