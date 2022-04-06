import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/DeliveryAdminApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["DeliveryAdminApp"]
    ["pages"]["Orders"]["ListOrdersScreen"]["components"]["taxiOrderCard"];

class TaxiCurrentOrderCard extends StatelessWidget {
  final TaxiOrder order;
  const TaxiCurrentOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: _getRightColor(order.status), width: 1)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          mezDbgPrint("Clickeeed");
          Get.toNamed(getTaxiOrderRoute(order.orderId,));
        },
        child: Container(
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    CachedNetworkImageProvider(order.customer.image),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.customer.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${_i18n()["to"]}' + order.to.address,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Spacer(),
              _getTaxiOrderWidget(order.status)
            ],
          ),
        ),
      ),
    );
  }
}

Color _getRightColor(TaxiOrdersStatus status) {
  switch (status) {
    case TaxiOrdersStatus.LookingForTaxi:
      return Colors.transparent;
    case TaxiOrdersStatus.CancelledByCustomer:
    case TaxiOrdersStatus.ForwardingUnsuccessful:
    case TaxiOrdersStatus.CancelledByTaxi:
    case TaxiOrdersStatus.Expired:
      return Colors.red;

    case TaxiOrdersStatus.DroppedOff:
    case TaxiOrdersStatus.ForwardingSuccessful:
      return Colors.green;

    default:
      return Colors.amber;
  }
}

Widget _getTaxiOrderWidget(TaxiOrdersStatus status) {
  switch (status) {
    case TaxiOrdersStatus.CancelledByCustomer:
    case TaxiOrdersStatus.CancelledByTaxi:
    case TaxiOrdersStatus.ForwardingUnsuccessful:
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
    case TaxiOrdersStatus.ForwardingToLocalCompany:
      return Container(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/customer/taxi/taxiOnTheWay.png',
            fit: BoxFit.contain,
          ));
    case TaxiOrdersStatus.DroppedOff:
    case TaxiOrdersStatus.ForwardingSuccessful:
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
