import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class DriverBottomOrderCard extends StatelessWidget {
  final Order order;
  const DriverBottomOrderCard({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order status',
              style: textTheme.bodyText2,
            ),
            Divider(),
            Row(
              children: [
                _getOrderWidget(context),
                Flexible(
                  flex: 2,
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
                          Text(DateFormat('dd MMM yy h:m')
                              .format(order.orderTime))
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.chat_bubble)),
              ],
            ),
            Divider(),
            // From to component
            _orderFromToComponent(textTheme),
            Divider(),
            // Order bottom card footer component (to be refactored)
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    flex: 2,
                    child: TextButton(
                        onPressed: () {}, child: Text('Confirm Pick-up'))),
                Flexible(
                  flex: 1,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: Text('Cancel')),
                ),
              ],
            ),
            if (1 == 5)
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      Text(
                        'Order deliverd',
                        style: textTheme.bodyText1,
                      ),
                      Text(
                        DateFormat('dd MMM yy h:m').format(order.orderTime),
                        style: textTheme.subtitle1,
                      )
                    ],
                  ))
                ],
              ),
            if (1 == 5)
              Row(
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.redAccent,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Column(
                    children: [
                      Text(
                        'Order canceled',
                        style: textTheme.bodyText1,
                      ),
                      Text(
                        DateFormat('dd MMM yy h:m').format(order.orderTime),
                        style: textTheme.subtitle1,
                      )
                    ],
                  ))
                ],
              ),
            if (1 == 5)
              TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Confirm delivery'),
                  ))
          ],
        ),
      ),
    );
  }

  Column _orderFromToComponent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (order.serviceProvider != null)
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    CachedNetworkImageProvider(order.serviceProvider!.image),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(order.serviceProvider!.name),
                ],
              )
            ],
          ),
        Container(
          height: 30,
          width: 10,
          color: Colors.grey.shade300,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(order.customer.image),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                children: [
                  Text(order.customer.name),
                  Text(
                    order.to.address,
                    style: textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
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
