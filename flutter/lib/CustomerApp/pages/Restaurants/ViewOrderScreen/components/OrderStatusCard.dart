import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
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
              ],
            ),
          ),
        ),
        if (getEstimatedText() != null)
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              getEstimatedText()!,
              textAlign: TextAlign.center,
            ),
          ),
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

  String? getEstimatedText() {
    switch (order.status) {
      case RestaurantOrderStatus.PreparingOrder:
        if (order.estimatedFoodReadyTime != null) {
          return order.estimatedFoodReadyTime!.getEstimatedTime();
        }

        break;
      case RestaurantOrderStatus.ReadyForPickup:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return order.estimatedPickupFromServiceProviderTime!
              .getEstimatedTime();
        }
        break;
      case RestaurantOrderStatus.OnTheWay:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return order.estimatedDropoffAtCustomerTime!.getEstimatedTime();
        }

        break;

      default:
        return null;
    }
    return null;
  }
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
          color: primaryBlueColor,
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
          color: SecondaryLightBlueColor,
        ),
      );

    case RestaurantOrderStatus.Delivered:
      return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child:
            Icon(Ionicons.checkmark_circle, size: 40, color: primaryBlueColor),
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
