import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ItemOptionCard extends StatefulWidget {
  const ItemOptionCard(
      {Key? key,
      required this.option,
      required this.cartItem,
      this.editMode = false})
      : super(key: key);
  final Option option;
  final bool editMode;
  final Rxn<CartItem> cartItem;

  @override
  State<ItemOptionCard> createState() => _ItemOptionCardState();
}

class _ItemOptionCardState extends State<ItemOptionCard> {
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
  late String optionId;
  @override
  void initState() {
    optionId = widget.option.name[userLanguage].toString().toLowerCase();

    if (!widget.editMode) {
      assignMinimumChoices();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.option.name[userLanguage].toString(),
              style: Get.theme.textTheme.bodyText2,
            ),
            Column(
              children: List.generate(
                  widget.option.choices.length,
                  (int index) => optionChoiceCard(
                        choice: widget.option.choices[index],
                      )),
            )
          ],
        ),
      ),
    );
  }

  // Single choice card  //
  Widget optionChoiceCard({
    required Choice choice,
  }) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    choice.name[userLanguage].toString(),
                    style: Get.theme.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    (choice.cost > 0) ? "${choice.cost.round()} \$ " : "Free",
                    style: Get.theme.textTheme.headline3!
                        .copyWith(color: Get.theme.primaryColorLight),
                  ),
                ],
              ),
            ),
            Spacer(),
            Transform.scale(
              scale: 2.0,
              child: Checkbox(
                  activeColor: Get.theme.primaryColorLight,
                  shape: CircleBorder(),
                  value: widget.cartItem.value!.chosenChoices[optionId]
                      ?.contains(choice),
                  onChanged: (bool? v) {
                    handleChoiceCheckBox(choice);
                  }),
            )
          ],
        ),
      ),
    );
  }

// FUNCTIONS //
  void assignMinimumChoices() {
    for (int i = 0; i < widget.option.minimumChoice; i++) {
      widget.cartItem.value!.setNewChoices(
          optionId: optionId,
          newChoices: widget.cartItem.value!.chosenChoices[optionId]! +
              [widget.option.choices[i]]);
    }
  }

  void handleChoiceCheckBox(Choice choice) {
    if (widget.cartItem.value!.chosenChoices[optionId]!.contains(choice)) {
      removeChoice(choice);
    } else if (widget.cartItem.value!.chosenChoices[optionId]!.length <
        widget.option.maximumChoice) {
      addNewChoice(choice);
    } else if (widget.cartItem.value!.chosenChoices[optionId]!.length ==
        widget.option.maximumChoice) {
      addLastChoice(choice);
    }
    widget.cartItem.refresh();
  }

  void addLastChoice(Choice choice) {
    mezDbgPrint("Adding for last timee ========>");
    widget.cartItem.value!.chosenChoices[optionId]!.removeLast();
    widget.cartItem.value!.setNewChoices(
        optionId: optionId,
        newChoices: widget.cartItem.value!.chosenChoices[optionId]! + [choice]);
  }

  void addNewChoice(Choice choice) {
    mezDbgPrint("Adding for first time ========>");
    widget.cartItem.value!.setNewChoices(
        optionId: optionId,
        newChoices: widget.cartItem.value!.chosenChoices[optionId]! + [choice]);
  }

  void removeChoice(Choice choice) {
    if (widget.cartItem.value!.chosenChoices[optionId]!.length >
        widget.option.minimumChoice) {
      final List<Choice> newChoices =
          widget.cartItem.value!.chosenChoices[optionId]!.toList();
      newChoices.remove(choice);
      widget.cartItem.value!
          .setNewChoices(optionId: optionId, newChoices: newChoices);
    }
  }
}
