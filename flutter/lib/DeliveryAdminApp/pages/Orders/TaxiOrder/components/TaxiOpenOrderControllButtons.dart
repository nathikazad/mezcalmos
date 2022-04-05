import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["components"]["taxiOrderBottomCard"];

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
  void initState() {
    btnClicked.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (btnClicked.value == false) {
          return _getBottomComponent(context);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getBottomComponent(context) {
    switch (widget.order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return TextButton(
            onPressed: () async {
              btnClicked.value = true;
              await _taxiOrderController
                  .forwardToLocalCompany(widget.order.orderId);
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text(
                    '${_i18n()["TaxiOpenOrderControllButton"]["fwdToCompany"]}')));
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return Column(
          children: [
            TextButton(
                onPressed: () async {
                  final dynamic result = await taxiNumberDialog(context);

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
                    child: Text(
                        '${_i18n()["TaxiOpenOrderControllButton"]["confirmTaxi"]}'))),
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
                      child: Text(
                          '${_i18n()["TaxiOpenOrderControllButton"]["cancel"]}'))),
            ),
          ],
        );

      case TaxiOrdersStatus.ForwardingUnsuccessful:
      case TaxiOrdersStatus.CancelledByCustomer:
      case TaxiOrdersStatus.CancelledByTaxi:
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
                      _getOrderStatus(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:mm a').format(widget.order.orderTime.toLocal())}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                )),
              ],
            ),
          ],
        );
      case TaxiOrdersStatus.ForwardingSuccessful:
      case TaxiOrdersStatus.DroppedOff:
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
                      _getOrderStatus(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:mm a').format(widget.order.orderTime.toLocal())}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                )),
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
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text(
                '${_i18n()["TaxiOpenOrderControllButton"]["confirmFwd"]} '),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (num.tryParse(value!) == null) {
                      return '${_i18n()["TaxiOpenOrderControllButton"]["fwdAlertErrorText"]}';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String value) {
                    if (num.tryParse(value) != null) {
                      taxiNumber = num.parse(value);
                    }
                  },
                  decoration: InputDecoration(
                      label: Text(
                          '${_i18n()["TaxiOpenOrderControllButton"]["taxiNumber"]}'),
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
                        //Navigator.pop(context, taxiNumber);
                        Get.back(result: taxiNumber);
                      }
                    },
                    child: Container(
                        //  padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text(
                            '${_i18n()["TaxiOpenOrderControllButton"]["confirmFwd"]}'))),
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
                        //    padding: EdgeInsets.all(5),
                        child: Text(
                            '${_i18n()["TaxiOpenOrderControllButton"]["cancel"]}')))
              ],
            ),
          );
        });
  }

  String _getOrderStatus() {
    switch (widget.order.status) {
      case TaxiOrdersStatus.CancelledByTaxi:
        return '${_i18n()["orderStatus"]["canceledByTaxi"]}';
      case TaxiOrdersStatus.CancelledByCustomer:
        return '${_i18n()["orderStatus"]["canceledByCustomer"]}';
      case TaxiOrdersStatus.LookingForTaxi:
        return '${_i18n()["orderStatus"]["lookingForTaxi"]}';
      case TaxiOrdersStatus.OnTheWay:
        return '${_i18n()["orderStatus"]["onTheWay"]}';
      case TaxiOrdersStatus.InTransit:
        return '${_i18n()["orderStatus"]["inTransit"]}';
      case TaxiOrdersStatus.DroppedOff:
        return '${_i18n()["orderStatus"]["droppedOff"]}';
      case TaxiOrdersStatus.Expired:
        return '${_i18n()["orderStatus"]["expired"]}';

      case TaxiOrdersStatus.ForwardingSuccessful:
        return '${_i18n()["orderStatus"]["forwardSuccess"]}';
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        return '${_i18n()["orderStatus"]["forwardUnsuccess"]}';
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return '${_i18n()["orderStatus"]["forwarding"]}';

      default:
        return 'Unknown status';
    }
  }
}
