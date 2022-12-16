import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ViewOrderScreen"]["components"]
    ["CustomerRestaurantOrderEst"];

class CustomerRestaurantOrderEst extends StatelessWidget {
  CustomerRestaurantOrderEst({Key? key, required this.order, this.isWebVersion})
      : super(key: key);
  final RestaurantOrder order;

  bool? isWebVersion = false;

  @override
  Widget build(BuildContext context) {
    if (_getDeliveryTime() != null ||
        (_showFoodReadyTime() && _getFoodReadyTime() != null)) {
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
              style: Get.textTheme.bodyText1!
                  .copyWith(fontSize: (isWebVersion == true) ? 16 : null),
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
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: secondaryLightBlueColor,
                child: Icon(
                  Icons.watch_later,
                  size: 30,
                  color: primaryBlueColor,
                ),
              ),
              Positioned(
                right: -35,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: primaryBlueColor,
                    child: Icon(
                      Icons.route,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          // CircleAvatar(
          //   radius: 23,
          //   child: Icon(Icons.delivery_dining, color: Colors.white),
          // ),
          SizedBox(
            width: 45,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_i18n()["delivery"]}",
                    style: Get.textTheme.bodyText1!
                        .copyWith(fontSize: (isWebVersion == true) ? 14 : null),
                    maxLines: 2,
                  ),
                  Text(
                    _getDeliveryTime()!,
                    style: Get.textTheme.bodyText2!
                        .copyWith(fontSize: (isWebVersion == true) ? 14 : null),
                    maxLines: 2,
                  ),
                ],
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
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: secondaryLightBlueColor,
                child: Icon(
                  Icons.watch_later,
                  size: 30,
                  color: primaryBlueColor,
                ),
              ),
              Positioned(
                right: -35,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 23,
                  child: CircleAvatar(
                    radius: 21,
                    backgroundColor: primaryBlueColor,
                    child: Icon(
                      Icons.flatware,
                      size: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          // CircleAvatar(
          //   radius: 23,
          //   child: Icon(Icons.flatware, color: Colors.white),
          // ),
          SizedBox(
            width: 45,
          ),
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_i18n()["foodReady"]}",
                    style: Get.textTheme.bodyText1!
                        .copyWith(fontSize: (isWebVersion == true) ? 14 : null),
                    maxLines: 1,
                  ),
                  Text(
                    _getFoodReadyTime()!.inCaps,
                    style: Get.textTheme.bodyText2!
                        .copyWith(fontSize: (isWebVersion == true) ? 14 : null),
                    maxLines: 2,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  String? _getFoodReadyTime() {
    if (order.estimatedFoodReadyTime != null) {
      return "${order.estimatedFoodReadyTime!.getEstimatedTime()}";
    } else
      return null;
  }

  String? _getDeliveryTime() {
    if (order.estimatedDropoffAtCustomerTime != null) {
      return "${order.estimatedDropoffAtCustomerTime!.getEstimatedTime()}";
    } else
      return null;
  }
}
