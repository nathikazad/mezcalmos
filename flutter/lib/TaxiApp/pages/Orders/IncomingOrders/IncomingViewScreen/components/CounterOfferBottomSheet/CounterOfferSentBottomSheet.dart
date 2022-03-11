import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:sizer/sizer.dart';

class CounterOfferSentBottomSheet extends StatelessWidget {
  final Rxn<CounterOffer> counterOffer;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final Function() onCounterEnd;
  final int duration;
  dynamic _i18n = Get.find<LanguageController>().strings["TaxiApp"]["pages"]['Orders']['IncomingOrders']
  ['IncomingViewScreen']['components']['CounterOfferBottomSheet']['CounterOfferSentBottomSheet'];


  CounterOfferSentBottomSheet(
      {required this.counterOffer,
      required this.controller,
      required this.order,
      required this.onCounterEnd,
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
                _i18n.strings['offer'],
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
                Text(_i18n['offerPrice']),
                Text("\$${counterOffer.value!.price}"),
              ],
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_i18n['offerStatus']),
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
            _i18n['offerTip'],
            style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
          ),
        )
      ],
    );
  }

  Widget getBottomSheetBodyByCounterOfferStatus() {
    switch (counterOffer.value!.counterOfferStatus) {
      case CounterOfferStatus.Rejected:
        return Icon(
          Icons.cancel,
          size: size,
          color: Colors.red,
        );
      case CounterOfferStatus.Accepted:
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
              counterOffer.value!.validityTimeDifference().abs().toDouble() /
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
