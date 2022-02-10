import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

class RideReadByTaxisHint extends StatelessWidget {
  final LanguageController lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            lang.strings['customer']['taxiView']['taxiRideCheckedTooltip'],
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
