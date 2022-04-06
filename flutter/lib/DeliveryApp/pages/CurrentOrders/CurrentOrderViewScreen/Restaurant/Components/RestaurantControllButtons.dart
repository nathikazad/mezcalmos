import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class RestaurantControllButtons extends StatelessWidget {
  /// buttons to controll the restaurant driver order status and the final status of the order (Delivered/Canceled)

  RestaurantControllButtons({Key? key, required this.order}) : super(key: key);
  final RestaurantOrder order;
  RestaurantOrderController restaurantOrderController =
      Get.find<RestaurantOrderController>();

  RxBool clicked = RxBool(false);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    if (!order.inDeliveryPhase()) {
      return Container(
        height: 1,
      );
    } else {
      return Container(
        height: 10.h,
        color: (order.inDeliveryPhase())
            ? Theme.of(context).primaryColorLight
            : Colors.transparent,
        child: Obx(() {
          if (clicked.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else {
            return Column(
              children: [
                if (order.status == RestaurantOrderStatus.ReadyForPickup)
                  TextButton(
                      onPressed: () async {
                        clicked.value = true;
                        if (order.status ==
                            RestaurantOrderStatus.ReadyForPickup) {
                          await restaurantOrderController
                              .startRestaurantDelivery(order.orderId);
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          child: Text(
                              '${_i18n()["RestaurantControllButtons"]["confirmPickup"]}'))),
                if (order.status == RestaurantOrderStatus.Delivered)
                  Row(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_i18n()["orderStatus"]["delivered"]}',
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
                if (order.status == RestaurantOrderStatus.CancelledByAdmin ||
                    order.status == RestaurantOrderStatus.CancelledByCustomer)
                  Row(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_i18n()["orderStatus"]["canceled"]}',
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
                if (order.status == RestaurantOrderStatus.OnTheWay)
                  TextButton(
                      onPressed: () async {
                        clicked.value = true;
                        await restaurantOrderController
                            .finishRestaurantDelivery(order.orderId);
                        // Get.back(closeOverlays: true);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text(
                            '${_i18n()["RestaurantControllButtons"]["confirmDelivery"]}'),
                      ))
              ],
            );
          }
        }),
      );
    }
  }
}
