import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/LaundryApp/pages/AdminView/controllers/LaundryOpAdminViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["LaundryApp"]["pages"]
    ["AdminView"]["components"]["MinimumCostCard"];
//

class LaundryOpMinimumCost extends StatefulWidget {
  const LaundryOpMinimumCost({Key? key, required this.viewController})
      : super(key: key);
  final LaundryOpAdminViewController viewController;

  @override
  State<LaundryOpMinimumCost> createState() => _LaundryOpMinimumCostState();
}

class _LaundryOpMinimumCostState extends State<LaundryOpMinimumCost> {
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
          initialValue: widget.viewController.minCost.value.toString(),
          onChanged: (String v) {
            if (num.tryParse(v) != null) {
              widget.viewController.newMin.value = num.parse(v);
            }
          },
          style: Get.textTheme.bodyLarge,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.attach_money_rounded),
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
          ],
        ),
        Obx(() {
          if (widget.viewController.newMin.value != null &&
              widget.viewController.minCost.value !=
                  widget.viewController.newMin.value) {
            return MezButton(
              label: "${_i18n()['save']}",
              onClick: () async {
                await widget.viewController.updateMiCost();
              },
            );
          } else
            return SizedBox();
        })
      ],
    );
  }
}
