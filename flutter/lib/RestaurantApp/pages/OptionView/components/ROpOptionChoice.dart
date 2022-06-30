import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

class ROpOptionChoice extends StatelessWidget {
  const ROpOptionChoice({
    Key? key,
    required this.viewController,
    required this.index,
    this.isSecondary = false,
  }) : super(key: key);
  final ROpOptionViewController viewController;
  final bool isSecondary;

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: TextFormField(
                controller: (isSecondary)
                    ? viewController.scChoicesNames[index]
                    : viewController.prChoicesNames[index],
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
                style: Get.textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: _getLabel(),
                  hintStyle: Get.textTheme.bodyText2,
                ),
              )),
          if (isSecondary == false)
            Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: TextFormField(
                    controller: viewController.choicesPrices[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? v) {
                      if (num.tryParse(v!) == null) {
                        return "Not valid";
                      } else {
                        return null;
                      }
                    },
                    textAlignVertical: TextAlignVertical.center,
                    style: Get.textTheme.bodyText1,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money),
                        hintStyle: Get.textTheme.bodyText2),
                  ),
                )),
          // IconButton(onPressed: () {}, icon: Icon(Icons.delete))
          if (isSecondary == false)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: InkWell(
                onTap: () {
                  viewController
                      .deleteChoice(viewController.optionChoices[index].id);
                },
                customBorder: CircleBorder(),
                child: Ink(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: offRedColor, shape: BoxShape.circle),
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  String _getLabel() {
    if (isSecondary) {
      return "Choice name in ${viewController.restaurant.value!.secondaryLanguage!.toLanguageName()}";
    } else {
      return "Choice name in ${viewController.restaurant.value!.primaryLanguage.toLanguageName()}";
    }
  }
}
