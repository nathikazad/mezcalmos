import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';

class CounterOfferSentBottomSheet extends StatelessWidget {
  final CounterOffer counterOffer;
  final Function() onCancelClick;
  final IncomingOrdersController controller;
  final TaxiOrder order;
  final Function() onCounterEnd;
  final Function() onMakeNewOffer;
  final int duration;
  dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]["pages"]
          ['Orders']['IncomingOrders']['IncomingViewScreen']['components']
      ['CounterOfferBottomSheet']['CounterOfferSentBottomSheet'];

  const CounterOfferSentBottomSheet(
      {required this.counterOffer,
      required this.onMakeNewOffer,
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
        ...getButtonByStatus(counterOffer.counterOfferStatus)
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
        Flexible(flex: 2, child: riderOfferStatusOrCounter(offer)),
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
      case CounterOfferStatus.Expired:
        return counterOfferStatus(
          Icons.restore,
          'Your offer has expired.',
        );
      case CounterOfferStatus.Cancelled:
        return counterOfferStatus(
          Icons.close,
          'You have Canceled your offer.',
        );
      case CounterOfferStatus.Rejected:
        return counterOfferStatus(
          Icons.close,
          'Customer has rejected your offer.',
        );
      case CounterOfferStatus.Accepted:
        return counterOfferStatus(
          Icons.check_circle_rounded,
          'Customer has Accepted your offer, redirecting you ...',
          isError: false,
        );
      case CounterOfferStatus.Submitted:
        return MezLoadingCounter(
          onCounterChange: (_) {},
          reversed: true,
          onCounterEnd: onCounterEnd,
          circleSize: size,
          counterDurationInSeconds: duration,
        );
    }
  }

  Column counterOfferStatus(IconData icon, String text, {bool isError = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: isError
                ? Color.fromRGBO(252, 89, 99, 0.12)
                : Color.fromARGB(30, 89, 252, 92),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: isError ? Colors.red : Colors.green,
          ),
        ),
        Container(
          width: Get.width - 200,
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isError ? Colors.red : Colors.green,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getButtonByStatus(CounterOfferStatus counterOfferStatus) {
    switch (counterOfferStatus) {
      case CounterOfferStatus.Cancelled:
      case CounterOfferStatus.Expired:
      case CounterOfferStatus.Rejected:
        return [
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 15),
            child: Divider(),
          ),
          button(
            bgColor: Color.fromRGBO(233, 219, 245, 1),
            color: Color.fromRGBO(172, 89, 252, 1),
            text: 'Recreate Offer',
            onTap: onMakeNewOffer,
          )
        ];
      case CounterOfferStatus.Accepted:
        return [];
      default:
        return [
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 15),
            child: Divider(),
          ),
          button(
            bgColor: Color.fromRGBO(249, 216, 214, 1),
            color: Color.fromRGBO(226, 17, 50, 1),
            text: 'Cancel Offer',
            onTap: () async => await onCancelClick(),
          )
        ];
    }
  }
}

Widget button(
    {required Color color,
    required Color bgColor,
    required String text,
    required void Function() onTap}) {
  return InkWell(
      onTap: onTap,
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
