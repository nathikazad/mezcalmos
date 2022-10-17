import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:sizer/sizer.dart';

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
          cardTime: Text(order.orderTime.getOrderTime().inCaps),
          rightImage: _getOrderIcon()),
      order: order,
    );
  }

  Widget _getOrderIcon() {
    if (order.orderType == OrderType.Restaurant) {
      return Container(
        height: 30.sp,
        width: 30.sp,
        // padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Center(
          child: Icon(
            Icons.flatware,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        // padding: const EdgeInsets.all(5),
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryBlueColor,
        ),
        child: Center(
          child: Icon(
            Icons.local_laundry_service,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Widget _getOrderWidget() {
    if (order.orderType == OrderType.Restaurant) {
      if (!(order as RestaurantOrder).isScheduled()) {
        switch ((order as RestaurantOrder).status) {
          case RestaurantOrderStatus.CancelledByAdmin:
          case RestaurantOrderStatus.CancelledByCustomer:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["cancelled"]}",
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
                ),
              ),
            );
          case RestaurantOrderStatus.Delivered:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["delivered"]}",
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
                ),
              ),
            );
          case RestaurantOrderStatus.OnTheWay:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["inTransit"]}",
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
                ),
              ),
            );
          case RestaurantOrderStatus.ReadyForPickup:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["ready"]}",
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
                ),
              ),
            );

          default:
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${_i18n()["waiting"]}",
                  style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
                ),
              ),
            );
        }
      } else {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: secondaryLightBlueColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              "${_i18n()["scheduled"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            ),
          ),
        );
      }
    } else {
      switch ((order as LaundryOrder).status) {
        case LaundryOrderStatus.ReadyForDelivery:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["ready"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
            ),
          );
        case LaundryOrderStatus.OtwPickupFromCustomer:
        case LaundryOrderStatus.OtwPickupFromLaundry:
        case LaundryOrderStatus.PickedUpFromCustomer:
        case LaundryOrderStatus.PickedUpFromLaundry:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["inTransit"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
            ),
          );
        case LaundryOrderStatus.CancelledByAdmin:
        case LaundryOrderStatus.CancelledByCustomer:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["cancelled"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.red),
            ),
          );
        case LaundryOrderStatus.AtLaundry:
          if (isPastOrder == true) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "${_i18n()["delivered"]}",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                "${_i18n()["waiting"]}",
                style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
              ),
            );
          }

        case LaundryOrderStatus.Delivered:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["delivered"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.green),
            ),
          );

        default:
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              "${_i18n()["waiting"]}",
              style: Get.textTheme.bodyText1?.copyWith(color: Colors.amber),
            ),
          );
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
