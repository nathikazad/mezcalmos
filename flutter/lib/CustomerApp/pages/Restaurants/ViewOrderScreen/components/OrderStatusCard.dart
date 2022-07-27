import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrderStatusCard"];

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
    return Card(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            orderStatusImage(ordersStates),
            _orderStatusText(context),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderEtaTimeWidget() {
    return Container(
        padding: const EdgeInsets.only(top: 3, left: 5),
        child: Text(
          _getEstimatedText()!,
          textAlign: TextAlign.center,
        ));
  }

  Widget _orderStatusText(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              order.getOrderStatus(),
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontSize: 14.sp),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (_getEstimatedText() != null) _orderEtaTimeWidget()
        ],
      ),
    );
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case RestaurantOrderStatus.PreparingOrder:
        if (order.estimatedFoodReadyTime != null) {
          return "${_i18n()["willBePicked"]}\n${order.estimatedFoodReadyTime!.getEstimatedTime()}";
        }

        break;
      case RestaurantOrderStatus.ReadyForPickup:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return "${_i18n()["willBePicked"]}\n${order.estimatedPickupFromServiceProviderTime!.getEstimatedTime()}";
        }
        break;
      case RestaurantOrderStatus.OnTheWay:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return "${_i18n()["willBeDelivered"]}\n${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
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

    case RestaurantOrderStatus.CancelledByCustomer:
      return Container(
        padding: const EdgeInsets.all(5),
        decoration:
            BoxDecoration(color: Color(0xFFF9D8D6), shape: BoxShape.circle),
        child: Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        ),
      );

    case RestaurantOrderStatus.OrderReceieved:
      return Container(
        // padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.flatware_rounded,
          size: 40,
          color: primaryBlueColor,
        ),
      );
    case RestaurantOrderStatus.PreparingOrder:
      return Container(
        height: 50,
        width: 50,
        child: RiveAnimation.asset(
          "assets/animation/cooking.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.OnTheWay:
      return Container(
        height: 50,
        width: 50,
        child: RiveAnimation.asset(
          "assets/animation/motorbikeWithSmokeAnimation.riv",
          fit: BoxFit.cover,
        ),
      );
    case RestaurantOrderStatus.ReadyForPickup:
      return Container(
        // padding: const EdgeInsets.only(right: 10.0),
        child: Icon(
          Icons.check_circle,
          size: 40,
          color: primaryBlueColor,
        ),
      );

    case RestaurantOrderStatus.Delivered:
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: secondaryLightBlueColor, shape: BoxShape.circle),
        child: Icon(
          Icons.check,
          size: 25,
          color: primaryBlueColor,
        ),
      );
  }
}

// String getOrderStatus(RestaurantOrderStatus status) {
//   switch (status) {
//     case RestaurantOrderStatus.CancelledByAdmin:
//       return '${_i18n()["canceledByAdmin"]}';
//     case RestaurantOrderStatus.CancelledByCustomer:
//       return '${_i18n()["canceledByCustomer"]}';
//     case RestaurantOrderStatus.OrderReceieved:
//       return '${_i18n()["received"]}';
//     case RestaurantOrderStatus.PreparingOrder:
//       return '${_i18n()["preparing"]}';
//     case RestaurantOrderStatus.OnTheWay:
//       return '${_i18n()["onTheWay"]}';
//     case RestaurantOrderStatus.ReadyForPickup:
//       return '${_i18n()["readyForPickUp"]}';
//     case RestaurantOrderStatus.Delivered:
//       return '${_i18n()["delivered"]}';

//     default:
//       return 'Unknown status';
//   }
// }
