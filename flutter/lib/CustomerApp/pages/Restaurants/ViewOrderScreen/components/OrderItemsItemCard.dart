import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class OrderItemsItemCard extends StatelessWidget {
  const OrderItemsItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RestaurantOrderItem item;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(item.image),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                Flexible(
                  flex: 1,
                  child: Text(
                    item.name,
                    style: txt.bodyText1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    item.quantity.toStringAsFixed(0),
                    style: txt.headline2!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(item.totalCost.toStringAsFixed(2) + " \$",
                  style: txt.headline2!),
            )
          ],
        ),
      ),
    );
  }
}
