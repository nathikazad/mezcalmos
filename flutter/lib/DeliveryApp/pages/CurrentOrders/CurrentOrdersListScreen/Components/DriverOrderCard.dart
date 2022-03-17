import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrdersListScreen"]["Components"]
    ["DriverOrderCard"];

class DriverOrderCard extends StatelessWidget {
  /// Order card for delivery driver used to show current or past order ,
  /// showLeftIcon shoud be false when a current order is passed to this component

  DriverOrderCard({Key? key, required this.order, this.showLeftIcon = true})
      : super(key: key);
  final Order order;
  final bool showLeftIcon;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (order.orderType == OrderType.Restaurant) {
            Get.toNamed(getRestaurantOrderRoute(order.orderId));
          } else if (order.orderType == OrderType.Laundry) {
            Get.toNamed(getLaundryOrderRoute(order.orderId));
          }
        },
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _getOrderIcon(context),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 6,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getOrderTitle(),
                          style: textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              size: 12.sp,
                            ),
                            Flexible(
                                child: Text(
                              order.to.address,
                              maxLines: 1,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  if (showLeftIcon) _getOrderWidget(),
                ],
              ),
              Divider(
                thickness: 0.3,
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule_rounded,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(DateFormat('dd MMM yy h:m')
                      .format(order.orderTime.toLocal())),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 12.sp)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getOrderIcon(context) {
    if (order.orderType == OrderType.Restaurant) {
      return Icon(
        Icons.food_bank,
        size: 45.sp,
        color: Theme.of(context).primaryColorLight,
      );
    } else if ((order as LaundryOrder).getCurrentPhase() ==
        LaundryOrderPhase.Dropoff) {
      return Icon(
        Icons.local_laundry_service_rounded,
        size: 45.sp,
        color: Theme.of(context).primaryColorLight,
      );
    } else {
      return CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(order.customer.image),
      );
    }
  }

  Widget _getOrderWidget() {
    if (order.orderType == OrderType.Restaurant) {
      switch ((order as RestaurantOrder).status) {
        case RestaurantOrderStatus.CancelledByAdmin:
        case RestaurantOrderStatus.CancelledByCustomer:
          return Icon(
            Icons.cancel,
            color: Colors.red,
            size: 40.sp,
          );
        case RestaurantOrderStatus.Delivered:
          return Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 40.sp,
          );

        default:
          return Container();
      }
    } else {
      switch ((order as LaundryOrder).status) {
        case LaundryOrderStatus.CancelledByAdmin:
        case LaundryOrderStatus.CancelledByCustomer:
          return Icon(
            Icons.cancel,
            color: Colors.red,
            size: 40.sp,
          );
        case LaundryOrderStatus.Delivered:
        case LaundryOrderStatus.AtLaundry:
          return Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 40.sp,
          );

        default:
          return Container();
      }
    }
  }

  String _getOrderTitle() {
    if (order.orderType == OrderType.Restaurant) {
      return "${_i18n()['orderTitle']['restaurantDelivery']}";
    } else if ((order as LaundryOrder).getCurrentPhase() ==
            LaundryOrderPhase.Dropoff &&
        (order as LaundryOrder).status != LaundryOrderStatus.AtLaundry) {
      return "${_i18n()['orderTitle']['laundryPickup']}";
    } else {
      return "${_i18n()['orderTitle']['laundryDelivery']}";
    }
  }
}
