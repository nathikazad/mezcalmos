import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:sizer/sizer.dart';

class DriverOrderCard extends StatelessWidget {
  final Order order;
  const DriverOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(getCurrentOrderRoute(order.orderId));
        },
        child: Ink(
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
                      style: textTheme.headline3,
                    ),
                    Divider(
                      thickness: 0.2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 15.sp,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(DateFormat('dd MMM yy h:m')
                            .format(order.orderTime)),
                        Spacer(),
                        Text(
                          " \$${order.cost.toInt().toString()}",
                          style: textTheme.headline3,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getOrderWidget(context) {
    switch (order.orderType) {
      case OrderType.Restaurant:
        return Icon(
          Icons.food_bank,
          size: 50.sp,
          color: Theme.of(context).primaryColorLight,
        );
      case OrderType.Laundry:
        return Icon(
          Icons.local_laundry_service_rounded,
          size: 50.sp,
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
