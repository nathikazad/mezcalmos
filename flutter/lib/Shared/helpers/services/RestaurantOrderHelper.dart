import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:rive/rive.dart';

extension RestaurantOrderHelper on RestaurantOrder {
  dynamic _i18n() =>
      Get.find<LanguageController>().strings["CustomerApp"]["pages"]
          ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

  String getOrderStatus() {
    switch (status) {
      case RestaurantOrderStatus.CancelledByAdmin:
        return '${_i18n()["canceledByAdmin"]}';
      case RestaurantOrderStatus.CancelledByCustomer:
        return '${_i18n()["canceledByCustomer"]}';
      case RestaurantOrderStatus.OrderReceived:
        return '${_i18n()["received"]}';
      case RestaurantOrderStatus.Preparing:
        return '${_i18n()["preparing"]}';
      case RestaurantOrderStatus.OnTheWay:
        return '${_i18n()["onTheWay"]}';
      case RestaurantOrderStatus.Ready:
        return '${_i18n()["readyForPickUp"]}';
      case RestaurantOrderStatus.Delivered:
        return '${_i18n()["delivered"]}';

      default:
        return 'Unknown status';
    }
  }
  // order status image/icon

  Widget orderStatusImage() {
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

      case RestaurantOrderStatus.OrderReceived:
        return Container(
          // padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.flatware_rounded,
            size: 40,
            color: primaryBlueColor,
          ),
        );
      case RestaurantOrderStatus.Preparing:
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
            "assets/animation/scooterWashingMachine.riv",
            fit: BoxFit.cover,
          ),
        );
      case RestaurantOrderStatus.Ready:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            size: 25,
            color: Color(0xFF6779FE),
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
            color: Color(0xFF6779FE),
          ),
        );
    }
  }
}
