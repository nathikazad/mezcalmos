import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
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
                Spacer(),
                messageButton(context),
              ],
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              getOrderHelperText(order.status),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  Widget messageButton(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColorLight,
      shape: CircleBorder(),
      child: InkWell(
        onTap: () {
          // Get.toNamed(getRestaurantMessagesRoute(order.orderId));
        },
        customBorder: CircleBorder(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              child: Icon(
                Icons.textsms,
                color: Colors.white,
              ),
            ),
            Obx(
              () => Get.find<OrderController>()
                      .orderHaveNewMessageNotifications(order.orderId)
                  ? Positioned(
                      left: 27,
                      top: 10,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xfff6efff), width: 2),
                            color: const Color(0xffff0000)),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

LanguageController lang = Get.find<LanguageController>();
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
      return lang.strings['deliveryAdminApp']['laundry']['orderReceived'];
    case LaundryOrderStatus.OtwPickup:
      return lang.strings['deliveryAdminApp']['laundry']['otwPickUp'];
    case LaundryOrderStatus.PickedUp:
      return lang.strings['deliveryAdminApp']['laundry']['pickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return lang.strings['deliveryAdminApp']['laundry']['atLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return lang.strings['deliveryAdminApp']['laundry']['readyForDelivery'];
    case LaundryOrderStatus.OtwDelivery:
      return lang.strings['deliveryAdminApp']['laundry']['otwDelivery'];
    case LaundryOrderStatus.Delivered:
      return lang.strings['deliveryAdminApp']['laundry']['delivered'];
    default:
      return 'Unknown Status';
  }
}

String getOrderHelperText(LaundryOrderStatus status) {
  switch (status) {
    case LaundryOrderStatus.CancelledByAdmin:
      return lang.strings['customer']['laundry']['orderHelper']
          ['cancelByAdmin'];

    case LaundryOrderStatus.CancelledByCustomer:
      return lang.strings['customer']['laundry']['orderHelper']['cancelByUser'];

    case LaundryOrderStatus.OrderReceieved:
      return lang.strings['customer']['laundry']['orderHelper']['received'];
    case LaundryOrderStatus.OtwPickup:
      return lang.strings['customer']['laundry']['orderHelper']['otwPickup'];
    case LaundryOrderStatus.PickedUp:
      return lang.strings['customer']['laundry']['orderHelper']['pickedUp'];
    case LaundryOrderStatus.AtLaundry:
      return lang.strings['customer']['laundry']['orderHelper']['atLaundry'];
    case LaundryOrderStatus.ReadyForDelivery:
      return lang.strings['customer']['laundry']['orderHelper']['ready'];
    case LaundryOrderStatus.OtwDelivery:
      return lang.strings['customer']['laundry']['orderHelper']['otwDelivery'];
    case LaundryOrderStatus.Delivered:
      return lang.strings['customer']['laundry']['orderHelper']['delivered'];
    default:
      return 'Unknown Status';
  }
}
