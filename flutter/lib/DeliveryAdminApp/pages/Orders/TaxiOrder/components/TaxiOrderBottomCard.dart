import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["components"]["taxiOrderBottomCard"];

class TaxiOrderBottomCard extends StatelessWidget {
  /// Bottom card of the taxi order :  shows order info and driver info

  TaxiOrderBottomCard({Key? key, required this.order}) : super(key: key);

  final TaxiOrder order;
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
                      CachedNetworkImageProvider(order.customer.image),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.customer.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (order.serviceProvider != null) _orderTaxiDriver(context),
            Divider(),
            Container(
              child: Row(
                children: [
                  Text('${_i18n()['distance']}'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    order.routeInformation!.distance.distanceStringInKm,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${_i18n()['from']}' + order.from.address,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 8,
            ),
            Text('${_i18n()['to']}' + order.to.address,
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 10,
            ),
            _getOrderBottomComponent(context),
          ],
        ),
      ),
    );
  }

  String _getOrderStatus() {
    switch (order.status) {
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
        return '${_i18n()["orderStatus"]["forward"]}';

      default:
        return 'Unknown status';
    }
  }

  Widget _orderTaxiDriver(context) {
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
              backgroundImage:
                  CachedNetworkImageProvider(order.serviceProvider!.image),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.serviceProvider!.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _getOrderBottomComponent(context) {
    switch (order.status) {
      case TaxiOrdersStatus.CancelledByCustomer:
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
                    '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:mm a').format(order.orderTime.toLocal())}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            )
          ],
        );
      case TaxiOrdersStatus.DroppedOff:
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
                    '${_i18n()["at"]} ${DateFormat('dd MMM yyy hh:m a').format(order.orderTime.toLocal())}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            )
          ],
        );

      default:
        return Container();
    }
  }
}
