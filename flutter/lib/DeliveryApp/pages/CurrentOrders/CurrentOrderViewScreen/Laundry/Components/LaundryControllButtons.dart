import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  orderWeightDialog(context);
                  if (orderWeight != 0) {
                    await laundryOrderController.atLaundryOrder(
                        order.orderId, orderWeight);
                    Get.back(closeOverlays: true);
                  }

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

  void orderWeightDialog(BuildContext context) async {
    orderWeight = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text("${_i18n()["confirmOrderWeight"]}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? v) {
                    if (num.tryParse(v!) == null) {
                      return "${_i18n()["orderWeightAlert"]}";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String value) {
                    orderWeight = num.parse(value);
                  },
                  decoration: InputDecoration(
                      label: Text('${_i18n()["orderWeight"]}'),
                      filled: true,
                      isDense: true,
                      suffixText: 'KG',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      if (orderWeight != 0) {
                        Navigator.pop(context, orderWeight);
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text('${_i18n()["confirm"]}'))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text('${_i18n()["cancel"]}')))
              ],
            ),
          );
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
