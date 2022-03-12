import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/CounterOffer.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/AnimatedSlider/AnimatedSlider.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:sizer/sizer.dart';

class CounterOfferWidgets {
  final ViewTaxiOrderController viewController;
  CounterOfferWidgets({required this.viewController});
  dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
      ["pages"]['Taxi']['ViewTaxiOrder']['components']['CounterOfferWidgets'];

  Widget offersButton() {
    return Container(
      child: InkWell(
        onTap: () {
          viewController.offersBtnClicked.value = true;
          viewController.animatedSliderController.slideUp();
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.purple.shade400,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _i18n()['offers'],
                  style: TextStyle(
                      fontFamily: "psr",
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Text(
                    viewController.counterOffers.length.toString(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget counterOffersBottomSheet(BuildContext context) {
    return AnimatedSlider(
      isPositionedCoordinates:
          AnimatedSliderCoordinates(left: 0, right: 0, bottom: 0),
      animatedSliderController: this.viewController.animatedSliderController,
      child: !viewController.clickedAccept.value
          ? counterOffersScrollView(context)
          : MezLogoAnimation(
              centered: true,
            ),
    );
  }

  SingleChildScrollView counterOffersScrollView(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      physics: ClampingScrollPhysics(),
      child: viewController.clickedAccept.value
          ? MezLogoAnimation(
              centered: true,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _i18n()['offers'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        viewController.counterOffers.length.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                ...getCounterOffersListItems(context),
              ],
            ),
    );
  }

  List<Widget> getCounterOffersListItems(BuildContext context) {
    List<Widget> _widgets = [];

    viewController.counterOffers().forEach((offer) {
      _widgets.addAll([
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50, top: 5),
          child: Divider(),
        ),
        buildContainer(offer, context)
        // list items of CounterOffer
      ]);
    });

    return _widgets;
  }

  Widget buildContainer(CounterOffer offer, BuildContext context) {
    return Container(
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
            onCounterChange: (price) {},
            childInsideCounter: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withAlpha(55),
                  image: DecorationImage(
                      image: mLoadImage(url: offer.driverInfos.image).image)),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.driverInfos.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  Text(
                    "\$${offer.price}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 11.sp),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 172, 89, 252),
                        shape: BoxShape.circle),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          viewController.clickedAccept.value = true;

                          // we accept counter offer and wait for it.
                          ServerResponse _response = await viewController
                              .taxiController
                              .acceptCounterOffer(
                                  viewController.order.value!.orderId,
                                  viewController.order.value!.customer.id,
                                  offer.driverInfos.id);
                          if (!_response.success) {
                            viewController.clickedAccept.value = false;
                          } else {
                            viewController.offersBtnClicked.value = false;
                          }
                        },
                        child: Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 89, 99),
                        shape: BoxShape.circle),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          // to do cancel count offer.
                          // we accept counter offer and wait for it.
                          viewController.taxiController
                              .rejectCounterOffer(
                                  viewController.order.value!.orderId,
                                  viewController.order.value!.customer.id,
                                  offer.driverInfos.id)
                              .then((_) => viewController
                                  .offersBtnClicked.value = false);
                        },
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
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
