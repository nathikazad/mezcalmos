import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class LaundryOrderCard extends StatelessWidget {
  final LaundryOrder order;
  const LaundryOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
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
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    CachedNetworkImageProvider(order.customer.image),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.customer.name,
                      style: txt.bodyText1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('\$15/KG'),
                        Text("\$${order.cost}"),
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse_rounded,
                              size: 16.sp,
                            ),
                            Text(
                              DateFormat(' hh:mm a').format(order.orderTime),
                            ),
                          ],
                        )
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

Color getOrderColor(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return Colors.red.withOpacity(0.1);

    case LaundryOrdersStatus.CancelledByCustomer:
      return Colors.red.withOpacity(0.1);

    case LaundryOrdersStatus.OrderReceieved:
      return Colors.white;

    case LaundryOrdersStatus.OtwPickup:
      return Colors.blueAccent.withOpacity(0.1);

    case LaundryOrdersStatus.PickedUp:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrdersStatus.AtLaundry:
      return Colors.purple.withOpacity(0.1);

    case LaundryOrdersStatus.ReadyForDelivery:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrdersStatus.OtwDelivery:
      return Colors.purple.withOpacity(0.1);

    case LaundryOrdersStatus.Delivered:
      return Colors.green.withOpacity(0.1);
  }
}

Widget getOrderWidget(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrdersStatus.OtwPickup:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.PickedUp:
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Icon(
          Icons.check_circle,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrdersStatus.AtLaundry:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrdersStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.dry_cleaning_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );
    case LaundryOrdersStatus.OtwDelivery:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.Delivered:
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

String getOrderStatus(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return 'Order Canceled';

    case LaundryOrdersStatus.CancelledByCustomer:
      return 'Order Canceled';

    case LaundryOrdersStatus.OrderReceieved:
      return 'Order Received';
    case LaundryOrdersStatus.OtwPickup:
      return 'Pick-up On the way';
    case LaundryOrdersStatus.PickedUp:
      return 'Order picked-up';
    case LaundryOrdersStatus.AtLaundry:
      return 'Order at laundry';
    case LaundryOrdersStatus.ReadyForDelivery:
      return 'Ready For Delivery';
    case LaundryOrdersStatus.OtwDelivery:
      return 'Delivery on the way';
    case LaundryOrdersStatus.Delivered:
      return 'Order Delivered';
    default:
      return 'Unknown Status';
  }
}
