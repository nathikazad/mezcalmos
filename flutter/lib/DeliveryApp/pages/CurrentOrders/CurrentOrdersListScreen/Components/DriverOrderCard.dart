import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
    ["DriverOrderCard"];

class DriverOrderCard extends StatelessWidget {
  /// Order card for delivery driver used to show current or past order ,
  /// showLeftIcon shoud be false when a current order is passed to this component

  const DriverOrderCard({
    Key? key,
    required this.order,
    this.showLeftIcon = true,
    this.isPastOrder = false,
  }) : super(key: key);
  final Order order;
  final bool isPastOrder;
  final bool showLeftIcon;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return OrderInfosCard(
        orderCardSubWidgets: OrderCardSubWidgets(
            onCardTap: () {
              // Get.toNamed(getOrderDetailsRoute(order.orderId));
              if (order.orderType == OrderType.Restaurant) {
                Get.toNamed(getRestaurantOrderRoute(order.orderId));
              } else if (order.orderType == OrderType.Laundry) {
                Get.toNamed(getLaundryOrderRoute(order.orderId));
              }
            },
            cardTitle: _getOrderTitle(),
            primaryBodyContent: Text(order.to.address),
            cardStatus: _getOrderWidget(),
            cardTime: Text(DateFormat("EEEE, hh:mm a").format(order.orderTime)),
            rightImage: _getOrderIcon()),
        order: order);
    // return Card(
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(10),
    //     onTap: () {
    //       if (order.orderType == OrderType.Restaurant) {
    //         Get.toNamed(getRestaurantOrderRoute(order.orderId));
    //       } else if (order.orderType == OrderType.Laundry) {
    //         Get.toNamed(getLaundryOrderRoute(order.orderId));
    //       }
    //     },
    //     child: Ink(
    //       width: double.infinity,
    //       padding: const EdgeInsets.all(8),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               _getOrderIcon(context),
    //               SizedBox(
    //                 width: 5,
    //               ),
    //               Flexible(
    //                 flex: 6,
    //                 fit: FlexFit.tight,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       _getOrderTitle(),
    //                       style: textTheme.bodyText1,
    //                     ),
    //                     SizedBox(
    //                       height: 5,
    //                     ),
    //                     Row(
    //                       children: [
    //                         Icon(
    //                           Icons.place,
    //                           size: 12.sp,
    //                         ),
    //                         Flexible(
    //                             child: Text(
    //                           order.to.address,
    //                           maxLines: 1,
    //                         )),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Spacer(),
    //               if (showLeftIcon) _getOrderWidget(),
    //             ],
    //           ),
    //           Divider(
    //             thickness: 0.3,
    //             height: 5,
    //           ),
    //           Row(
    //             children: [
    //               Icon(
    //                 Icons.schedule_rounded,
    //                 size: 12.sp,
    //               ),
    //               SizedBox(
    //                 width: 5,
    //               ),
    //               Text(DateFormat('dd MMM yy h:m')
    //                   .format(order.orderTime.toLocal())),
    //               Spacer(),
    //               Icon(Icons.arrow_forward_ios, size: 12.sp)
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _getOrderIcon() {
    if (order.orderType == OrderType.Restaurant) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Icon(
          Icons.flatware,
          size: 35,
          color: Colors.white,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Icon(
          Icons.local_laundry_service,
          size: 35,
          color: Colors.white,
        ),
      );
    }
  }

  Widget _getOrderWidget() {
    if (order.orderType == OrderType.Restaurant) {
      switch ((order as RestaurantOrder).status) {
        case RestaurantOrderStatus.CancelledByAdmin:
        case RestaurantOrderStatus.CancelledByCustomer:
          return Chip(
              padding: const EdgeInsets.all(5),
              backgroundColor: Colors.red.shade100,
              label: Text(
                "Canceled",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
              ));
        case RestaurantOrderStatus.Delivered:
          return Chip(
              padding: const EdgeInsets.all(5),
              backgroundColor: Colors.green.shade100,
              label: Text(
                "Deliverd",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
              ));

        default:
          return Chip(
              padding: const EdgeInsets.all(5),
              backgroundColor: Colors.amber.shade100,
              label: Text(
                "Waiting",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
              ));
      }
    } else {
      switch ((order as LaundryOrder).status) {
        case LaundryOrderStatus.CancelledByAdmin:
        case LaundryOrderStatus.CancelledByCustomer:
          return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Canceled",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
              ));
        case LaundryOrderStatus.Delivered:
        case LaundryOrderStatus.AtLaundry:
          // return Icon(
          //   Icons.check_circle,
          //   color: Colors.green,
          //   size: 40.sp,
          // );
          return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Deliverd",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
              ));

        default:
          return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Waiting",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
              ));
      }
    }
  }

  String _getOrderTitle() {
    if (order.orderType == OrderType.Restaurant) {
      return "${_i18n()['orderTitle']['restaurantDelivery']}";
    } else if (isPastOrder &&
        (order as LaundryOrder).status == LaundryOrderStatus.AtLaundry) {
      return "${_i18n()['orderTitle']['laundryPickup']}";
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Pickup) {
      return "${_i18n()['orderTitle']['laundryPickup']}";
    } else
      return "${_i18n()['orderTitle']['laundryDelivery']}";
  }
}
