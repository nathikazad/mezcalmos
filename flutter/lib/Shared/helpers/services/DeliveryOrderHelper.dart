import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:rive/rive.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["Shared"]["helpers"]
    ["DeliveryOrderHelper"];

extension DeliveryOrderHelper on DeliveryOrderStatus {
// getting the order status string

  String get title {
    switch (this) {
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByCustomer:
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByAdmin:
        return "${_i18n()['status']["canceled"]}";

      case DeliveryOrderStatus.OrderReceived:
        return "${_i18n()["status"]['received']}";

      case DeliveryOrderStatus.AtPickup:
        return "${_i18n()["status"]['atPickUp']}";
      case DeliveryOrderStatus.OnTheWayToDropoff:
        return "${_i18n()["status"]['otwDropOff']}";
      case DeliveryOrderStatus.OnTheWayToPickup:
        return "${_i18n()["status"]['otwPickup']}";
      case DeliveryOrderStatus.AtDropoff:
        return "${_i18n()["status"]['atDropOff']}";
      case DeliveryOrderStatus.Delivered:
        return "${_i18n()["status"]['delivered']}";
    }
  }

  // getting icons widgets reperesent the current status

  Widget widget({required bool packageReady}) {
    switch (this) {
      case DeliveryOrderStatus.CancelledByDeliverer:
      case DeliveryOrderStatus.CancelledByServiceProvider:
      case DeliveryOrderStatus.CancelledByAdmin:
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
        return Icon(
          Icons.shopping_bag,
          size: 35,
          color: primaryBlueColor,
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
          margin: const EdgeInsets.only(right: 14),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child: Icon(
            Icons.check_rounded,
            color: primaryBlueColor,
          ),
        );

      case DeliveryOrderStatus.Delivered:
        return Container(
          margin: const EdgeInsets.only(right: 14),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child: Icon(
            Icons.check_rounded,
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
