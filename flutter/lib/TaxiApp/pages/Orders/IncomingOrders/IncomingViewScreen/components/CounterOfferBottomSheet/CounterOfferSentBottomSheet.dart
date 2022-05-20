import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';

class CounterOfferSentBottomSheet extends StatelessWidget {
  CounterOffer counterOffer;
  final Function() onCancelClick;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final Function() onCounterEnd;
  final int duration;
  dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
          ['Orders']['IncomingOrders']['IncomingViewScreen']['components']
      ['CounterOfferBottomSheet']['CounterOfferSentBottomSheet'];

  CounterOfferSentBottomSheet(
      {required this.counterOffer,
      required this.onCancelClick,
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
        // Padding(
        //     padding: EdgeInsets.only(left: 50, right: 50),
        //     child: Center(
        //       child: Text(
        //         'Ride Offer',
        //         // _i18n()['offer'],
        //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
        //               fontSize: 15.sp,
        //               fontWeight: FontWeight.w600,
        //               fontFamily: 'Montserrat',
        //             ),
        //       ),
        //     )),
        // Padding(
        //   padding: EdgeInsets.only(left: 50, right: 50, top: 5),
        //   child: Divider(),
        // ),
        Container(
          width: Get.width,
          child: Center(
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(172, 89, 252, 1),
                    Color.fromRGBO(85, 130, 255, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Icon(
                Icons.local_taxi,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 7, left: 50, right: 50),
          child: Center(
            child: Text(
              'Ride offer',
              // _i18n()["rideOffer"],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
          child: Divider(),
        ),

        getBottomSheetBodyByCounterOfferStatus(counterOffer),
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 15),
          child: Divider(),
        ),
        button(
          bgColor: Color.fromRGBO(249, 216, 214, 1),
          color: Color.fromRGBO(226, 17, 50, 1),
          text: 'Cancel Offer',
          onTap: () async => await onCancelClick(),
        ), // Padding(
        //     padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(_i18n()['offerPrice']),
        //         Text("\$${counterOffer.price}"),
        //       ],
        //     )),
        // Padding(
        //     padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(_i18n()['offerStatus']),
        //         Text(
        //             "${counterOffer.counterOfferStatus.toFirebaseFormatString()}"),
        //       ],
        //     )),
        // Padding(
        //   padding: EdgeInsets.only(left: 50, right: 50, top: 5),
        //   child: Divider(),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
        //   child: Text(
        //     _i18n()['offerTip'],
        //     style: TextStyle(fontFamily: 'psr', fontSize: 10.sp),
        //   ),
        // )
      ],
    );
  }

  Widget getBottomSheetBodyByCounterOfferStatus(CounterOffer offer) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offer price',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              '\$${counterOffer.price}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        riderOfferStatusOrCounter(offer),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offer status',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Text(
              counterOffer.counterOfferStatus.toFirebaseFormatString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget riderOfferStatusOrCounter(CounterOffer counterOffer) {
    switch (counterOffer.counterOfferStatus) {
      case CounterOfferStatus.Rejected:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Color.fromRGBO(252, 89, 99, 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                size: 21,
                color: Colors.red,
              ),
            ),
            Container(
              width: Get.width - 200,
              child: Text(
                'Customer has declined your offer, You can make another offer.',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      case CounterOfferStatus.Accepted:
        return Icon(
          Icons.check_circle_rounded,
          size: 21,
          color: Colors.green,
        );
      default:
        return MezLoadingCounter(
          onCounterChange: (_) {},
          reversed: true,
          onCounterEnd: onCounterEnd,
          circleSize: size,
          counterDurationInSeconds: duration,
        );
    }
  }
}

Widget button(
    {required Color color,
    required Color bgColor,
    required String text,
    required Function() onTap}) {
  return InkWell(
      onTap: onTap,
      // !iOrderViewController.clickedAcceptButton.value
      //     ? iOrderViewController.onTaxiRideAccept
      //     : () => null,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(175, 175, 175, 0.25),
              offset: Offset(2.47, 2.47),
              blurRadius: 8.23,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
          //     getSizeRelativeToScreen(20, Get.height, Get.width))),
          color: bgColor, // Color.fromRGBO(206, 225, 205, 1),
        ),
        child: Center(
          child: Text(
            // _i18n()["acceptOrders"],
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ));
}
