import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/ViewTaxiOrder/controllers/ViewTaxiOrderController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RideReadByTaxisHint.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/TaxiOrder/TaxiOrder.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';
import 'package:sizer/sizer.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]["Taxi"]
        ["ViewTaxiOrder"]["components"]["ViewTaxiOrderScreenWidgets"];

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

  Widget cancelButton(TaxiOrdersStatus status, BuildContext context) {
    mezDbgPrint("Status ===> $status");
    if (status != TaxiOrdersStatus.LookingForTaxi &&
        status != TaxiOrdersStatus.LookingForTaxiScheduled) {
      return SizedBox();
    } else {
      return Container(
        child: InkWell(
          onTap: () async {
            await showConfirmationDialog(
              context,
              onYesClick: () async {
                final ServerResponse resp =
                    await viewController.taxiController.cancelTaxi(
                  viewController.order.value!.orderId,
                );
                if (!resp.success) {
                  MezSnackbar(
                    "Error",
                    resp.errorMessage ?? "Failed canceling taxi :(",
                  );
                }
                MezRouter.back<void>();
              },
            );
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 216, 214, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                _i18n()['cancel'],
                style: TextStyle(
                  fontFamily: "psr",
                  color: Color.fromRGBO(226, 17, 50, 0.93),
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
    }
  }

  /// the hints [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return <MezToolTipHint>[
      MezToolTipHint(
        hintWidget:
            RidePriceControllHint(hintText: _i18n()['taxiRidePriceTooltip']),
        left: 80.1,
        bottom: 130.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 130.5,
      ),
      MezToolTipHint(
        hintWidget: RideReadByTaxisHint(),
        left: 60.w,
        bottom: 130.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 130.5,
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
      return const SizedBox();
  }
}
