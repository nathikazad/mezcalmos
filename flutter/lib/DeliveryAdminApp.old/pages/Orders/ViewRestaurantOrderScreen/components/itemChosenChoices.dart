import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ItemChosenChoiceComponent extends StatelessWidget {
  ItemChosenChoiceComponent({
    Key? key,
    required this.optionName,
    required this.choices,
  }) : super(key: key);
  final String optionName;
  final List<Choice> choices;
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          optionName + "  (${choices.length.toString()})",
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: List.generate(
              choices.length,
              (int index) => Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          choices[index].name[userLanguage] ?? "null",
                          style: Get.theme.textTheme.bodyText1,
                        ),
                        if (choices[index].cost > 0)
                          Text(
                            "\$ ${choices[index].cost}",
                            style: Get.theme.textTheme.bodyText1!
                                .copyWith(color: Get.theme.primaryColorLight),
                          ),
                      ],
                    ),
                  )),
        ),
        Divider(),
      ],
    );
  }
}
