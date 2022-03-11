import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'TaxiCurrentOrderCard.dart';
import 'TaxiOpenOrderCard.dart';

class TaxiOrdersList extends StatelessWidget {
  /// Component responsible of building the taxi orders list inside the tabbarview of the delivery admin app
  TaxiOrdersList(
      {Key? key,
      required this.pastOrders,
      required this.currentOrders,
      required this.openOrders})
      : super(key: key);
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
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text("Open orders",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
            ),
            Obx(
              () => Container(
                child: openOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                            openOrders.length,
                            (index) =>
                                TaxiOpenOrderCard(order: openOrders[index])),
                      )
                    : Center(
                        child: Text(lang.strings['deliveryAdminApp']['laundry']
                            ['noOrders']),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(lang.strings["customer"]["orders"]["title"],
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
            ),
            Obx(
              () => Container(
                child: currentOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                            currentOrders.length,
                            (index) => TaxiCurrentOrderCard(
                                order: currentOrders[index])),
                      )
                    : Center(
                        child: Text(lang.strings['deliveryAdminApp']['laundry']
                            ['noOrders']),
                      ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                  lang.strings['deliveryAdminApp']['laundry']['pastOrders'],
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: 8,
            ),
            Obx(
              () => Container(
                child: pastOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                            pastOrders.length,
                            (index) => TaxiCurrentOrderCard(
                                order: pastOrders[index])).reversed.toList(),
                      )
                    : Center(
                        child: Text(lang.strings['deliveryAdminApp']['laundry']
                            ['noOrders']),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
