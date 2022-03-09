import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
  Get.find<LanguageController>().strings["CustomerApp"]["pages"]
    ["ListOrdersScreen"]["components"]["TaxiOrderOngoingOrderCard"];
    
class TaxiOngoingOrderCard extends StatelessWidget {
  TaxiOngoingOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(getTaxiOrderRoute(order.orderId));
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: mLoadImage(
                                  assetInCaseFailed:
                                      'assets/images/customer/taxi/taxiDriverImg.png',
                                  url: order.serviceProvider?.image)
                              .image),
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
                              )))
                    ],
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceProvider?.name ??
                              "${_i18n()['taxiOrder']}",
                          style: txt.headline3,
                        ),
                        if (MediaQuery.of(context).size.width > 320)
                          Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                order.to.address,
                                style: txt.subtitle1,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  getTaxiOrderWidget((order as TaxiOrder).status),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              Divider(),
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
        children: [
          Text(
            "${_i18n()["totalCost"]} : \$${order.cost}",
          ),
          Spacer(),
          Icon(
            Ionicons.time_outline,
            size: 16.sp,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            getTaxiOrderStatus((order as TaxiOrder).status),
            style: txt.bodyText2,
          ),
          SizedBox(
            width: 10,
          ),
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

    default:
      return 'Unknown status';
  }
}

Widget getTaxiOrderWidget(TaxiOrdersStatus status) {
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

    default:
      return Icon(
        Ionicons.help,
        size: 50,
        color: Colors.grey,
      );
  }
}
