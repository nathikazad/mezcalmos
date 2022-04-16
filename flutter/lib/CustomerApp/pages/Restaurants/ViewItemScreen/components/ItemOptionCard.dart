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
  @override
  void initState() {
    widget.option.minimumChoice = 3;
    widget.option.maximumChoice = 5;
    // TODO: implement initState
    if (widget.option.minimumChoice > 0) {
      for (int i = 0; i < widget.option.minimumChoice; i++) {
        if (i <= widget.option.maximumChoice) {
          widget.cartItem.value!.setNewChoices(
              itemId: widget.option.name[userLanguage].toString().toLowerCase(),
              newChoices: widget.cartItem.value!.chosenChoices[widget
                      .option.name[userLanguage]
                      .toString()
                      .toLowerCase()]! +
                  [widget.option.choices[i]]);
        }
      }
    } else {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Column(
          children: [
            Text(
              widget.option.name[userLanguage].toString(),
            ),
            Text(
              "min : " + widget.option.minimumChoice.toString(),
            ),
            Text(
              "max :" + widget.option.maximumChoice.toString(),
            ),
            Text(
              "type :" + widget.option.optionType.toString(),
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

  Widget optionChoiceCard({required Choice choice}) {
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
                  value: widget
                      .cartItem
                      .value!
                      .chosenChoices[widget.option.name[userLanguage]
                          .toString()
                          .toLowerCase()]
                      ?.contains(choice),
                  onChanged: (bool? v) {
                    mezDbgPrint(
                        widget.cartItem.value!.chosenChoices.toString());
                    if (widget
                        .cartItem
                        .value!
                        .chosenChoices[widget.option.name[userLanguage]
                            .toString()
                            .toLowerCase()]!
                        .contains(choice)) {
                      mezDbgPrint("tapppppped");
                      if (widget
                              .cartItem
                              .value!
                              .chosenChoices[widget.option.name[userLanguage]
                                  .toString()
                                  .toLowerCase()]!
                              .length >
                          widget.option.minimumChoice) {
                        final List<Choice> newChoices = widget
                            .cartItem
                            .value!
                            .chosenChoices[widget.option.name[userLanguage]
                                .toString()
                                .toLowerCase()]!
                            .toList();
                        newChoices.remove(choice);
                        widget.cartItem.value!.setNewChoices(
                            itemId: widget.option.name[userLanguage]
                                .toString()
                                .toLowerCase(),
                            newChoices: newChoices);
                      }
                    } else if (widget.cartItem.value!.chosenChoices.length <
                        widget.option.maximumChoice) {
                      widget.cartItem.value!.setNewChoices(
                          itemId: widget.option.name[userLanguage]
                              .toString()
                              .toLowerCase(),
                          newChoices: widget.cartItem.value!.chosenChoices[
                                  widget.option.name[userLanguage]
                                      .toString()
                                      .toLowerCase()]! +
                              [choice]);
                    } else if (widget.cartItem.value!.chosenChoices.length ==
                        widget.option.maximumChoice) {
                      widget
                          .cartItem
                          .value!
                          .chosenChoices[widget.option.name[userLanguage]
                              .toString()
                              .toLowerCase()]!
                          .removeLast();
                      widget.cartItem.value!.setNewChoices(
                          itemId: widget.option.name[userLanguage]
                              .toString()
                              .toLowerCase(),
                          newChoices: widget.cartItem.value!.chosenChoices[
                                  widget.option.name[userLanguage]
                                      .toString()
                                      .toLowerCase()]! +
                              [choice]);
                    }
                    widget.cartItem.refresh();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
