import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';
import 'buildOrders.dart';

class RestaurantOrdersList extends StatelessWidget {
  /// Component responsible of building the restaurant orders list inside the tabbarview of the delivery admin app
  RestaurantOrdersList(
      {Key? key, required this.pastOrders, required this.currentOrders})
      : super(key: key);
  final RxList<RestaurantOrder> pastOrders;
  final RxList<RestaurantOrder> currentOrders;
  LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Container(
            child: currentOrders.value.length > 0
                ? buildOrders(currentOrders)
                : Center(
                    child: Text(lang.strings['deliveryAdminApp']['laundry']
                        ['noOrders']),
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
          Container(
            child: pastOrders.value.length > 0
                ? buildOrders(pastOrders)
                : Center(
                    child: Text(lang.strings['deliveryAdminApp']['laundry']
                        ['noOrders']),
                  ),
          ),
        ],
      ),
    );
  }
}
