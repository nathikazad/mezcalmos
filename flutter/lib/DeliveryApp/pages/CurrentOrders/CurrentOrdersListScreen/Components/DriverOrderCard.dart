import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DriverOrderCard extends StatelessWidget {
  final Order order;
  const DriverOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            _getOrderWidget(context),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getOrderTitle(),
                    style: textTheme.bodyText1,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timelapse_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text(DateFormat('dd MMM yy h:m').format(order.orderTime))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getOrderWidget(context) {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Icon(
          Icons.food_bank,
          size: 30.sp,
          color: Theme.of(context).primaryColorLight,
        );
      case OrderType.Laundry:
        return Icon(
          Icons.food_bank,
          size: 30.sp,
          color: Theme.of(context).primaryColorLight,
        );

      default:
        return CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(order.customer.image),
        );
    }
  }

  String _getOrderTitle() {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return 'Restaurant Delivery';

      case OrderType.Laundry:
        return 'Laundry Delivery';
      default:
        return 'Order';
    }
  }
}
