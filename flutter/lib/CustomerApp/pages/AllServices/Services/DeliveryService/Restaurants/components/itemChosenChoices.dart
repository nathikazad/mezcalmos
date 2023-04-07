import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ItemChosenChoiceComponent extends StatelessWidget {
  ItemChosenChoiceComponent({
    Key? key,
    required this.optionName,
    required this.choices,
  }) : super(key: key);
  final LanguageMap optionName;
  final List<Choice> choices;
  cModels.Language userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 15,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          optionName[userLanguage] ?? "OptionName",
          style: context.txt.bodyLarge,
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: List.generate(
              choices.length,
              (int index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            choices[index].name[userLanguage] ?? "choiceName",
                            style: context.txt.bodyMedium,
                            maxLines: 2,
                          ),
                        ),
                        if (choices[index].cost > 0)
                          Text(
                            "\$${choices[index].cost}",
                            style: context.txt.bodyMedium!
                                .copyWith(color: Get.theme.primaryColorLight),
                          ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
