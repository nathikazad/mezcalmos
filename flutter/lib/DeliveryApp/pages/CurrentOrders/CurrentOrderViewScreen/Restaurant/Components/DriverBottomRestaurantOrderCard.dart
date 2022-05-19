import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryApp/controllers/orderController.dart';
import 'package:mezcalmos/DeliveryApp/controllers/restaurantController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['DeliveryApp']
        ['pages']['CurrentOrders']['CurrentOrderViewScreen']['Components']
    ['DriverBottomRestaurantOrderCard'];

class DriverBottomRestaurantOrderCard extends StatelessWidget {
  final RestaurantOrder order;
  DriverBottomRestaurantOrderCard({Key? key, required this.order})
      : super(key: key);
  RestaurantOrderController restaurantOrderController =
      Get.find<RestaurantOrderController>();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _getOrderStatus(),
                  style: textTheme.bodyText2,
                ),
                Divider(),
                _orderHeaderInfo(context, textTheme),
                Divider(),
                // From to component
                _orderFromToComponent(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Order info (order type and time and chat icon)
  Widget _orderHeaderInfo(BuildContext context, TextTheme textTheme) {
    return Row(
      children: [
        Icon(
          Icons.food_bank,
          size: 40.sp,
          color: Theme.of(context).primaryColorLight,
        ),
        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_i18n()["restaurantDelivery"]}',
                style: textTheme.headline3!.copyWith(fontSize: 13.sp),
              ),
              Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    DateFormat('dd MMM yy h:m').format(order.orderTime),
                    style: textTheme.subtitle1,
                  )
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(getMessagesRoute(
                      orderId: order.orderId,
                      chatId: order.serviceProviderDropOffDriverChatId!,
                      // recipientId: order.serviceProviderId,
                      recipientType: ParticipantType.DeliveryAdmin));
                },
                icon: Icon(
                  Icons.textsms_rounded,
                  color: Theme.of(context).primaryColorLight,
                )),
            Obx(
              () {
                return Get.find<OrderController>()
                        .hasNewMessageNotification(order.orderId)
                    ? _newMessageRedDot(context)
                    : Container();
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _newMessageRedDot(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: 13,
        height: 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xfff6efff), width: 2),
            color: const Color(0xffff0000)),
      ),
    );
  }

// Order start point and destination component
  Widget _orderFromToComponent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                  order.serviceProvider?.image ?? ''),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  order.serviceProvider?.name ?? 'Restaunat',
                  style: textTheme.bodyText1,
                ),
              ],
            )
          ],
        ),
        Container(
          height: 30,
          width: 3,
          margin: EdgeInsets.only(left: 16),
          color: Colors.grey.shade500,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(order.customer.image),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.customer.name,
                    style: textTheme.bodyText1,
                  ),
                  Text(
                    order.to.address,
                    style: textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

// get order status readable title
  String _getOrderStatus() {
    switch (order.status) {
      case RestaurantOrderStatus.CancelledByAdmin:
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceled"]}';
      case RestaurantOrderStatus.OrderReceieved:
        return '${_i18n()["orderStatus"]["waiting"]}';
      case RestaurantOrderStatus.PreparingOrder:
        return '${_i18n()["orderStatus"]["preparing"]}';
      case RestaurantOrderStatus.ReadyForPickup:
        return '${_i18n()["orderStatus"]["readyForPickup"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["orderStatus"]["deliveryOtw"]}';
      case RestaurantOrderStatus.Delivered:
        return '${_i18n()["orderStatus"]["delivered"]} ';
      default:
        return '';
    }
  }
}
