import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:rive/rive.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["LaundryOrder"]["Components"]["LaundryOrderStatusCard"];

class LaundryOrderStatusCard extends StatelessWidget {
  const LaundryOrderStatusCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final LaundryOrder order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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

Widget getOrderWidget(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.cancel,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
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
        padding: const EdgeInsets.only(right: 0.0),
        child: Icon(
          Icons.local_laundry_service_rounded,
          size: 50,
          color: Color(0xFFAC59FC),
        ),
      );

    case LaundryOrderStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 0.0),
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
        padding: const EdgeInsets.only(right: 0.0),
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
      return _i18n()['orderReceived'];
    case LaundryOrderStatus.OtwPickup:
      return _i18n()['otwPickUp'];
    case LaundryOrderStatus.PickedUp:
      return _i18n()['pickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return _i18n()['atLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return _i18n()['readyForDelivery'];
    case LaundryOrderStatus.OtwDelivery:
      return _i18n()['otwDelivery'];
    case LaundryOrderStatus.Delivered:
      return _i18n()['delivered'];
    default:
      return 'Unknown Status';
  }
}
