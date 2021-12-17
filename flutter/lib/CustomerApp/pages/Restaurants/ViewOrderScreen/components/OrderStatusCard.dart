import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:rive/rive.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    Key? key,
    required this.ordersStates,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  final RestaurantOrderStatus ordersStates;

  @override
  Widget build(BuildContext context) {
    mezDbgPrint('Card Rebuild : ' + ordersStates.toString());
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getOrderWidget(ordersStates),
                Flexible(
                    child: Text(
                  getOrderStatus(ordersStates),
                  style: txt.headline3,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
                Material(
                  color: Theme.of(context).primaryColorLight,
                  shape: CircleBorder(),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(getRestaurantMessagesRoute(order.orderId));
                    },
                    customBorder: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Icon(
                        Icons.textsms,
                        color: Colors.white,
                      ),
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
              getOrderHelperText(ordersStates),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}

Widget getOrderWidget(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return Icon(
        Ionicons.bag_remove,
        size: 40.w,
        color: Colors.red,
      );

    case RestaurantOrderStatus.CancelledByCustomer:
      return Icon(
        Ionicons.bag_remove,
        size: 40.w,
        color: Colors.red,
      );

    case RestaurantOrderStatus.OrderReceieved:
      return Icon(
        Icons.hourglass_bottom_rounded,
        size: 40.w,
        color: Colors.grey,
      );
    case RestaurantOrderStatus.PreparingOrder:
      return Container(
        height: 40.h,
        width: 80.w,
        child: RiveAnimation.asset(
          "assets/animation/cooking.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.OnTheWay:
      return Container(
        height: 40.h,
        width: 80.w,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.ReadyForPickup:
      return Icon(
        Ionicons.bag,
        size: 40.w,
        color: Colors.grey,
      );

    case RestaurantOrderStatus.Delivered:
      return Icon(
        Ionicons.bag_check,
        size: 40.w,
        color: Colors.green,
      );
  }
}

String getOrderStatus(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return 'Order Canceled';
    case RestaurantOrderStatus.CancelledByCustomer:
      return 'Order Canceled';
    case RestaurantOrderStatus.OrderReceieved:
      return 'Order Recieved';
    case RestaurantOrderStatus.PreparingOrder:
      return 'Preparing Order';
    case RestaurantOrderStatus.OnTheWay:
      return 'Order on the way';
    case RestaurantOrderStatus.ReadyForPickup:
      return 'Order ready for pickup';
    case RestaurantOrderStatus.Delivered:
      return 'Order Delivered';

    default:
      return 'Unknown status';
  }
}

String getOrderHelperText(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return 'Your order is canceled by the Restaurant';
    case RestaurantOrderStatus.CancelledByCustomer:
      return 'Your order is canceled by the customer';
    case RestaurantOrderStatus.OrderReceieved:
      return 'Your order is recieved by the restaurant';
    case RestaurantOrderStatus.PreparingOrder:
      return 'Your order is being prepared by the restaurant';
    case RestaurantOrderStatus.OnTheWay:
      return 'Your order is on the way';
    case RestaurantOrderStatus.ReadyForPickup:
      return 'Your order is prepared and ready for pickup by the delivery driver';
    case RestaurantOrderStatus.Delivered:
      return 'Your order has been successfully delivered';

    default:
      return 'Unknown status';
  }
}
