import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ViewItemScreen"]["components"]["ItemOptionCard"];

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
    optionId = widget.option.id.toString();
    if (!widget.editMode) {
      assignDefaultChoice();
      assignMinimumChoices();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: (widget.option.haveAtLeastOnChoiceAvailable)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.option.name[userLanguage].toString().inCaps,
                    style: Get.theme.textTheme.bodyLarge),
                if (widget.option.optionType == OptionType.Custom)
                  Container(
                    child: Text(
                      "${widget.option.freeChoice} ${_i18n()["included"]} (${_i18n()["extra"]} ${widget.option.costPerExtra.toPriceString()})",
                      style: Get.textTheme.titleLarge
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                  ),
                Column(
                  children: List.generate(
                    widget.option.choices.length,
                    (int index) => optionChoiceCard(
                      choice: widget.option.choices[index],
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(),
    );
  }

  // Single choice card  //
  Widget optionChoiceCard({
    required Choice choice,
  }) {
    if (choice.available) {
      return Container(
        child: Row(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    choice.name[userLanguage].toString().inCaps,
                    style: Get.theme.textTheme.bodyMedium?.copyWith(
                      color: (widget.cartItem.value!.chosenChoices[optionId]
                                  ?.contains(choice) ??
                              false)
                          ? primaryBlueColor
                          : null,
                      fontWeight: (widget
                                  .cartItem.value!.chosenChoices[optionId]
                                  ?.contains(choice) ??
                              false)
                          ? FontWeight.w700
                          : null,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    (choice.cost > 0) ? " + \$${choice.cost.round()}  " : "",
                    style: Get.theme.textTheme.bodyMedium!.copyWith(
                      color: Get.theme.primaryColorLight,
                      fontWeight: (widget
                                  .cartItem.value!.chosenChoices[optionId]
                                  ?.contains(choice) ??
                              false)
                          ? FontWeight.w700
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            //  Spacer(),
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
                },
              ),
            if (widget.option.optionType == OptionType.Custom)
              Container(
                child: _selectCircle(
                    value: widget.cartItem.value!.chosenChoices[optionId]
                            ?.contains(choice) ??
                        false,
                    onTap: (bool? v) {
                      handleChoiceCheckBox(choice);
                    }),
              ),
          ],
        ),
      );
    } else
      return SizedBox();
  }

  Widget _selectCircle(
      {bool value = false, required void Function(bool?) onTap}) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        onTap.call(null);
      },
      child: Container(
          margin: EdgeInsets.only(top: 5),
          alignment: Alignment.center,
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
            color: value ? primaryBlueColor : secondaryLightBlueColor,
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
      child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 0),
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
    if (widget.option.minimumChoice == 1) {
      widget.cartItem.value!.setNewChoices(
          optionId: optionId, newChoices: [widget.option.getChoices.first]);
    } else if (widget.option.minimumChoice > 0) {
      widget.cartItem.value!.setNewChoices(
          optionId: optionId,
          newChoices: widget.option.choices
              .sublist(0, (widget.option.minimumChoice as int)));
    }
  }

  void assignDefaultChoice() {
    mezDbgPrint("GET DEFAULT CHOICE =======>${widget.option.minimumChoice}");
    widget.cartItem.value!.setNewChoices(
        optionId: optionId, newChoices: [widget.option.getChoices.first]);
  }

  void handleChoiceCheckBox(Choice choice) {
    mezDbgPrint(widget.option.maximumChoice);
    if (widget.cartItem.value!.chosenChoices[optionId] != null) {
      if (widget.cartItem.value!.chosenChoices[optionId]?.contains(choice) ==
          true) {
        removeChoice(choice);
      } else if (widget.cartItem.value!.chosenChoices[optionId]!.length <
          widget.option.maximumChoice) {
        addNewChoice(choice);
      } else if (widget.cartItem.value!.chosenChoices[optionId]!.length ==
          widget.option.maximumChoice) {
        addLastChoice(choice);
      }
      widget.cartItem.refresh();
    } else {
      //   widget.cartItem.value!.chosenChoices[optionId] = choice.toJson();
    }
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
