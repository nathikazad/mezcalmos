import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
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

LanguageController lang = Get.find<LanguageController>();

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
      return lang.strings['deliveryAdminApp']['laundry']['orderReceived'];
    case LaundryOrdersStatus.OtwPickup:
      return lang.strings['deliveryAdminApp']['laundry']['otwPickUp'];
    case LaundryOrdersStatus.PickedUp:
      return lang.strings['deliveryAdminApp']['laundry']['pickedUp'];
    case LaundryOrdersStatus.AtLaundry:
      return lang.strings['deliveryAdminApp']['laundry']['atLaundry'];
    case LaundryOrdersStatus.ReadyForDelivery:
      return lang.strings['deliveryAdminApp']['laundry']['readyForDelivery'];
    case LaundryOrdersStatus.OtwDelivery:
      return lang.strings['deliveryAdminApp']['laundry']['otwDelivery'];
    case LaundryOrdersStatus.Delivered:
      return lang.strings['deliveryAdminApp']['laundry']['delivered'];
    default:
      return 'Unknown Status';
  }
}
