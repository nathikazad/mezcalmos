import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

import '../../../../../Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["components"]["taxiOrderBottomCard"];

class TaxiOrderBottomCard extends StatefulWidget {
  /// Bottom card of the taxi order :  shows order info and driver info

  const TaxiOrderBottomCard({Key? key, required this.order}) : super(key: key);

  final TaxiOrder order;

  @override
  State<TaxiOrderBottomCard> createState() => _TaxiOrderBottomCardState();
}

class _TaxiOrderBottomCardState extends State<TaxiOrderBottomCard> {
  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();

  num taxiNumber = 0;
  RxBool btnClicked = RxBool(false);
  @override
  void initState() {
    // TODO: implement initState
    btnClicked.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(_getOrderStatus()),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Text('${_i18n()['customer']} ',
                      style: Theme.of(context).textTheme.subtitle1),
                  Expanded(child: Divider())
                ],
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.order.customer.image),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.order.customer.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.toNamed(
                          getMessagesRoute(chatId: widget.order.orderId));
                    },
                    icon: Icon(
                      Icons.message_rounded,
                      color: Theme.of(context).primaryColorLight,
                    )),
                SizedBox(
                  width: 5,
                )
              ],
            ),
            if (widget.order.serviceProvider != null) _orderTaxiDriver(context),
            Divider(),
            Container(
              child: Row(
                children: [
                  Text('${_i18n()['distance']}'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.order.routeInformation!.distance.distanceStringInKm,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${_i18n()['from']}' + widget.order.from.address,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 8,
            ),
            Text('${_i18n()['to']}' + widget.order.to.address,
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              if (!btnClicked.value) {
                return _getOrderBottomComponent(context);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ],
        ),
      ),
    );
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

  Widget _orderTaxiDriver(context) {
    if (widget.order.serviceProvider!.name.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Text('${_i18n()['driver']} ',
                    style: Theme.of(context).textTheme.subtitle1),
                Expanded(child: Divider())
              ],
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: CachedNetworkImageProvider(
                    widget.order.serviceProvider!.image),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.order.serviceProvider!.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getOrderBottomComponent(context) {
    switch (widget.order.status) {
      case TaxiOrdersStatus.CancelledByCustomer:
      case TaxiOrdersStatus.ForwardingUnsuccessful:
      case TaxiOrdersStatus.CancelledByTaxi:
        return Row(
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
              ),
            )
          ],
        );
      case TaxiOrdersStatus.DroppedOff:
      case TaxiOrdersStatus.ForwardingSuccessful:
        return Row(
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
                    '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:m a').format(widget.order.orderTime.toLocal())}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            )
          ],
        );
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return Column(
          children: [
            TextButton(
                onPressed: () async {
                  //  btnClicked.value = true;
                  final dynamic result = await taxiNumberDialog(context);

                  if (result != 0) {
                    await _taxiOrderController.submitForwardResult(
                        orderId: widget.order.orderId,
                        forwardSuccessful: true,
                        taxiNumber: result.toString());
                    // btnClicked.value = false;
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
                    //    btnClicked.value = true;
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
}
