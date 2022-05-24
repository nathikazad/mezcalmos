import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings['CustomerApp']['pages']['Laundry']
        ['LaundryCurrentOrderView']['Components']['LaundryOrderStatusCard'];

extension LaundryOrderWidgets on LaundryOrder {
// getting the order status string

  String orderStatusTitleForCustomer() {
    switch (status) {
      case LaundryOrderStatus.CancelledByAdmin:
      case LaundryOrderStatus.CancelledByCustomer:
        return _i18n()['canceled'];

      case LaundryOrderStatus.OrderReceieved:
        return _i18n()['orderReceived'];
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return _i18n()['otwPickUp'];
      case LaundryOrderStatus.PickedUpFromCustomer:
        return _i18n()['pickedUp'];
      case LaundryOrderStatus.AtLaundry:
        return _i18n()['atLaundry'];
      case LaundryOrderStatus.ReadyForDelivery:
        return _i18n()['readyForDelivery'];
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
        return _i18n()['otwDelivery'];
      case LaundryOrderStatus.Delivered:
        return _i18n()['delivered'];
      default:
        return '';
    }
  }

  String orderStatusTitle() {
    switch (status) {
      case LaundryOrderStatus.CancelledByAdmin:
      case LaundryOrderStatus.CancelledByCustomer:
        return _i18n()['canceled'];

      case LaundryOrderStatus.OrderReceieved:
        return _i18n()['orderReceived'];
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return _i18n()['otwToCustomer'];
      case LaundryOrderStatus.PickedUpFromCustomer:
        return _i18n()['pickedUpFromCustomer'];
      case LaundryOrderStatus.AtLaundry:
        return _i18n()['atLaundry'];
      case LaundryOrderStatus.ReadyForDelivery:
        return _i18n()['readyForDelivery'];
      case LaundryOrderStatus.OtwPickupFromLaundry:
        return _i18n()['otwToLaundry'];
      case LaundryOrderStatus.PickedUpFromLaundry:
        return _i18n()['pickedUpFromLaundry'];

      case LaundryOrderStatus.Delivered:
        return _i18n()['delivered'];
      default:
        return '';
    }
  }

  // getting icons widgets reperesent the current status
  Widget getOrderWidget() {
    switch (status) {
      case LaundryOrderStatus.CancelledByCustomer:
      case LaundryOrderStatus.CancelledByAdmin:
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

      case LaundryOrderStatus.OrderReceieved:
      case LaundryOrderStatus.AtLaundry:
        return Container(
          child: Icon(
            Icons.local_laundry_service,
            size: 40,
            color: primaryBlueColor,
          ),
        );
      case LaundryOrderStatus.OtwPickupFromCustomer:
      case LaundryOrderStatus.OtwPickupFromLaundry:
      case LaundryOrderStatus.PickedUpFromLaundry:
        return Container(
          child: Icon(
            Icons.delivery_dining,
            size: 40,
            color: primaryBlueColor,
          ),
        );
      case LaundryOrderStatus.PickedUpFromCustomer:
      case LaundryOrderStatus.Delivered:
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: SecondaryLightBlueColor, shape: BoxShape.circle),
          child: Icon(
            Icons.check,
            size: 25,
            color: primaryBlueColor,
          ),
        );

      case LaundryOrderStatus.ReadyForDelivery:
        return Container(
          child: Icon(
            Icons.dry_cleaning_rounded,
            size: 40,
            color: primaryBlueColor,
          ),
        );
    }
  }
}
