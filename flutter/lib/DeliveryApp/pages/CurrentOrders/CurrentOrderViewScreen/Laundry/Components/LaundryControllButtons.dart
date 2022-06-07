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
      return InkWell(
        onTap: shouldDisableBottomButton()
            ? null
            : () async {
                switch (widget.order.status) {
                  case LaundryOrderStatus.OrderReceieved:
                    setState(() {
                      clicked = true;
                    });
                    await laundryOrderController
                        .otwPickupFromCustomer(widget.order.orderId)
                        .whenComplete(() {
                      setState(() {
                        clicked = false;
                      });
                    });
                    break;
                  case LaundryOrderStatus.OtwPickupFromCustomer:
                    setState(() {
                      clicked = true;
                    });
                    await laundryOrderController
                        .pickedUpFromCustomer(widget.order.orderId)
                        .whenComplete(() {
                      setState(() {
                        clicked = false;
                      });
                    });
                    break;
                  case LaundryOrderStatus.PickedUpFromCustomer:
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
                        .otwPickupFromLaundry(widget.order.orderId)
                        .whenComplete(() {
                      setState(() {
                        clicked = false;
                      });
                    });
                    break;

                  case LaundryOrderStatus.OtwPickupFromLaundry:
                  case LaundryOrderStatus.PickedUpFromLaundry:
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
                    break;
                }
              },
        child: Container(
          decoration: BoxDecoration(
            color: shouldDisableBottomButton()
                ? Color.fromRGBO(229, 229, 229, 1)
                : null,
            gradient: shouldDisableBottomButton()
                ? null
                : LinearGradient(
                    colors: [
                      Color.fromARGB(255, 97, 127, 255),
                      Color.fromARGB(255, 198, 90, 252),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Text(
            _getActionButtonText(),
            style: TextStyle(
              color: shouldDisableBottomButton()
                  ? Color.fromRGBO(120, 120, 120, 1)
                  : Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }

  String _getActionButtonText() {
    switch (widget.order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return '${_i18n()["pickupOrder"]}';
      case LaundryOrderStatus.OtwPickupFromCustomer:
        return '${_i18n()["confirmPickup"]}';
      case LaundryOrderStatus.PickedUpFromCustomer:
        return '${_i18n()["atLaundry"]}';

      case LaundryOrderStatus.ReadyForDelivery:
        return '${_i18n()["deliverOrder"]}';
      case LaundryOrderStatus.OtwPickupFromLaundry:
        return "Picked up from laundry";
      case LaundryOrderStatus.PickedUpFromLaundry:
        return '${_i18n()["confirmDelivery"]}';

      default:
        return '';
    }
  }

  bool shouldDisableBottomButton() {
    if (widget.order.getCurrentPhase() == LaundryOrderPhase.Pickup) {
      return widget.order.estimatedPickupFromCustomerTime == null ||
          widget.order.estimatedDropoffAtServiceProviderTime == null;
    } else if (widget.order.getCurrentPhase() == LaundryOrderPhase.Dropoff) {
      return widget.order.estimatedPickupFromServiceProviderTime == null ||
          widget.order.estimatedDropoffAtCustomerTime == null;
    }
    return false;
  }
}
