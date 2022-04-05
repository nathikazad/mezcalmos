import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["DeliveryAdminApp"]["pages"]
        ["Orders"]["ViewRestaurantOrderScreen"]["components"]["PastOrderInfo"];

// Goes on top of the  order screen to show the order final staus and time only on past order
class PastOrderInfo extends StatelessWidget {
  const PastOrderInfo({
    Key? key,
    required this.order,
  }) : super(key: key);

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              (order.status == RestaurantOrderStatus.Delivered)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              const SizedBox(width: 5),
              Text(
                getOrderStatus(order.status),
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          child: Text(
            getOrderHelperText(order.status) +
                ' \n at ' +
                DateFormat('dd MMM yyyy hh:mm a').format(order.orderTime),
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
        const Divider(),
      ],
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
      return '${_i18n()["helperTextCanceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${_i18n()["helperTextCanceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${_i18n()["helperTextReceived"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${_i18n()["helperTextPreparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${_i18n()["helperTextOnTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${_i18n()["helperTextReadyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${_i18n()["helperTextDelivered"]}';

    default:
      return 'Unknown status';
  }
}
