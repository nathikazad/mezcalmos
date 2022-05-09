import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryApp"]
        ["pages"]["CurrentOrders"]["CurrentOrderViewScreen"]["Components"]
    ["DriverBottomLaundryOrderCard"]["laundryControllButtons"];

class LaundryControllButtons extends StatefulWidget {
  /// UI : shows two buttons one to controll the order status and other to cancel the order
  /// PARAMETER : Deliverable order as laundry order
  /// LOGIC : first button text and onPressed function depends on order status

  LaundryControllButtons({Key? key, required this.order}) : super(key: key);
  LaundryOrder order;

  @override
  State<LaundryControllButtons> createState() => _LaundryControllButtonsState();
}

class _LaundryControllButtonsState extends State<LaundryControllButtons> {
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();

  num orderWeight = 0;

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    if (clicked) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else {
      return TextButton(
          onPressed: () async {
            switch (widget.order.status) {
              case LaundryOrderStatus.OrderReceieved:
                setState(() {
                  clicked = true;
                });
                await laundryOrderController
                    .otwPickupOrder(widget.order.orderId)
                    .whenComplete(() {
                  setState(() {
                    clicked = false;
                  });
                });
                break;
              case LaundryOrderStatus.OtwPickup:
                setState(() {
                  clicked = true;
                });
                await laundryOrderController
                    .pickedUpOrder(widget.order.orderId)
                    .whenComplete(() {
                  setState(() {
                    clicked = false;
                  });
                });
                break;
              case LaundryOrderStatus.PickedUp:
                setState(() {
                  clicked = true;
                });
                await laundryOrderController
                    .atLaundryOrder(widget.order.orderId)
                    .whenComplete(() {
                  setState(() {
                    clicked = false;
                  });
                });
                Get.back(closeOverlays: true);

                break;
              case LaundryOrderStatus.ReadyForDelivery:
                setState(() {
                  clicked = true;
                });
                await laundryOrderController
                    .otwDeliveryOrder(widget.order.orderId)
                    .whenComplete(() {
                  setState(() {
                    clicked = false;
                  });
                });
                break;
              case LaundryOrderStatus.OtwDelivery:
                setState(() {
                  clicked = true;
                });
                await laundryOrderController
                    .deliveredOrder(widget.order.orderId)
                    .whenComplete(() {
                  setState(() {
                    clicked = false;
                  });
                });
                // Get.back(closeOverlays: true);
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
  }

  String _getActionButtonText() {
    switch (widget.order.status) {
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
