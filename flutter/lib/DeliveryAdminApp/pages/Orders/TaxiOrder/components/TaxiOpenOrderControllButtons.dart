import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class TaxiOpenOrderControllButtons extends StatefulWidget {
  final TaxiOrder order;
  const TaxiOpenOrderControllButtons({Key? key, required this.order})
      : super(key: key);

  @override
  State<TaxiOpenOrderControllButtons> createState() =>
      _TaxiOpenOrderControllButtonsState();
}

class _TaxiOpenOrderControllButtonsState
    extends State<TaxiOpenOrderControllButtons> {
  RxBool btnClicked = RxBool(false);
  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();

  num taxiNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (btnClicked == false) {
        return _getBottomComponent(context);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget _getBottomComponent(context) {
    switch (widget.order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return TextButton(
            onPressed: () async {
              btnClicked.value = true;
              _taxiOrderController.forwardToLocalCompany(widget.order.orderId);
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text('Forward to local company')));
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return Column(
          children: [
            TextButton(
                onPressed: () async {
                  dynamic result = await taxiNumberDialog(context);
                  mezDbgPrint("Resulttttttt : $result");
                  if (result != 0) {
                    btnClicked.value = true;
                    await _taxiOrderController.submitForwardResult(
                        orderId: widget.order.orderId,
                        forwardSuccessful: true,
                        taxiNumber: result.toString());
                    Get.back(closeOverlays: true);
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Text('Confirm local company taxi'))),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: TextButton(
                  onPressed: () async {
                    btnClicked.value = true;
                    await _taxiOrderController.submitForwardResult(
                        orderId: widget.order.orderId,
                        forwardSuccessful: false);
                    Get.back(closeOverlays: true);
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.redAccent),
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Text('Cancel'))),
            ),
          ],
        );

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
                        'at : ${DateFormat('dd MMM yyy hh:mm a').format(widget.order.orderTime.toLocal())}',
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
                        'at : ${DateFormat('dd MMM yyy hh:mm a').format(widget.order.orderTime.toLocal())}',
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
            title: Text('Confirm Taxi number '),
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
                      return 'Please enter a valid taxi number';
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
                SizedBox(
                  height: 5,
                ),
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
