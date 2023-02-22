import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["components"]["MinimumCostCard"];
//

class LaundryOpMinimumCost extends StatelessWidget {
  const LaundryOpMinimumCost({Key? key, required this.minCost})
      : super(key: key);
  final Rxn<num> minCost;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${_i18n()["minCost"]}',
          style: Get.textTheme.bodyLarge,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: minCost.value.toString(),
          onChanged: (String v) {
            if (num.tryParse(v) != null) {
              minCost.value = num.parse(v);
            }
          },
          style: Get.textTheme.bodyLarge,
          decoration:
              InputDecoration(prefixIcon: Icon(Icons.attach_money_rounded)),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
          ],
        ),
      ],
    );
  }
}
