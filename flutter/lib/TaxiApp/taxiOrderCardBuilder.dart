import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/OrderInfoCard/OrderInfoCard.dart';
import 'package:mezcalmos/TaxiApp/controllers/taxiAuthController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:intl/intl.dart';

// class TaxiOrderCardSubWidgets implements OrderCardSubWidgets {
//   final TaxiOrder order;
//   const TaxiOrderCardSubWidgets({required this.order , required super.cardStatus , });

//   @override
//   Widget cardStatus;

//   @override
//   Widget cardTime;

//   @override
//   String cardTitle;

//   @override
//   void Function() onCardTap;

//   @override
//   Widget primaryBodyContent;

//   @override
//   Widget primaryHeaderContent;

//   @override
//   Widget rightImage;

//   @override
//   Widget secondaryBodyContent;

//   @override
//   Widget secondaryHeaderContent;
// }

OrderCardSubWidgets buildTaxiOrderCardWidgets(TaxiOrder order) {
  // upon Card Tap
  final void Function() onTap = () => Future.delayed(
        Duration.zero,
        () => Get.toNamed<void>(
          order.status != TaxiOrdersStatus.Scheduled && !order.isPastOrder()
              ? getIncomingOrderRoute(order.orderId)
              : getTaxiOrderRoute(order.orderId),
        ),
      );

  final Widget? primaryHeader;
  final Widget? secondaryHeader;
  final Widget? primaryBody;
  final Widget? secondaryBody;

  // setting primary head
  if (Get.find<TaxiAuthController>().taxiState?.inOrderNegotation?.orderId ==
          order.orderId &&
      order.status == TaxiOrdersStatus.LookingForTaxiScheduled &&
      !order.isPastOrder())
    primaryHeader = Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.blur_on,
              color: Color.fromRGBO(226, 17, 50, 0.93),
              size: 20,
            ),
            SizedBox(width: 9),
            Text(
              "Waiting for customer’s response",
              style: TextStyle(
                color: Color.fromRGBO(226, 17, 50, 0.93),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        SizedBox(height: 14)
      ],
    );


  // setting secondary header
  // setting other parts!

  return OrderCardSubWidgets(
    cardStatus: Text('status'),
    cardTime: Text('Time'),
    cardTitle: 'Title',
    onCardTap: onTap,
    rightImage: Text('img'),
  );
}
