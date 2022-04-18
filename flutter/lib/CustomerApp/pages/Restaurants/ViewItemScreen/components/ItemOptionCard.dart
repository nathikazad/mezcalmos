import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class NewItemOptionCard extends StatefulWidget {
  const NewItemOptionCard(
      {Key? key, required this.option, required this.cartItem})
      : super(key: key);
  final Option option;
  final Rxn<CartItem> cartItem;

  @override
  State<NewItemOptionCard> createState() => _NewItemOptionCardState();
}

class _NewItemOptionCardState extends State<NewItemOptionCard> {
  LanguageType userLanguage = Get.find<LanguageController>().userLanguageKey;
  late String optionId;
  @override
  void initState() {
    // FOR TEST PURPOSES
    // widget.option.minimumChoice = 1;
    // widget.option.maximumChoice = 1;
    // widget.option.freeChoice = 1;
    // widget.option.costPerExtra = 500;
    // GETTING OPTION NAME AS A NORMAL STRING THE KEY INSIDE CHOSENCHOICES //
    optionId = widget.option.name[userLanguage].toString().toLowerCase();

    assignMinimumChoices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.option.name[userLanguage].toString(),
            ),
            // TESTING PURPOSES //
            Text(
              "min : " + widget.option.minimumChoice.toString(),
            ),
            Text(
              "max :" + widget.option.maximumChoice.toString(),
            ),
            Text(
              "type :" + widget.option.optionType.toString(),
            ),
            // ENDIND TESTING PURPOSES //
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
                    "${choice.cost} \$ ",
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
                    mezDbgPrint(widget.cartItem.value!.chosenChoices);
                    handleChoiceCheckBox(choice);
                    // if (widget.cartItem.value!.chosenChoices[optionKey]!
                    //     .contains(choice)) {
                    //   if (widget.cartItem.value!.chosenChoices[optionKey]!
                    //           .length >
                    //       widget.option.minimumChoice) {
                    //     final List<Choice> newChoices = widget
                    //         .cartItem.value!.chosenChoices[optionKey]!
                    //         .toList();
                    //     newChoices.remove(choice);
                    //     widget.cartItem.value!.setNewChoices(
                    //         itemId: optionKey, newChoices: newChoices);
                    //   }
                    // } else if (widget.cartItem.value!.chosenChoices.length <
                    //     widget.option.maximumChoice) {
                    //   widget.cartItem.value!.setNewChoices(
                    //       itemId: optionKey,
                    //       newChoices:
                    //           widget.cartItem.value!.chosenChoices[optionKey]! +
                    //               [choice]);
                    // } else if (widget.cartItem.value!.chosenChoices.length ==
                    //     widget.option.maximumChoice) {
                    //   widget.cartItem.value!.chosenChoices[optionKey]!
                    //       .removeLast();
                    //   widget.cartItem.value!.setNewChoices(
                    //       itemId: optionKey,
                    //       newChoices:
                    //           widget.cartItem.value!.chosenChoices[optionKey]! +
                    //               [choice]);
                    // }
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
    } else if (widget.cartItem.value!.chosenChoices.length <
        widget.option.maximumChoice) {
      addNewChoice(choice);
    } else if (widget.cartItem.value!.chosenChoices.length ==
        widget.option.maximumChoice) {
      addLastChoice(choice);
    }
    widget.cartItem.refresh();
  }

  void addLastChoice(Choice choice) {
    widget.cartItem.value!.chosenChoices[optionId]!.removeLast();
    widget.cartItem.value!.setNewChoices(
        optionId: optionId,
        newChoices: widget.cartItem.value!.chosenChoices[optionId]! + [choice]);
  }

  void addNewChoice(Choice choice) {
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
