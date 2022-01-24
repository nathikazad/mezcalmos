import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
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
                Material(
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
                                  .orderHaveNewMessageNotifications(
                                      order.orderId)
                              ? Positioned(
                                  left: 27,
                                  top: 10,
                                  child: Container(
                                    width: 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xfff6efff),
                                            width: 2),
                                        color: const Color(0xffff0000)),
                                  ),
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ),
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
}

Widget getOrderWidget(LaundryOrdersStatus status) {
  switch (status) {
    case LaundryOrdersStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
          size: 50,
          color: Colors.red,
        ),
      );

    case LaundryOrdersStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
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
          "assets/animation/cooking.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.PickedUp:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case LaundryOrdersStatus.AtLaundry:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag,
          size: 50,
          color: Colors.grey,
        ),
      );

    case LaundryOrdersStatus.ReadyForDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_check,
          size: 50,
          color: Colors.green,
        ),
      );
    case LaundryOrdersStatus.OtwDelivery:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_check,
          size: 50,
          color: Colors.green,
        ),
      );
    case LaundryOrdersStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_check,
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
    case LaundryOrdersStatus.CancelledByAdmin:
      return '';

    case LaundryOrdersStatus.CancelledByCustomer:
      return '';

    case LaundryOrdersStatus.OrderReceieved:
      return '';
    case LaundryOrdersStatus.OtwPickup:
      return '';
    case LaundryOrdersStatus.PickedUp:
      return '';
    case LaundryOrdersStatus.AtLaundry:
      return '';
    case LaundryOrdersStatus.ReadyForDelivery:
      return '';
    case LaundryOrdersStatus.OtwDelivery:
      return '';
    case LaundryOrdersStatus.Delivered:
      return '';
    default:
      return 'Unknown Status';
  }
}
