import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
import 'package:sizer/sizer.dart';

class CounterOfferSentBottomSheet extends StatelessWidget {
  final Rxn<CounterOffer> counterOffer;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final Function() onCounterEnd;

  CounterOfferSentBottomSheet(
      {required this.counterOffer,
      required this.controller,
      required this.order,
      required this.onCounterEnd});
  final double size = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Center(
              child: Text(
                'Ride offer',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15.sp, fontFamily: 'psr'),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5),
          child: Divider(),
        ),
        MezLoadingCounter(
            onCounterChange: (counterValue) {
              mezDbgPrint("======> $counterValue");
            },
            onCounterEnd: onCounterEnd,
            circleSize: size,
            counterDurationInSeconds: 20),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5),
          child: Divider(),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Offer price :'),
                Text("\$${counterOffer.value!.price}"),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Offer status :'),
                Text(
                    "${counterOffer.value!.counterOfferStatus.toFirebaseFormatString()}"),
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
          child: Text(
            "Every offer you make have a timeout of 60 seconds if the customer doesn’t accept your offer the offer will be canceled",
            style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
          ),
        )
      ],
    );
  }
}
