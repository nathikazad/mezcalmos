import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

class LaundryOrderCard extends StatelessWidget {
  final LaundryOrder order;

  const LaundryOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      // color: getOrderColor(order.status),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          MezRouter.toNamed(getLaundryOrderRoute(order.orderId));
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
                        // if (order.costsByType?.totalWeigh != null)
                        //   Text("\$${order.weight! * 40}"),
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

    case LaundryOrderStatus.OrderReceived:
      return Colors.white;

    case LaundryOrderStatus.OtwPickupFromCustomer:
      return Colors.blueAccent.withOpacity(0.1);

    case LaundryOrderStatus.PickedUpFromCustomer:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrderStatus.AtLaundry:
      return Colors.purple.withOpacity(0.1);

    case LaundryOrderStatus.ReadyForDelivery:
      return Colors.grey.withOpacity(0.1);

    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
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

    case LaundryOrderStatus.OrderReceived:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
        ),
      );
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/scooterWashingMachine.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrderStatus.PickedUpFromCustomer:
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
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/scooterWashingMachine.riv",
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

    case LaundryOrderStatus.OrderReceived:
      return 'Order Received';
    case LaundryOrderStatus.OtwPickupFromCustomer:
      return 'Pick-up On the way';
    case LaundryOrderStatus.PickedUpFromCustomer:
      return 'Order picked-up';
    case LaundryOrderStatus.AtLaundry:
      return 'Order at laundry';
    case LaundryOrderStatus.ReadyForDelivery:
      return 'Ready For Delivery';
    case LaundryOrderStatus.OtwPickupFromLaundry:
    case LaundryOrderStatus.PickedUpFromLaundry:
      return 'Delivery on the way';
    case LaundryOrderStatus.Delivered:
      return 'Order Delivered';
    default:
      return 'Unknown Status';
  }
}
