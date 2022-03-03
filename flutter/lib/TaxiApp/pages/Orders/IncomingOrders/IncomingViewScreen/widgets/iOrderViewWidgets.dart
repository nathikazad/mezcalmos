import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/TaxiApp/components/CounterOfferBottomSheet/CounterOfferPriceSetter.dart';
import 'package:mezcalmos/TaxiApp/components/CounterOfferBottomSheet/CounterOfferSentBottomSheet.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingViewScreen/controller/iOrderViewController.dart';
import 'package:mezcalmos/TaxiApp/router.dart';
import 'package:sizer/sizer.dart';

class IOrderViewWidgets {
  final IOrderViewController iOrderViewController;

  IOrderViewWidgets({required this.iOrderViewController});

  /// this holds the two Accept / Offer buttons.
  Positioned acceptAndOfferButtons() {
    return Positioned(
      bottom: GetStorage().read(getxGmapBottomPaddingKey),
      left: 10,
      right: 10,
      child: Container(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: acceptOrderButton(
                child: !iOrderViewController.clickedAcceptButton.value
                    ? Text(
                        iOrderViewController.lang.strings['taxi']['taxiView']
                            ["acceptOrders"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const SizedBox(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        height: 20,
                        width: 20,
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(flex: 1, child: offerBtn()),
          ],
        ),
      ),
    );
  }

  /// this holds the BottomSheet when the TaxiDriver clicks offer Price.
  Positioned counterOfferBottomSheet() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: iOrderViewController.clickedOffersBtn.value ||
                    iOrderViewController.counterOffer.value != null
                ? 40.h
                : 0,
            curve: Curves.easeInExpo,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, blurRadius: 10, spreadRadius: 5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                physics: ClampingScrollPhysics(),
                child: iOrderViewController.counterOffer.value != null
                    ? CounterOfferSentBottomSheet(
                        counterOffer: iOrderViewController.counterOffer.value!,
                        controller: iOrderViewController.controller,
                        order: iOrderViewController.order!,
                        onRejected: iOrderViewController
                            .removeCounterOfferAndResetState,
                        onAccepted: () async => await iOrderViewController
                            .removeCounterOfferAndResetState
                            .call(expired: false),
                        onCounterEnd: () async => await iOrderViewController
                            .removeCounterOfferAndResetState(),
                      )
                    : CounterOfferPriceSetter(
                        counterOffer: iOrderViewController.counterOffer,
                        controller: iOrderViewController.controller,
                        order: iOrderViewController.order!,
                        onCountOfferSent: (priceOffered) =>
                            iOrderViewController.onCountOfferSent(priceOffered),
                        onPriceChanged: (price) {
                          mezDbgPrint("New Price offered ===> $price");
                        },
                      ))));
  }

  Widget acceptOrderButton({required Widget child}) {
    return TextButton(
      style: ButtonStyle(
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 79, 168, 35)),
      ),
      onPressed: !iOrderViewController.clickedAcceptButton.value
          ? () async {
              String _orderId = iOrderViewController.order!.orderId;
              iOrderViewController.clickedAcceptButton.value = true;

              ServerResponse serverResponse =
                  await iOrderViewController.controller.acceptTaxi(_orderId);

              if (serverResponse.success) {
                await iOrderViewController
                    .avoidAcceptRideRaceCondition(_orderId);
                // canceling Subscription Just to Avoid possible Racing Conditions
                iOrderViewController.cancelOrderSubscription();
                // Go to CurrentOrder View !
                Get.offNamedUntil(
                    kCurrentOrderRoute, ModalRoute.withName(kHomeRoute));
                // Notice the User !
              } else {
                // in case Taxi User failed accepting the iOrderViewController.order.
                iOrderViewController.clickedAcceptButton.value = false;
                Get.back();
                MezSnackbar("Oops..", serverResponse.errorMessage!);
              }
            }
          : () => null,
      child: child,
    );
  }

  Widget offerBtn() {
    return TextButton(
      style: ButtonStyle(
        // fixedSize: MaterialStateProperty.all(Size(Get.width / 1.05,
        //     getSizeRelativeToScreen(20, Get.height, Get.width))),
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 172, 89, 252)),
      ),
      onPressed: () {
        iOrderViewController.clickedOffersBtn.value = true;
      },
      child: Text(
        'Offer price',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
