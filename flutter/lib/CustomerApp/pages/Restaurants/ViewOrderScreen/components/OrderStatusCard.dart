import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    Key? key,
    required this.helperText,
    required this.ordersStates,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;
  final String helperText;
  final RestaurantOrderStatus ordersStates;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (ordersStates == RestaurantOrderStatus.Delivered ||
                    ordersStates == RestaurantOrderStatus.OnTheWay ||
                    ordersStates == RestaurantOrderStatus.ReadyForPickup)
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  )
                : (ordersStates == RestaurantOrderStatus.CancelledByAdmin ||
                        ordersStates ==
                            RestaurantOrderStatus.CancelledByCustomer)
                    ? Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 40,
                      )
                    : CircularProgressIndicator(),
            SizedBox(
              width: 5,
            ),
            Flexible(
              child: Card(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            CachedNetworkImageProvider(order.restaurant.image),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.restaurant.name,
                                style: txt.subtitle1,
                              ),
                              Text(
                                getOrderStatus(ordersStates),
                                style: txt.headline3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          )),
                      Spacer(),
                      Material(
                        color: Theme.of(context).primaryColorLight,
                        shape: CircleBorder(),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                                getRestaurantMessagesRoute(order.orderId));
                          },
                          customBorder: CircleBorder(),
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Icon(
                              Ionicons.chatbubble_ellipses,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.centerRight,
            child: Text(getOrderHelperText(ordersStates)))
      ],
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
      return 'Order Prepared';
    case RestaurantOrderStatus.ReadyForPickup:
      return 'Order prepared';
    case RestaurantOrderStatus.Delivered:
      return 'Order Delivered';

    default:
      return 'Unknown status';
  }
}

String getOrderHelperText(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return 'Order Canceled by the Restaurant';
    case RestaurantOrderStatus.CancelledByCustomer:
      return 'Order Canceled by the customer';
    case RestaurantOrderStatus.OrderReceieved:
      return 'Order Recieved by the restaurant';
    case RestaurantOrderStatus.PreparingOrder:
      return 'Your order is being prepared by the restaurant';
    case RestaurantOrderStatus.OnTheWay:
      return 'Your order is ready ';
    case RestaurantOrderStatus.ReadyForPickup:
      return 'Your order is ready';
    case RestaurantOrderStatus.Delivered:
      return 'Your order has been successfully delivered';

    default:
      return 'Unknown status';
  }
}
