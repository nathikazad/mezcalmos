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
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Order items',
              style: txt.headline3,
            ),
            Divider(
              thickness: 0.3,
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
      ),
    );
  }
}
