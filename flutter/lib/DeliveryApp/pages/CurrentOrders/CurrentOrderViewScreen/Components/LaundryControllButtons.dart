import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryApp/controllers/laundryController.dart';
import 'package:mezcalmos/Shared/models/Orders/LaundryOrder.dart';

class LaundryControllButtons extends StatelessWidget {
 
  /// UI : shows two buttons one to controll the order status and other to cancel the order
  /// PARAMETER : Deliverable order as laundry order
  /// LOGIC : first button text and onPressed function depends on order status



  final LaundryOrder order;
  LaundryControllButtons({Key? key, required this.order}) : super(key: key);
  LaundryOrderController laundryOrderController =
      Get.find<LaundryOrderController>();
  num orderWeight = 0;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
            flex: 3,
            child: TextButton(
                onPressed: () async {
                  switch (order.status) {
                    case LaundryOrderStatus.OrderReceieved:
                      laundryOrderController.otwPickupOrder(order.orderId);
                      break;
                    case LaundryOrderStatus.OtwPickup:
                      laundryOrderController.pickedUpOrder(order.orderId);
                      break;
                    case LaundryOrderStatus.PickedUp:
                      await orderWeightDialog(context);
                      if (orderWeight != 0) {
                        laundryOrderController.atLaundryOrder(
                            order.orderId, orderWeight);
                      }

                      break;
                    case LaundryOrderStatus.ReadyForDelivery:
                      laundryOrderController.otwDeliveryOrder(order.orderId);
                      break;
                    case LaundryOrderStatus.OtwDelivery:
                      laundryOrderController.deliveredOrder(order.orderId);
                      break;
                    default:
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    child: Text(_getActionButtonText())))),
        SizedBox(
          width: 5,
        ),
        Flexible(
          flex: 2,
          child: TextButton(
              onPressed: () {
                // TODO implement cancel function
              },
              style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  child: Text('Cancel'))),
        ),
      ],
    );
  }

  orderWeightDialog(BuildContext context) async {
    orderWeight = await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Confirm Order weight '),
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
                  validator: (v) {
                    if (num.tryParse(v!) == null) {
                      return 'Please enter a valid weight';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    orderWeight = num.parse(value);
                  },
                  decoration: InputDecoration(
                      label: Text('Order weight'),
                      filled: true,
                      isDense: true,
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
                        child: Text('Confirm order weight'))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Container(
                        padding: EdgeInsets.all(5), child: Text('Cancel')))
              ],
            ),
          );
        });
  }

  String _getActionButtonText() {
    switch (order.status) {
      case LaundryOrderStatus.OrderReceieved:
        return 'Pick-up Order';
      case LaundryOrderStatus.OtwPickup:
        return 'Confirm Pick-up';
      case LaundryOrderStatus.PickedUp:
        return 'At laundry';

      case LaundryOrderStatus.ReadyForDelivery:
        return 'Deliver order';
      case LaundryOrderStatus.OtwDelivery:
        return 'Confirm Delivery';

      default:
        return '';
    }
  }
}
