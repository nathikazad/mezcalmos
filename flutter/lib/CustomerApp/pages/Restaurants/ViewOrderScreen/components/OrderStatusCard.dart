import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/RestaurantOrderHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
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
    return Column(
      children: [
        Card(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                order.orderStatusImage(),
                _orderStatusText(context),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
        if (_getEstimatedText() != null) _estTimeWidget()
      ],
    );
  }

  Widget _estTimeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getEstTimeTitle(),
                      style: Get.textTheme.bodyText2,
                    ),
                    Text(_getEstimatedText()!.inCaps,
                        style: Get.textTheme.bodyText1),
                  ],
                ))
              ],
            ),
          ),
        ),
      ],
    );
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
          // if (_getEstimatedText() != null) _orderEtaTimeWidget()
        ],
      ),
    );
  }

  String? _getEstimatedText() {
    switch (order.status) {
      case RestaurantOrderStatus.PreparingOrder:
        if (order.estimatedFoodReadyTime != null) {
          return "${order.estimatedFoodReadyTime!.getEstimatedTime()}";
        }

        break;
      case RestaurantOrderStatus.ReadyForPickup:
        if (order.estimatedPickupFromServiceProviderTime != null) {
          return "${order.estimatedPickupFromServiceProviderTime!.getEstimatedTime()}";
        }
        break;
      case RestaurantOrderStatus.OnTheWay:
        if (order.estimatedDropoffAtCustomerTime != null) {
          return "${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
        }

        break;

      default:
        return null;
    }
    return null;
  }

  String _getEstTimeTitle() {
    switch (order.status) {
      case RestaurantOrderStatus.OrderReceieved:
      case RestaurantOrderStatus.PreparingOrder:
        return '${_i18n()["willBeReady"]}';
      case RestaurantOrderStatus.ReadyForPickup:
        return '${_i18n()["willBePicked"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["willBeDelivered"]}';

      default:
        return "";
    }
  }
}
