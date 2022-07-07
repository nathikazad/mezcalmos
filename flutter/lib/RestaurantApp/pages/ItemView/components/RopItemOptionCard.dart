import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpItemOptionCard extends StatelessWidget {
  const ROpItemOptionCard(
      {Key? key,
      required this.option,
      this.itemId,
      required this.viewController})
      : super(key: key);
  final Option option;
  final String? itemId;
  final ItemViewController viewController;

  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (itemId != null) {
            mezDbgPrint("Tapped");
            final Option? newOp = await Get.toNamed(
                    getEditOptionRoute(optiondId: option.id, itemId: itemId!))
                as Option?;
            if (newOp != null) {
              mezDbgPrint("Frommmmmmmmmm ${newOp.toJson()}");
              viewController.editOption(option.id, newOp);
            }
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 7,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.name[userLanguage]!,
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Option type : ${option.optionType.toOptionName()}",
                      style: Get.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: SecondaryLightBlueColor),
                child: Text(
                  option.choices.length.toString(),
                  style: Get.textTheme.headline3
                      ?.copyWith(color: primaryBlueColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
