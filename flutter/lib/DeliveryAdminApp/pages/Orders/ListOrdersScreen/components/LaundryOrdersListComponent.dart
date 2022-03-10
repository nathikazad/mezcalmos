import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'LaundryOrderCard.dart';

class LaundryOrdersList extends StatelessWidget {
  /// Component responsible of building  laundry orders list inside the tabbarview of the delivery admin app
  LaundryOrdersList(
      {Key? key, required this.pastOrders, required this.currentOrders})
      : super(key: key);
  final RxList<LaundryOrder> pastOrders;
  final RxList<LaundryOrder> currentOrders;
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(lang.strings["customer"]["orders"]["title"],
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: 8,
            ),
            Obx(
              ()=> Container(
                child: currentOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                            currentOrders.length,
                            (index) =>
                                LaundryOrderCard(order: currentOrders[index])),
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
              ()=> Container(
                child: pastOrders.isNotEmpty
                    ? Column(
                        children: List.generate(
                            pastOrders.length,
                            (index) =>
                                LaundryOrderCard(order: pastOrders[index])),
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
