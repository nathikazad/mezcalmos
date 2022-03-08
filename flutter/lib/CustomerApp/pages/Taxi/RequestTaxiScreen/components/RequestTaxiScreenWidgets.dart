import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/controllers/taxi/TaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/RequestTaxiScreen/controllers/RequestTaxiController.dart';
import 'package:mezcalmos/CustomerApp/pages/Taxi/components/Hints/RidePriceControllHint.dart';
import 'package:mezcalmos/Shared/widgets/MezToolTip.dart';

class HintsWidgets {
  final RequestTaxiController requestTaxiController;
  HintsWidgets({required this.requestTaxiController});

  /// the hints  [MezToolTipHint] that are related to this view !
  List<MezToolTipHint> getHints() {
    return [
      MezToolTipHint(
        hintWidget: RidePriceControllHint(
          hintText: requestTaxiController.languageController.strings['customer']
              ['taxiView']['taxiRequestPriceTooltip'],
        ),
        left: 80.1,
        bottom: 150.5,
        bodyLeft: 20,
        bodyRight: 20,
        bodyBottom: 150.5,
      ),
    ];
  }

  Widget getToolTip() {
    if (requestTaxiController.controller.numOfTimesToolTipShownToUser() <=
        nMaxTimesToShowTTipsOnCustomerApp)
      return MezToolTip(
          hintWidgetsList: getHints(), applyCacheIncrementing: false);
    else
      return SizedBox();
  }
}
