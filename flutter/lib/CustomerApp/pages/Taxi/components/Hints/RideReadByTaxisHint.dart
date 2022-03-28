import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]
 ["Taxi"]["components"]["Hints"]["RideReadByTaxisHint"];

class RideReadByTaxisHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            _i18n()['taxiRideCheckedTooltip'],
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 10,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
