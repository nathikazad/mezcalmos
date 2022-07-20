import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';

class CounterOfferWidgets {
  final ViewTaxiOrderController viewController;

  CounterOfferWidgets({required this.viewController});

  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
      ["pages"]['Taxi']['ViewTaxiOrder']['components']['CounterOfferWidgets'];

  Widget counterOffersBottomSheet(BuildContext context) {
    return AnimatedSlider(
      isPositionedCoordinates:
          AnimatedSliderCoordinates(left: 0, right: 0, bottom: 0),
      animatedSliderController: viewController.animatedSliderController,
      child: !viewController.clickedAccept.value
          ? counterOffersScrollView(context)
          : MezLogoAnimation(centered: true),
    );
  }

  SingleChildScrollView counterOffersScrollView(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      physics: ClampingScrollPhysics(),
      child: viewController.clickedAccept.value
          ? MezLogoAnimation(centered: true)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                      _i18n()['offers'],
                      // _i18n()["rideOffer"],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
                ...getCounterOffersListItems(context),
              ],
            ),
    );
  }

  List<Widget> getCounterOffersListItems(BuildContext context) {
    final List<Widget> _widgets = <Widget>[];

    viewController.counterOffers().forEach((CounterOffer offer) {
      mezDbgPrint("Offer => ${offer.isValid} | ${offer.counterOfferStatus}");
      _widgets.addAll(
        <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 5),
            child: Divider(),
          ),
          buildContainer(offer, context)
          // list items of CounterOffer
        ],
      );
    });

    return _widgets;
  }

  Widget buildContainer(CounterOffer offer, BuildContext context) {
    return SizedBox(
      // height: 100,
      width: Get.width,
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          child: MezLoadingCounter(
            circleSize: 45,
            reversed: true,
            loadingLineHeight: 7,
            counterDurationInSeconds: offer.validityTimeDifference().abs(),
            onCounterEnd: () {
              viewController.animatedSliderController.slideDown();
            },
            onCounterChange: (int price) {},
            childInsideCounter: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withAlpha(55),
                image: DecorationImage(
                  image: mLoadImage(url: offer.driverInfo.image).image,
                ),
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text(
                    offer.driverInfo.name,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\$${offer.price}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(83, 172, 94, 0.24),
                      borderRadius: BorderRadius.circular(3),
                      // shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          viewController.clickedAccept.value = true;

                          // we accept counter offer and wait for it.
                          final ServerResponse _response = await viewController
                              .taxiController
                              .acceptCounterOffer(
                            viewController.order.value!.orderId,
                            viewController.order.value!.customer.id,
                            offer.driverInfo.id,
                          );
                          if (_response.success) {
                            viewController.clickedAccept.value = false;
                            viewController.animatedSliderController.slideDown();
                          } else {
                            viewController.offersBtnClicked.value = false;
                            viewController.animatedSliderController.slideDown();
                            MezSnackbar("Oops", _i18n()['failedToAcceptOffer']);
                          }
                        },
                        child: context.width <= 320
                            ? Icon(
                                Icons.check,
                                size: 18,
                                color: Color.fromRGBO(33, 145, 37, 1),
                              )
                            : Text(
                                "Accept",
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 145, 37, 1),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 235, 236, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          viewController.taxiController
                              .rejectCounterOffer(
                                  viewController.order.value!.orderId,
                                  viewController.order.value!.customer.id,
                                  offer.driverInfo.id)
                              .then(
                            (_) {
                              viewController.offersBtnClicked.value = false;
                              viewController.animatedSliderController
                                  .slideDown();
                            },
                          );
                        },
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
