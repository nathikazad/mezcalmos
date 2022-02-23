import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

import '../../../../../Shared/controllers/languageController.dart';

class TaxiOrderBottomCard extends StatelessWidget {
  final TaxiOrder order;
  TaxiOrderBottomCard({Key? key, required this.order}) : super(key: key);
  TaxiOrderController _taxiOrderController = Get.find<TaxiOrderController>();
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
            Divider(),
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
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Icon(
                              Icons.directions_outlined,
                              size: 16,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              order.routeInformation!.distance
                                  .distanceStringInKm,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (order.serviceProvider != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Divider(), _orderTaxiDriver(context)],
              ),
            Divider(),
            Text(
              'From :' + order.from.address,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 8,
            ),
            Text('To :' + order.to.address,
                style: Theme.of(context).textTheme.bodyText2),
            Divider(),
            _getOrderBottomComponent(context),
          ],
        ),
      ),
    );
  }

  String _getOrderStatus() {
    LanguageController lang = Get.find<LanguageController>();
    switch (order.status) {
      case TaxiOrdersStatus.CancelledByTaxi:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["canceledByTaxi"]}';
      case TaxiOrdersStatus.CancelledByCustomer:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["canceledByCustomer"]}';
      case TaxiOrdersStatus.LookingForTaxi:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["lookingForTaxi"]}';
      case TaxiOrdersStatus.OnTheWay:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["onTheWay"]}';
      case TaxiOrdersStatus.InTransit:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["inTransit"]}';
      case TaxiOrdersStatus.DroppedOff:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["droppedOff"]}';
      case TaxiOrdersStatus.Expired:
        return '${lang.strings["taxi"]["orders"]["orderStatus"]["expired"]}';

      default:
        return 'Unknown status';
    }
  }

  Widget _orderTaxiDriver(context) {
    return Row(
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
          child: Text(
            order.serviceProvider!.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
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
                    'Order Droped Off',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'at : ${DateFormat('dd MMM yyy hh:m a').format(order.orderTime.toLocal())}',
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
