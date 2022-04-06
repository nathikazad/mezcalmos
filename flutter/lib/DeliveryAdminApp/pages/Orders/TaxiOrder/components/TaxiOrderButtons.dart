import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["components"]["taxiOrderBottomCard"];

class TaxiOrderButtons extends StatefulWidget {
  const TaxiOrderButtons({Key? key, required this.order}) : super(key: key);
  final TaxiOrder order;
  @override
  State<TaxiOrderButtons> createState() => _TaxiOrderButtonsState();
}

class _TaxiOrderButtonsState extends State<TaxiOrderButtons> {
  bool btnClicked = false;
  num taxiNumber = 0;

  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      child: (btnClicked)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _getOrderBottomComponent(context),
    );
  }

  Widget _getOrderBottomComponent(context) {
    switch (widget.order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return TextButton(
            style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
            onPressed: () async {
              setState(() {
                btnClicked = true;
              });
              await _taxiOrderController
                  .forwardToLocalCompany(widget.order.orderId)
                  .then((ServerResponse value) {
                setState(() {
                  btnClicked = false;
                });
              });
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text(
                    '${_i18n()["TaxiOpenOrderControllButton"]["fwdToCompany"]}')));
      case TaxiOrdersStatus.CancelledByCustomer:
      case TaxiOrdersStatus.ForwardingUnsuccessful:
      case TaxiOrdersStatus.CancelledByTaxi:
      case TaxiOrdersStatus.Expired:
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Row(
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              )
            ],
          ),
        );
      case TaxiOrdersStatus.DroppedOff:
      case TaxiOrdersStatus.ForwardingSuccessful:
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Row(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getOrderStatus(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:m a').format(widget.order.orderTime.toLocal())}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: TextButton(
                  style: TextButton.styleFrom(shape: RoundedRectangleBorder()),
                  onPressed: () async {
                    setState(() {
                      btnClicked = true;
                    });
                    final dynamic result = await taxiNumberDialog(context);

                    if (result != 0) {
                      await _taxiOrderController.submitForwardResult(
                          orderId: widget.order.orderId,
                          forwardSuccessful: true,
                          taxiNumber: result.toString());
                      setState(() {
                        btnClicked = false;
                      });
                      Get.back(closeOverlays: true);
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Text(
                          '${_i18n()["TaxiOpenOrderControllButton"]["confirmTaxi"]}'))),
            ),
            Container(
              // margin: const EdgeInsets.only(top: 8),
              child: TextButton(
                  onPressed: () async {
                    setState(() {
                      btnClicked = true;
                    });
                    await _taxiOrderController
                        .submitForwardResult(
                            orderId: widget.order.orderId,
                            forwardSuccessful: false)
                        .then((ServerResponse value) {
                      setState(() {
                        btnClicked = false;
                      });
                    });
                    Get.back(closeOverlays: true);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder()),
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      child: Text(
                          '${_i18n()["TaxiOpenOrderControllButton"]["cancel"]}'))),
            ),
          ],
        );

      default:
        return Container();
    }
  }

  Future taxiNumberDialog(BuildContext context) async {
    return showDialog(
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
