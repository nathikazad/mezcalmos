import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class TaxiOpenOrderControllButtons extends StatelessWidget {
  final TaxiOrder order;
  TaxiOpenOrderControllButtons({Key? key, required this.order})
      : super(key: key);
  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();
  num taxiNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getBottomComponent(context),
        if (order.status == TaxiOrdersStatus.ForwardingToLocalCompany)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: TextButton(
                onPressed: () async {
                  await _taxiOrderController.submitForwardResult(
                      orderId: order.orderId, forwardSuccessful: false);
                  Get.back(closeOverlays: true);
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

  Widget _getBottomComponent(context) {
    switch (order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return TextButton(
            onPressed: () async {
              _taxiOrderController.forwardToLocalCompany(order.orderId);
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text('Forward to local company')));
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return TextButton(
            onPressed: () async {
              dynamic result = await taxiNumberDialog(context);
              mezDbgPrint("Resulttttttt : $result");
              if (result != 0) {
                await _taxiOrderController.submitForwardResult(
                    orderId: order.orderId,
                    forwardSuccessful: true,
                    taxiNumber: result.toString());
                Get.back(closeOverlays: true);
              }
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text('Confirm local company taxi')));

      case TaxiOrdersStatus.ForwardingUnsuccessful:
        return Column(
          children: [
            Divider(),
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  size: 50,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Canceled',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'at : ${DateFormat('dd MMM yyy hh:mm a').format(order.orderTime.toLocal())}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );
      case TaxiOrdersStatus.ForwardingSuccessful:
        return Column(
          children: [
            Divider(),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Droped off',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'at : ${DateFormat('dd MMM yyy hh:mm a').format(order.orderTime.toLocal())}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        );

      default:
        return Container();
    }
  }

  Future taxiNumberDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
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
                        mezDbgPrint('Getting back $taxiNumber');
                        //Navigator.pop(context, taxiNumber);
                        Get.back(result: taxiNumber);
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
}
