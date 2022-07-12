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
      margin: const EdgeInsets.only(bottom: 8, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSecondary)
            Text(" Choice name: ${viewController.prChoicesNames[index].text}"),
          SizedBox(
            height: 5,
          ),
          Row(
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
              Flexible(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      enabled: isSecondary == false,
                      controller: viewController.choicesPrices[index],
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? v) {
                        if (num.tryParse(v!) == null) {
                          return "Required";
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
              Container(
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: (isSecondary)
                      ? null
                      : () {
                          viewController.deleteChoice(
                              viewController.optionChoices[index].id);
                        },
                  customBorder: CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: isSecondary ? Colors.grey.shade400 : offRedColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.delete_outline,
                      color: isSecondary ? Colors.grey : Colors.red,
                    ),
                  ),
                ),
              )
            ],
          ),
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
