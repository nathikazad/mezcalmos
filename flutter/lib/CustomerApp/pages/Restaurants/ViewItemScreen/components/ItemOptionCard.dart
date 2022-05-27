import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
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
    optionId = widget.option.id;
    if (!widget.editMode) {
      assignMinimumChoices();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.option.name[userLanguage].toString(),
            style: Get.theme.textTheme.bodyText1,
          ),
          SizedBox(
            height: 5,
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
    );
  }

  // Single choice card  //
  Widget optionChoiceCard({
    required Choice choice,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    choice.name[userLanguage].toString(),
                    style: Get.theme.textTheme.bodyText2?.copyWith(
                      fontWeight: (widget
                                  .cartItem.value!.chosenChoices[optionId]
                                  ?.contains(choice) ??
                              false)
                          ? FontWeight.w700
                          : null,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  (choice.cost > 0) ? " + \$${choice.cost.round()}  " : "",
                  style: Get.theme.textTheme.bodyText2!.copyWith(
                    color: Get.theme.primaryColorLight,
                    fontWeight: (widget.cartItem.value!.chosenChoices[optionId]
                                ?.contains(choice) ??
                            false)
                        ? FontWeight.w700
                        : null,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 10,
          // ),

          Spacer(),
          if (widget.option.optionType == OptionType.ChooseMany)
            _selectCircle(
                value: widget.cartItem.value!.chosenChoices[optionId]
                        ?.contains(choice) ??
                    false,
                onTap: (bool? v) {
                  handleChoiceCheckBox(choice);
                }),
          if (widget.option.optionType == OptionType.ChooseOne)
            _radioCircle(
                value: widget.cartItem.value!.chosenChoices[optionId]
                        ?.contains(choice) ??
                    false,
                onTap: (bool? v) {
                  handleChoiceCheckBox(choice);
                }),
        ],
      ),
    );
  }

  Widget _selectCircle(
      {bool value = false, required void Function(bool?) onTap}) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onTap.call(null);
      },
      child: Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.all(5),
          child: (value)
              ? Icon(
                  Icons.check,
                  size: 22,
                  color: Colors.white,
                )
              : Icon(
                  Icons.add,
                  color: primaryBlueColor,
                  size: 22,
                ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value ? primaryBlueColor : SecondaryLightBlueColor,
          )),
    );
  }

  Widget _radioCircle(
      {bool value = false, required void Function(bool?) onTap}) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onTap.call(null);
      },
      child: Ink(
          child: (value)
              ? Icon(
                  Icons.radio_button_checked,
                  size: 25,
                  color: primaryBlueColor,
                )
              : Icon(
                  Icons.circle_outlined,
                  color: primaryBlueColor,
                  size: 25,
                ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          )),
    );
  }

// FUNCTIONS //
  void assignMinimumChoices() {
    widget.cartItem.value!.setNewChoices(
        optionId: optionId,
        newChoices: widget.option.choices
            .sublist(0, (widget.option.minimumChoice as int)));
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
