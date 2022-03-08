import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RideReadByTaxisHint.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';

class ViewTaxiOrderScreenWidgets {
  final ViewTaxiOrderController viewController;
  ViewTaxiOrderScreenWidgets({required this.viewController});
  LanguageController lang = Get.find<LanguageController>();

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
                text: lang.strings['customer']['cancelOrder']['title'],
                body: lang.strings['customer']['cancelOrder']['question']);
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
                  lang.strings['customer']['taxiView']['cancel'],
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

  /// the hints [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return [
      MezToolTipHint(
        hintWidget: RidePriceControllHint(
            hintText: lang.strings['customer']['taxiView']
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

  /// this widget is either :
  ///
  /// 1. A Transparent Container with full Screen height wrapped with an `InkWell` : When `viewController.offersBtnClicked.value == true`
  ///
  /// (To absorb user's pointer taps inOrder to hide the bottomSheet upon a click on the background)
  ///
  /// 2. An Empty `SizedBox` when it's the opposit.
  Widget absorbOrIgnoreUserTapWidget() {
    // if there is a counter offer we give a user a way to reduce it by simply clicking on the background.
    if (viewController.offersBtnClicked.value)
      return InkWell(
        onTap: !viewController.clickedAccept.value
            ? () {
                viewController.offersBtnClicked.value = false;
                viewController.animatedSliderController.slideDown();
              }
            : null,
        child: Container(
          height: Get.height,
          width: Get.width,
        ),
      );
    else
      return SizedBox();
  }
}
