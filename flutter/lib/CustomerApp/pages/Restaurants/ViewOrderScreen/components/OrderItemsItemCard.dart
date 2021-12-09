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
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight.withOpacity(0.2),
              shape: BoxShape.circle),
          padding: EdgeInsets.all(12),
          child: Text(
            item.quantity.toStringAsFixed(0),
            style: txt.headline2!
                .copyWith(color: Theme.of(context).primaryColorLight),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(item.image),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: txt.headline3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
        Spacer(),
        Text(
          item.totalCost.toStringAsFixed(2) + "\$",
          style: txt.headline2!
              .copyWith(color: Theme.of(context).primaryColorLight),
        ),
      ],
    );
  }
}
