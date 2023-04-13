import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Taxi"]["components"]["Hints"]["RideReadByTaxisHint"];

class RideReadByTaxisHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Center(
          child: Text(
            _i18n()['taxiRideCheckedTooltip'],
            textAlign: TextAlign.left,
            softWrap: true,
            maxLines: 10,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: Color.fromRGBO(103, 121, 254, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
