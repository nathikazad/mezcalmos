import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["ListOrdersScreen"]["components"]["TaxiOrderOngoingCard"];

class TaxiOngoingOrderCard extends StatelessWidget {
  const TaxiOngoingOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed<void>(getTaxiOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: mLoadImage(
                          assetInCaseFailed:
                              'assets/images/customer/taxi/taxiDriverImg.png',
                          url: order.serviceProvider?.image,
                        ).image,
                      ),
                      //  if (order.serviceProvider != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.amber.shade500,
                          child: Icon(
                            Icons.local_taxi_rounded,
                            size: 20,
                            // size: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.serviceProvider?.name ??
                              "${_i18n()['taxiOrder']}",
                          style: txt.headline3,
                        ),
                        if (MediaQuery.of(context).size.width > 320)
                          Column(
                            children: <Widget>[
                              const SizedBox(height: 8),
                              Text(
                                order.to.address,
                                style: txt.subtitle1,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  getTaxiOrderWidget((order as TaxiOrder).status, context),
                  const SizedBox(width: 10)
                ],
              ),
              const Divider(),
              mezOrdercart(txt)
            ],
          ),
        ),
      ),
    );
  }

  Container mezOrdercart(TextTheme txt) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "${_i18n()["totalCost"]} : \$${order.cost}",
          ),
          const Spacer(),
          Icon(
            Ionicons.time_outline,
            size: 16.sp,
          ),
          const SizedBox(width: 5),
          Text(
            getTaxiOrderStatus((order as TaxiOrder).status),
            style: txt.bodyText2,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios_rounded,
          )
        ],
      ),
    );
  }
}

String getTaxiOrderStatus(TaxiOrdersStatus status) {
  switch (status) {
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

Widget getTaxiOrderWidget(TaxiOrdersStatus status, conttext) {
  switch (status) {
    case TaxiOrdersStatus.CancelledByCustomer:
      return Icon(
        Icons.block,
        size: 50,
        color: Colors.red,
      );
    case TaxiOrdersStatus.CancelledByCustomer:
      return Icon(
        Icons.block,
        size: 50,
        color: Colors.red,
      );
    case TaxiOrdersStatus.LookingForTaxi:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/search.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.OnTheWay:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/taxiOnTheWay.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.InTransit:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/taxiOnTheWay.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.DroppedOff:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/taxi.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.Expired:
      return Icon(
        Icons.hourglass_disabled_sharp,
        size: 50,
        color: Colors.grey,
      );
    case TaxiOrdersStatus.ForwardingToLocalCompany:
      return Icon(
        Icons.business,
        size: 50,
        color: Theme.of(conttext).primaryColorLight,
      );
    case TaxiOrdersStatus.ForwardingSuccessful:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/taxi.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.ForwardingUnsuccessful:
      return Icon(
        Icons.block,
        size: 50,
        color: Colors.red,
      );
    default:
      return Icon(
        Ionicons.help,
        size: 50,
        color: Colors.grey,
      );
  }
}
