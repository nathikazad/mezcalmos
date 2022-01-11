import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

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
            children: [
              (order.status == RestaurantOrderStatus.Delivered)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              SizedBox(
                width: 5,
              ),
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
        Divider(),
      ],
    );
  }
}

String getOrderStatus(RestaurantOrderStatus status) {
  LanguageController lang = Get.find<LanguageController>();
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["recievied"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["delivered"]}';

    default:
      return 'Unknown status';
  }
}

String getOrderHelperText(RestaurantOrderStatus status) {
  LanguageController lang = Get.find<LanguageController>();
  switch (status) {
    case RestaurantOrderStatus.CancelledByAdmin:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["canceledByAdmin"]}';
    case RestaurantOrderStatus.CancelledByCustomer:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["canceledByCustomer"]}';
    case RestaurantOrderStatus.OrderReceieved:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["recievied"]}';
    case RestaurantOrderStatus.PreparingOrder:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["preparing"]}';
    case RestaurantOrderStatus.OnTheWay:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["onTheWay"]}';
    case RestaurantOrderStatus.ReadyForPickup:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["readyForPickUp"]}';
    case RestaurantOrderStatus.Delivered:
      return '${lang.strings["customer"]["restaurant"]["orderStatus"]["helperText"]["delivered"]}';

    default:
      return 'Unknown status';
  }
}
