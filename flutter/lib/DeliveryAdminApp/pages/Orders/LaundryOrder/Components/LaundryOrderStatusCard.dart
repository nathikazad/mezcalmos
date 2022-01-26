import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';

class LaundryOrderStatusCard extends StatelessWidget {
  const LaundryOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getOrderWidget(order.status),
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Text(
                getOrderStatus(order.status),
                style: txt.headline3,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getOrderWidget(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
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
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrdersStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
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
        padding: const EdgeInsets.only(right: 0.0),
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

String getOrderHelperText(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByCustomer:
      return 'Order canceled by the customer';

    case LaundryOrdersStatus.CancelledByAdmin:
      return 'you canceled the order';

    case LaundryOrdersStatus.OrderReceieved:
      return 'Order received and will be procceed as soon as possible';
    case LaundryOrdersStatus.OtwPickup:
      return 'Our driver is on the way to pick up your order from your location';
    case LaundryOrdersStatus.PickedUp:
      return 'order picked up from your location successfully';
    case LaundryOrdersStatus.AtLaundry:
      return 'the laundry is processing your order';
    case LaundryOrdersStatus.ReadyForDelivery:
      return 'your order is ready for delivery';
    case LaundryOrdersStatus.OtwDelivery:
      return 'Our driver is on the way to deliver back your order';
    case LaundryOrdersStatus.Delivered:
      return ' Order has been successfully deliverd';
    default:
      return 'Unknown Status';
  }
}
