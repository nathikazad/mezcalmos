import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

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
      height: 70,
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
        return Container(
          padding: EdgeInsets.all(5),
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: TextButton(
                    onPressed: () async {
                      await taxiNumberDialog(context).then((num value) async {
                        if (value != 0) {
                          setState(() {
                            btnClicked = true;
                          });
                          await _taxiOrderController
                              .submitForwardResult(
                                  orderId: widget.order.orderId,
                                  forwardSuccessful: true,
                                  taxiNumber: value.toString())
                              .whenComplete(() {
                            setState(() {
                              btnClicked = false;
                            });
                            MezRouter.back(closeOverlays: true);
                          });
                        }
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: Text(
                            '${_i18n()["TaxiOpenOrderControllButton"]["confirmTaxi"]}'))),
              ),
              SizedBox(
                width: 5,
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
                      MezRouter.back(closeOverlays: true);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        child: Text(
                            '${_i18n()["TaxiOpenOrderControllButton"]["cancel"]}'))),
              ),
            ],
          ),
        );

      default:
        return Container();
    }
  }

  Future<num> taxiNumberDialog(BuildContext context) async {
    num newTaxiNumber = 0;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title:
              Text('${_i18n()["TaxiOpenOrderControllButton"]["confirmFwd"]} '),
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
                    newTaxiNumber = num.parse(value);
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
              const SizedBox(height: 5),
              TextButton(
                  onPressed: () {
                    MezRouter.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        '${_i18n()["TaxiOpenOrderControllButton"]["confirmFwd"]}'),
                  )),
              TextButton(
                onPressed: () {
                  newTaxiNumber = 0;
                  MezRouter.back();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Container(
                  //    padding: EdgeInsets.all(5),
                  child: Text(
                      '${_i18n()["TaxiOpenOrderControllButton"]["cancel"]}'),
                ),
              ),
            ],
          ),
        );
      },
    );
    return newTaxiNumber;
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
