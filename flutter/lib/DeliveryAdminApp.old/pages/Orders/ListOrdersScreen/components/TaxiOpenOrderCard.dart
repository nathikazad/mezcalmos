import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp.old/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["ListOrdersScreen"]["components"]["taxiOrderCard"];

class TaxiOpenOrderCard extends StatelessWidget {
  final TaxiOrder order;

  const TaxiOpenOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          MezRouter.toNamed(getTaxiOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _cardHeader(context),
              const Divider(),
              _cardBottom(context),
            ],
          ),
        ),
      ),
    );
  }

// Return the bottom part of the card : adress destination + distance
  Widget _cardBottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            '${_i18n()["to"]}' + order.to.address,
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.directions_outlined,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                order.routeInformation!.distance.distanceStringInKm,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ],
    );
  }

// Return the header part of the card : Customer info + timer + drivers Stats
  Widget _cardHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: CachedNetworkImageProvider(order.customer.image),
        ),
        const SizedBox(width: 5),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    order.customer.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 11.sp),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  const SizedBox(width: 5),
                  CountdownTimer(
                    endTime:
                        order.orderTime.millisecondsSinceEpoch + 1000 * 300,
                    widgetBuilder: (_, CurrentRemainingTime? time) {
                      if (time == null) {
                        return Text('${_i18n()["orderExpired"]}');
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
              Text(
                '${_i18n()["sentTo"]} ${order.numberOfTaxiSentNotificationTo().toString()} ${_i18n()["drivers"]}',
              ),
              Text(
                '${_i18n()["readBy"]} ${order.numberOfTaxiReadNotification().toString()} ${_i18n()["drivers"]}',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
