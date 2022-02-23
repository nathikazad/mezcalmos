import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/controllers/taxiController.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/TaxiOrder/components/TaxiOpenOrderControllButtons.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';

class TaxiOpenOrderBottomCard extends StatelessWidget {
  final TaxiOrder order;
  TaxiOpenOrderBottomCard({Key? key, required this.order}) : super(key: key);
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(_getOrderStatus()),
                  Spacer(),
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CountdownTimer(
                    endTime:
                        order.orderTime.millisecondsSinceEpoch + 1000 * 300,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text('Order expired');
                      }
                      return Text(
                        '${time.min ?? '00'}:${time.sec}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColorLight),
                      );
                    },
                  ),
                ],
              ),
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
            SizedBox(
              height: 8,
            ),
            TaxiOpenOrderControllButtons(
              order: order,
            )
          ],
        ),
      ),
    );
  }

  String _getOrderStatus() {
    switch (order.status) {
      case TaxiOrdersStatus.LookingForTaxi:
        return 'Looking for taxi';
      case TaxiOrdersStatus.ForwardingToLocalCompany:
        return 'Forwarding to local company';
      case TaxiOrdersStatus.ForwardingSuccessful:
        return 'Forwarding Successful';
      case TaxiOrdersStatus.ForwardingUnsuccessful:
        return 'Forwarding unsuccessful';

      default:
        return 'unknown';
    }
  }
}
