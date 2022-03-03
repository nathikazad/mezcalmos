import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RideReadByTaxisHint.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ImageHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezLoadingCounter.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';
import 'package:sizer/sizer.dart';

class ViewTaxiOrderScreenWidgets {
  final ViewTaxiOrderController viewController;
  ViewTaxiOrderScreenWidgets({required this.viewController});

  /// this builds [MezToolTip] with the given [getHints()],
  ///
  /// if [Get.find<TaxiController>().numOfTimesToolTipShownToUser()] has already set to 5+,
  ///
  /// we won't show it, instead we simply return an empty box.
  Widget getToolTip() {
    // only if not marker as read more than 4 times or status isLookingForTaxi
    if (viewController.order.value!.status == TaxiOrdersStatus.LookingForTaxi &&
        viewController.taxiController.numOfTimesToolTipShownToUser() <=
            nMaxTimesToShowTTipsOnCustomerApp)
      return MezToolTip(
        hintWidgetsList: getHints(),
      );
    else
      return SizedBox();
  }

  Widget cancelButton(TaxiOrdersStatus status) {
    if (status != TaxiOrdersStatus.LookingForTaxi) {
      return SizedBox();
    } else {
      return Container(
        child: InkWell(
          onTap: () async {
            YesNoDialogButton res = await yesNoDialog(
                text: viewController.lang.strings['customer']['cancelOrder']
                    ['title'],
                body: viewController.lang.strings['customer']['cancelOrder']
                    ['question']);
            if (res == YesNoDialogButton.Yes) {
              await viewController.taxiController
                  .cancelTaxi(viewController.order.value!.orderId);
            }
          },
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  viewController.lang.strings['customer']['taxiView']['cancel'],
                  style: TextStyle(
                      fontFamily: "psr",
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      );
    }
  }

  Widget offersButton() {
    return Container(
      child: InkWell(
        onTap: () {
          viewController.offersBtnClicked.value = true;
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
                  'offers',
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

  /// the hints [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return [
      MezToolTipHint(
        hintWidget: RidePriceControllHint(
            hintText: viewController.lang.strings['customer']['taxiView']
                ['taxiRidePriceTooltip']),
        left: 80.1,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      ),
      MezToolTipHint(
        hintWidget: RideReadByTaxisHint(),
        left: 199,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      )
    ];
  }

  Widget counterOffersBottomSheet(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: viewController.offersBtnClicked.value ? 40.h : 0,
        curve: Curves.easeInExpo,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 5)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: !viewController.clickedAccept.value
            ? SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
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
                                  'Offers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 14.sp),
                                ),
                                Text(
                                  viewController.counterOffers.length
                                      .toString(),
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
              )
            : MezLogoAnimation(
                centered: true,
              ),
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
        // list items of CounterOffer
        Container(
          // height: 100,
          width: Get.width,
          child: ListTile(
            leading: Container(
              height: 45,
              width: 45,
              child: MezLoadingCounter(
                circleSize: 45,
                loadingLineHeight: 7,
                manualCounterValue:
                    ((nDefaultCounterOfferValidExpireTimeInSeconds -
                            offer.validityTimeDifference().abs()) /
                        nDefaultCounterOfferValidExpireTimeInSeconds),
                counterDurationInSeconds:
                    nDefaultCounterOfferValidExpireTimeInSeconds,
                // (nDefaultCounterOfferValidExpireTimeInSeconds - (diff_result)) 0.0333333333
                // nDefaultCounterOfferValidExpireTimeInSeconds,
                onCounterEnd: () {},
                onCounterChange: (price) {},
                childInsideCounter: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withAlpha(55),
                      image: DecorationImage(
                          image:
                              mLoadImage(url: offer.driverInfos.image).image)),
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      Text(
                        "\$${offer.price}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
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
                              viewController.taxiController.rejectCounterOffer(
                                  viewController.order.value!.orderId,
                                  viewController.order.value!.customer.id,
                                  offer.driverInfos.id);
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
        ),
      ]);
    });

    return _widgets;
  }
}
