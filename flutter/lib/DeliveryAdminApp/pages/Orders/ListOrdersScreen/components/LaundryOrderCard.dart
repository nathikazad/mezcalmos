import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class LaundryOrderCard extends StatelessWidget {
  const LaundryOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      // color: getOrderColor(order.status),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(getLaundryOrderRoute(order.orderId));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    CachedNetworkImageProvider(order.customer.image),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.customer.name,
                      style: txt.bodyText1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('\$40/KG'),
                        if (order.weight != null)
                          Text("\$${order.weight! * 40}"),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timelapse_rounded,
                              size: 16.sp,
                            ),
                            Text(
                              DateFormat(' hh:mm a').format(
                                order.orderTime.toLocal(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              getOrderWidget(order.status),
            ],
          ),
        ),
      ),
    );
  }
}

Color getOrderColor(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return Colors.red.withOpacity(0.1);

    case LaundryOrderStatus.CancelledByCustomer:
      return Colors.red.withOpacity(0.1);

    case LaundryOrderStatus.OrderReceieved:
      return Colors.white;

    case LaundryOrderStatus.OtwPickup:
      return Colors.blueAccent.withOpacity(0.1);

    case LaundryOrderStatus.PickedUp:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrderStatus.AtLaundry:
      return Colors.purple.withOpacity(0.1);

    case LaundryOrderStatus.ReadyForDelivery:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrderStatus.OtwDelivery:
      return Colors.purple.withOpacity(0.1);

    case LaundryOrderStatus.Delivered:
      return Colors.green.withOpacity(0.1);
  }
}

Widget getOrderWidget(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrderStatus.OtwPickup:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrderStatus.PickedUp:
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrderStatus.AtLaundry:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrderStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.dry_cleaning_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );
    case LaundryOrderStatus.OtwDelivery:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrderStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.green,
        ),
      );
  }
}

String getOrderStatus(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return 'Order Canceled';

    case LaundryOrderStatus.CancelledByCustomer:
      return 'Order Canceled';

    case LaundryOrderStatus.OrderReceieved:
      return 'Order Received';
    case LaundryOrderStatus.OtwPickup:
      return 'Pick-up On the way';
    case LaundryOrderStatus.PickedUp:
      return 'Order picked-up';
    case LaundryOrderStatus.AtLaundry:
      return 'Order at laundry';
    case LaundryOrderStatus.ReadyForDelivery:
      return 'Ready For Delivery';
    case LaundryOrderStatus.OtwDelivery:
      return 'Delivery on the way';
    case LaundryOrderStatus.Delivered:
      return 'Order Delivered';
    default:
      return 'Unknown Status';
  }
}
