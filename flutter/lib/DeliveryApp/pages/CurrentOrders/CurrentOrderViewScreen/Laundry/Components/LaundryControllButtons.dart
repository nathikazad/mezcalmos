import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"]["laundryControllButtons"];

class LaundryControllButtons extends StatelessWidget {
  /// UI : shows two buttons one to controll the order status and other to cancel the order
  /// PARAMETER : Deliverable order as laundry order
  /// LOGIC : first button text and onPressed function depends on order status

  LaundryControllButtons({Key? key, required this.order}) : super(key: key);
  final LaundryOrder order;
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();
  num orderWeight = 0;
  RxBool clicked = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (clicked.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return TextButton(
            onPressed: () async {
              clicked.value = true;
              switch (order.status) {
                case LaundryOrderStatus.OrderReceieved:
                  await laundryOrderController.otwPickupOrder(order.orderId);
                  break;
                case LaundryOrderStatus.OtwPickup:
                  await laundryOrderController.pickedUpOrder(order.orderId);
                  break;
                case LaundryOrderStatus.PickedUp:
                  await laundryOrderController.atLaundryOrder(order.orderId);
                  Get.back(closeOverlays: true);

                  break;
                case LaundryOrderStatus.ReadyForDelivery:
                  await laundryOrderController.otwDeliveryOrder(order.orderId);
                  break;
                case LaundryOrderStatus.OtwDelivery:
                  await laundryOrderController.deliveredOrder(order.orderId);
                  Get.back(closeOverlays: true);
                  break;
                default:
                  null;
              }
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: Text(_getActionButtonText())));
      }
    });
  }

  String _getActionButtonText() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return '${_i18n()["pickupOrder"]}';
      case LaundryOrderStatus.OtwPickup:
        return '${_i18n()["confirmPickup"]}';
      case LaundryOrderStatus.PickedUp:
        return '${_i18n()["atLaundry"]}';

      case LaundryOrderStatus.ReadyForDelivery:
        return '${_i18n()["deliverOrder"]}';
      case LaundryOrderStatus.OtwDelivery:
        return '${_i18n()["confirmDelivery"]}';

      default:
        return '';
    }
  }
}
