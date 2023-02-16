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
  const CustomerRestaurantOrderEst({Key? key, required this.order})
      : super(key: key);
  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    if (_getDeliveryTime() != null || _showFoodReadyTime()) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              '${_i18n()["estTimes"]}'.inCaps,
              style: Get.textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Card(
            child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    if (_showFoodReadyTime()) _foodReadyTimeWidget(),
                    if (_showFoodReadyTime() && _getDeliveryTime() != null)
                      Divider(),
                    if (_getDeliveryTime() != null) _deliveryTimeWidget(),
                    SizedBox(
                      height: 9,
                    ),
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
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                        radius: 23,
                        child: Icon(
                          Icons.route,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ),

                //  CircleAvatar(
                //   backgroundColor: Colors.white,
                //   radius: 23,
                //   child: CircleAvatar(
                //     radius: 21,
                //     backgroundColor: primaryBlueColor,
                //     child: Icon(
                //       Icons.route,
                //       size: 23,
                //       color: Colors.white,
                //     ),
                //   ),
                //),
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
                    "${_i18n()["delivery"]}".inCaps,
                    style: Get.textTheme.bodyText1,
                    maxLines: 2,
                  ),
                  Text(
                    _getDeliveryTime()!.inCaps,
                    style: Get.textTheme.bodyText2,
                    maxLines: 2,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  bool _showFoodReadyTime() {
    return (order.status == RestaurantOrderStatus.OrderReceived ||
            order.status == RestaurantOrderStatus.Preparing) &&
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
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                        radius: 23,
                        child: Icon(
                          Icons.flatware,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ),

                //  CircleAvatar(
                //   backgroundColor: Colors.white,
                //   radius: 23,
                //   child: CircleAvatar(
                //     radius: 21,
                //     backgroundColor: primaryBlueColor,
                //     child: Icon(
                //       Icons.flatware,
                //       size: 23,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
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
                    "${_i18n()["foodReady"]}".inCaps,
                    style: Get.textTheme.bodyText1,
                    maxLines: 1,
                  ),
                  Text(
                    _getFoodReadyTime()!.inCaps,
                    style: Get.textTheme.bodyText2,
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
    if (order.estDropOffTime != null) {
      return "${order.estDropOffTime!.getEstimatedTime()}";
    } else
      return null;
  }
}
