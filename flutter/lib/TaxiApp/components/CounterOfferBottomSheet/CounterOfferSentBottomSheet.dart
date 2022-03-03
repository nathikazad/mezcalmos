import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/models/CounterOffer.dart';
import 'package:sizer/sizer.dart';

class CounterOfferSentBottomSheet extends StatelessWidget {
  CounterOffer counterOffer;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final Function() onCounterEnd;
  final int duration;
  final Function()? onRejected;
  final Function()? onAccepted;

  CounterOfferSentBottomSheet(
      {required this.counterOffer,
      required this.controller,
      required this.order,
      required this.onCounterEnd,
      this.onAccepted,
      this.onRejected,
      this.duration = nDefaultCounterOfferValidExpireTimeInSeconds});
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
        getBottomSheetBodyByCounterOfferStatus(),
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
                Text("\$${counterOffer.price}"),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Offer status :'),
                Text(
                    "${counterOffer.counterOfferStatus.toFirebaseFormatString()}"),
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

  Widget getBottomSheetBodyByCounterOfferStatus() {
    switch (counterOffer.counterOfferStatus) {
      case CounterOfferStatus.Rejected:
        onRejected?.call();
        return Icon(
          Icons.cancel,
          size: size,
          color: Colors.red,
        );
      case CounterOfferStatus.Accepted:
        onAccepted?.call();
        return Icon(
          Icons.check_circle_rounded,
          size: size,
          color: Colors.green,
        );
      default:
        return MezLoadingCounter(
          onCounterChange: (counterValue) {
            mezDbgPrint("======> $counterValue");
          },
          reversed: true,
          manualCounterValue:
              counterOffer.validityTimeDifference().abs().toDouble() /
                  nDefaultCounterOfferValidExpireTimeInSeconds,
          // manualCounterValue: ((nDefaultCounterOfferValidExpireTimeInSeconds -
          //         counterOffer.validityTimeDifference().abs()) /
          //     nDefaultCounterOfferValidExpireTimeInSeconds),
          onCounterEnd: onCounterEnd,
          circleSize: size,
          counterDurationInSeconds: duration,
        );
    }
  }
}
