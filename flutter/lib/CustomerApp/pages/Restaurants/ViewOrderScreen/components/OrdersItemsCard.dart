import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

import 'OrderItemsItemCard.dart';

class OrderItemsCard extends StatelessWidget {
  OrderItemsCard({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<RestaurantOrderItem> items;

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${lang.strings["customer"]["restaurant"]["checkout"]["orderItems"]}',
              style: txt.bodyText1,
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return OrderItemsItemCard(item: items[index]);
            },
          )
        ],
      ),
    );
  }
}
