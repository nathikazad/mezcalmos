import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/pages/CurrentOrders/CurrentOrderViewScreen/Laundry/Components/LaundryControllButtons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"];

class DriverLaundryBottomButtons extends StatelessWidget {
  LaundryOrder order;
  DriverLaundryBottomButtons({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        color: (order.inDeliveryPhase())
            ? Theme.of(context).primaryColorLight
            : Colors.transparent,
        child: getBottomComponent(textTheme: Theme.of(context).textTheme));
  }

  Widget getBottomComponent({required TextTheme textTheme}) {
    if (order.inProcess() && order.status != LaundryOrderStatus.AtLaundry) {
      return LaundryControllButtons(order: order);
    } else if (order.status == LaundryOrderStatus.Delivered) {
      return _orderDeliveredBottomComponent(textTheme);
    } else if (order.status == LaundryOrderStatus.AtLaundry) {
      return _orderAtLaundry();
    } else if (order.status == LaundryOrderStatus.CancelledByAdmin ||
        order.status == LaundryOrderStatus.CancelledByCustomer) {
      return _orderBottomCanceledComponent(textTheme);
    } else {
      return Container(
        height: 1,
      );
    }
  }

  // Widget At laundry ......-------->>>>>>>>>>>
  Widget _orderAtLaundry() {
    if (order.dropoffDriver != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.timer,
              color: Colors.grey.shade600,
              size: 30.sp,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Waiting for order",
                  style: Get.textTheme.bodyText1,
                ),
                Text(
                  "Order is not ready for delivery yet .",
                  style: Get.textTheme.subtitle1,
                )
              ],
            ))
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30.sp,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_i18n()["orderStatus"]["delivered"]}",
                  style: Get.textTheme.bodyText1,
                ),
                Text(
                  DateFormat('dd MMM yy h:m').format(order.orderTime),
                  style: Get.textTheme.subtitle1,
                )
              ],
            ))
          ],
        ),
      );
    }
  }

// Component to be place at the bottom when order is canceled
  Widget _orderBottomCanceledComponent(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          Icon(
            Icons.cancel,
            color: Colors.redAccent,
            size: 30.sp,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["orderStatus"]["canceled"]}",
                style: textTheme.bodyText1,
              ),
              Text(
                DateFormat('dd MMM yy h:m').format(order.orderTime),
                style: textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }

// Component to be place at the bottom when order is deliverd
  Widget _orderDeliveredBottomComponent(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 30.sp,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${_i18n()["orderStatus"]["delivered"]}",
                style: textTheme.bodyText1,
              ),
              Text(
                DateFormat('dd MMM yy h:m').format(order.orderTime),
                style: textTheme.subtitle1,
              )
            ],
          ))
        ],
      ),
    );
  }
}
