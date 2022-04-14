import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["TaxiOrder"]["components"]["taxiOrderBottomCard"];

class TaxiOpenOrderBottomCard extends StatelessWidget {
  /// Bottom card of the open taxi order :  shows order info and buttons to handle the order
  const TaxiOpenOrderBottomCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final TaxiOrder order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderStausAndTimer(context),
              Divider(),
              _orderCustomerInfo(context),
              Divider(),
              _driversStatsComponent(),
              Divider(),
              _orderFromToAdresses(context),
            ],
          ),
        ),
      ),
    );
  }

// return the order from and to adresses( in a colmn to prevent overflow )
  Widget _orderFromToAdresses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${_i18n()['from']}' + order.from.address,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 8),
        Text(
          '${_i18n()['to']}' + order.to.address,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

// return the customer image and name and order distance
  Widget _orderCustomerInfo(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(order.customer.image),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                order.customer.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_outlined,
                      size: 16,
                      color: Theme.of(context).primaryColorLight,
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
          ),
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              Get.toNamed(getMessagesRoute(
                  chatId: order.orderId, orderId: order.orderId));
            },
            icon: Icon(
              Icons.message_rounded,
              color: Theme.of(context).primaryColorLight,
            )),
        SizedBox(
          width: 5,
        )
      ],
    );
  }

// return the order statu and timer of order to expire 10 min
  Container _orderStausAndTimer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: (order.status != TaxiOrdersStatus.LookingForTaxi)
          ? Container(
              alignment: Alignment.center,
              child: Text(_getOrderStatus()),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(_getOrderStatus()),
                const Spacer(),
                Icon(
                  Icons.timer,
                  size: 20,
                  color: Theme.of(context).primaryColorLight,
                ),
                SizedBox(width: 5),
                CountdownTimer(
                  endTime: order.orderTime.millisecondsSinceEpoch + 1000 * 300,
                  widgetBuilder: (_, CurrentRemainingTime? time) {
                    if (time == null) {
                      return Text('${_i18n()["orderExpired"]}');
                    }
                    return Text(
                      '${time.min ?? '00'}:${time.sec}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Theme.of(context).primaryColorLight),
                    );
                  },
                ),
              ],
            ),
    );
  }

// return how many drivers have recieved the order notif and how many have read it
  Widget _driversStatsComponent() {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.taxi_alert,
            size: 14.sp,
            color: Colors.black,
          ),
          const SizedBox(width: 5),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
                '${_i18n()['sentTo']} ${order.numberOfTaxiSentNotificationTo().toString()} '),
          ),
          const Spacer(),
          Icon(
            Icons.check_box,
            size: 14.sp,
            color: Colors.green,
          ),
          const SizedBox(width: 5),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
              '${_i18n()['readBy']} ${order.numberOfTaxiReadNotification().toString()} ',
            ),
          ),
        ],
      ),
    );
  }

// function with a string return to the current open order status
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
        return '${_i18n()["orderStatus"]["forwarding"]}';

      default:
        return 'Unknown status';
    }
  }
}
