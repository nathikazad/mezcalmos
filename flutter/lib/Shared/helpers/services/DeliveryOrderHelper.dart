import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/DeliveryOrder.dart';
import 'package:mezcalmos/Shared/models/Orders/DeliveryOrder/utilities/DeliveryOrderStatus.dart';
import 'package:rive/rive.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DeliveryOrderHelper"];

extension DeliveryOrderHelper on DeliveryOrder {
// getting the order status string

  String orderStatusTitle() {
    switch (status) {
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByCustomer:
      case DeliveryOrderStatus.CancelledByDeliverer:
        return "${_i18n()['status']["canceled"]}";

      case DeliveryOrderStatus.OrderReceived:
        return "${_i18n()["status"]['received']}";

      case DeliveryOrderStatus.AtPickup:
        return "${_i18n()["status"]['atPickUp']}";
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return "${_i18n()["status"]['otwDropOff']}";
      case DeliveryOrderStatus.AtDropoff:
        return "${_i18n()["status"]['atDropOff']}";
      case DeliveryOrderStatus.Delivered:
        return "${_i18n()["status"]['delivered']}";

      default:
        return "${_i18n()["status"]['ready']}";
    }
  }

  // getting icons widgets reperesent the current status

  Widget getOrderStatusWidget() {
    switch (status) {
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByCustomer:
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

      case DeliveryOrderStatus.OrderReceived:
        return Container(
          // padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.shopping_bag,
            size: 35,
            color: primaryBlueColor,
          ),
        );

      case DeliveryOrderStatus.AtPickup:
        return Container(
          height: 50,
          width: 50,
          child: Icon(
            Icons.store,
            size: 35,
            color: primaryBlueColor,
          ),
        );
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return Container(
          height: 50,
          width: 50,
          child: RiveAnimation.asset(
            "assets/animation/scooterWashingMachine.riv",
            fit: BoxFit.cover,
          ),
        );
      case DeliveryOrderStatus.OnTheWayToPickup:
        return Container(
          height: 50,
          width: 50,
          child: RiveAnimation.asset(
            "assets/animation/scooterWashingMachine.riv",
            fit: BoxFit.cover,
          ),
        );
      case DeliveryOrderStatus.AtDropoff:
        return Container(
          // padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.check_circle,
            size: 35,
            color: primaryBlueColor,
          ),
        );

      case DeliveryOrderStatus.Delivered:
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
      default:
        if (packageReady) {
          return Container(
            child: Icon(
              Icons.shopping_basket_rounded,
              size: 35,
              color: primaryBlueColor,
            ),
          );
        } else {
          return SizedBox();
        }
    }
  }
}
