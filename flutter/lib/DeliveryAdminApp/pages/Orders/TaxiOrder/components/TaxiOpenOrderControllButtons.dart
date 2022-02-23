import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class TaxiOpenOrderControllButtons extends StatelessWidget {
  /// UI : shows two buttons one to controll the order status and other to cancel the order
  /// PARAMETER : Deliverable order as laundry order
  /// LOGIC : first button text and onPressed function depends on order status

  final TaxiOrder order;
  TaxiOpenOrderControllButtons({Key? key, required this.order})
      : super(key: key);
  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();
  num taxiNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () async {
              switch (order.status) {
                case (TaxiOrdersStatus.LookingForTaxi):
                  _taxiOrderController.forwardToLocalCompany(order.orderId);
                  break;
                case (TaxiOrdersStatus.ForwardingToLocalCompany):
                  await taxiNumberDialog(context);
                  if (taxiNumber != 0) {
                    _taxiOrderController.submitForwardResult(
                        orderId: order.orderId,
                        forwardSuccessful: true,
                        taxiNumber: taxiNumber.toString());
                  }
                  break;
                default:
                  null;
              }
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text(_getActionButtonText()))),
        if (order.status == TaxiOrdersStatus.ForwardingToLocalCompany)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: TextButton(
                onPressed: () {
                  // TODO implement cancel function
                },
                style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Text('Cancel'))),
          ),
      ],
    );
  }

  taxiNumberDialog(BuildContext context) async {
    taxiNumber = await showDialog(
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
                    taxiNumber = num.parse(value);
                  },
                  decoration: InputDecoration(
                      label: Text('Taxi number'),
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
                      if (taxiNumber != 0) {
                        Navigator.pop(context, taxiNumber);
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text('Confirm Taxi number'))),
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
      case TaxiOrdersStatus.LookingForTaxi:
        return 'Forward to local company';
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return 'Confirm forwarding taxi';
      case TaxiOrdersStatus.ForwardingSuccessful:
        return 'Forwarding Succesfull';

      default:
        return '';
    }
  }
}
