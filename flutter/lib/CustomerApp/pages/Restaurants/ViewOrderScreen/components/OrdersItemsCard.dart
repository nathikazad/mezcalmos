import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

import 'OrderItemsItemCard.dart';

class OrderItemsCard extends StatelessWidget {
  const OrderItemsCard({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<RestaurantOrderItem> items;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(8),
            child: Text(
              'Order items',
              style: txt.headline3,
            ),
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return OrderItemsItemCard(item: items[index]);
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 0.2,
              );
            },
          )
        ],
      ),
    );
  }
}
