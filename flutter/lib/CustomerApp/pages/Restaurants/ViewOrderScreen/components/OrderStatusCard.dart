import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Chat.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:rive/rive.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                orderStatusImage(ordersStates),
                _orderStatusText(context),
                const Spacer(),
                _orderMessageButton(context),
              ],
            ),
          ),
        ),
        _orderHelperText(context)
      ],
    );
  }

  Widget _orderStatusText(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Text(
        getOrderStatus(ordersStates),
        style: Theme.of(context).textTheme.headline3,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _orderHelperText(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        getOrderHelperText(ordersStates),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _orderMessageButton(BuildContext context) {
    return Stack(
      children: <Widget>[
        _messageIcon(context),
        Obx(
          () => Get.find<OrderController>()
                  .orderHaveNewMessageNotifications(order.orderId)
              ? _newMessageRedDot(context)
              : Container(),
        )
      ],
    );
  }

  Widget _messageIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed<void>(
          getMessagesRoute(
            chatId: order.orderId,
            orderId: order.orderId,
            recipientType: ParticipantType.Restaurant,
          ),
        );
      },
      icon: Icon(
        Icons.textsms,
        color: customerAppColor,
      ),
    );
  }
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
        color: const Color(0xffff0000),
      ),
    ),
  );
}

Widget orderStatusImage(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Ionicons.close_circle,
          size: 40,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Ionicons.close_circle,
          size: 40,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.flatware_rounded,
          size: 40,
          color: customerAppColor,
        ),
      );
    case RestaurantOrderStatus.PreparingOrder:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/cooking.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.OnTheWay:
      return Container(
        height: 50,
        width: 60,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.ReadyForPickup:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.check_circle,
          size: 40,
          color: lightCustomerAppColor,
        ),
      );

    case RestaurantOrderStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child:
            Icon(Ionicons.checkmark_circle, size: 40, color: customerAppColor),
      );
  }
}

String getOrderStatus(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${_i18n()["canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${_i18n()["canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${_i18n()["received"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${_i18n()["preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${_i18n()["onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${_i18n()["readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${_i18n()["delivered"]}';

    default:
      return 'Unknown status';
  }
}

String getOrderHelperText(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${_i18n()["helperText-canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${_i18n()["helperText-canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${_i18n()["helperText-received"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${_i18n()["helperText-preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${_i18n()["helperText-onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${_i18n()["helperText-readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${_i18n()["helperText-delivered"]}';

    default:
      return 'Unknown status';
  }
}
