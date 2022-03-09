import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/orderController.dart';
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
                OrderStatusImage(ordersStates),
                OrderStatus(ordersStates: ordersStates, txt: txt),
                Spacer(),
                MessageButton(order: order),
              ],
            ),
          ),
        ),
        StatusDescription(ordersStates: ordersStates)
      ],
    );
  }
}

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
    required this.ordersStates,
    required this.txt,
  }) : super(key: key);

  final RestaurantOrderStatus ordersStates;
  final TextTheme txt;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Text(
        getOrderStatus(ordersStates),
        style: txt.headline3,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class StatusDescription extends StatelessWidget {
  const StatusDescription({
    Key? key,
    required this.ordersStates,
  }) : super(key: key);

  final RestaurantOrderStatus ordersStates;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(
          getOrderHelperText(ordersStates),
          textAlign: TextAlign.center,
        ));
  }
}

class MessageButton extends StatelessWidget {
  const MessageButton({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColorLight,
      shape: CircleBorder(),
      child: InkWell(
        onTap: () {
          Get.toNamed(getMessagesRoute(
              chatId: order.orderId,
              recipientType: ParticipantType.Restaurant));
        },
        customBorder: CircleBorder(),
        child: Stack(
          children: [
            MessageIcon(),
            Obx(
              () => Get.find<OrderController>()
                      .orderHaveNewMessageNotifications(order.orderId)
                  ? NewMessageRedDot()
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

class MessageIcon extends StatelessWidget {
  const MessageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Icon(
        Icons.textsms,
        color: Colors.white,
      ),
    );
  }
}

class NewMessageRedDot extends StatelessWidget {
  const NewMessageRedDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 27,
      top: 10,
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
}

Widget OrderStatusImage(RestaurantOrderStatus status) {
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
          size: 50,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.CancelledByCustomer:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag_remove,
          size: 50,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.OrderReceieved:
      return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.hourglass_bottom_rounded,
          size: 50,
          color: Colors.grey,
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
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Ionicons.bag,
          size: 50,
          color: Colors.grey,
        ),
      );

    case RestaurantOrderStatus.Delivered:
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
