import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]
    ["CustomerRestaurantOrderEst"];

class CustomerRestaurantOrderEst extends StatelessWidget {
  const CustomerRestaurantOrderEst({Key? key, required this.order})
      : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getDeliveryTime() != null || _getFoodReadyTime() != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              '${_i18n()["estTimes"]}',
              style: Get.textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_showFoodReadyTime()) _foodReadyTimeWidget(),
                    if (_showFoodReadyTime() && _getDeliveryTime() != null)
                      Divider(),
                    if (_getDeliveryTime() != null) _deliveryTimeWidget()
                  ],
                )),
          ),
        ],
      );
    } else
      return SizedBox();
  }

  Container _deliveryTimeWidget() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            child: Icon(Icons.delivery_dining, color: Colors.white),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                _getDeliveryTime()!,
                style: Get.textTheme.bodyText1,
                maxLines: 2,
              ))
        ],
      ),
    );
  }

  bool _showFoodReadyTime() {
    return (order.status == RestaurantOrderStatus.OrderReceieved ||
            order.status == RestaurantOrderStatus.PreparingOrder) &&
        _getFoodReadyTime() != null;
  }

  Widget _foodReadyTimeWidget() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 23,
            child: Icon(Icons.flatware, color: Colors.white),
          ),
          SizedBox(
            width: 8,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                _getFoodReadyTime()!,
                style: Get.textTheme.bodyText1,
                maxLines: 2,
              ))
        ],
      ),
    );
  }

  String? _getFoodReadyTime() {
    if (order.estimatedFoodReadyTime != null) {
      return "${_i18n()["foodReady"]}: ${order.estimatedFoodReadyTime!.getEstimatedTime()}";
    } else
      return null;
  }

  String? _getDeliveryTime() {
    if (order.estimatedDropoffAtCustomerTime != null) {
      return "${_i18n()["delivery"]}: ${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
    } else
      return null;
  }
}
