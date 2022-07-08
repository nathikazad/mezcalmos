import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpItemOptionCard extends StatefulWidget {
  const ROpItemOptionCard(
      {Key? key,
      required this.option,
      this.itemId,
      this.categoryID,
      required this.viewController})
      : super(key: key);
  final Option option;
  final String? categoryID;
  final String? itemId;
  final ItemViewController viewController;

  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  State<ROpItemOptionCard> createState() => _ROpItemOptionCardState();
}

class _ROpItemOptionCardState extends State<ROpItemOptionCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: (widget.itemId != null)
          ? Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.all(8),
                collapsedIconColor: primaryBlueColor,
                onExpansionChanged: (bool v) {
                  setState(() {
                    isExpanded = v;
                  });
                },
                iconColor: primaryBlueColor,
                trailing: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      color: SecondaryLightBlueColor, shape: BoxShape.circle),
                  child: (isExpanded)
                      ? Icon(Icons.expand_less)
                      : Icon(Icons.expand_more),
                ),

                //  tilePadding: EdgeInsets.all(5),
                tilePadding: EdgeInsets.zero,
                title: _optionHeader(),
                children: [
                  Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.grey.shade400),
                      child: _buildChoices(widget.option.choices)),
                ],
              ),
            )
          : _optionHeader(),
    );
  }

  Container _optionHeader() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              widget.option.name[userLanguage]!,
              style: Get.textTheme.bodyText1,
            ),
          ),
          _editBtn()
        ],
      ),
    );
  }

  Widget _editBtn() {
    return InkWell(
      onTap: () async {
        if (widget.itemId != null) {
          mezDbgPrint("Tapped");
          final Option? newOp = await Get.toNamed(getEditOptionRoute(
              optiondId: widget.option.id, itemId: widget.itemId!)) as Option?;
          if (newOp != null) {
            widget.viewController.editOption(widget.option.id, newOp);
          }
        }
      },
      customBorder: CircleBorder(),
      child: Ink(
        padding: const EdgeInsets.all(5),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
        child: Center(
          child: Icon(
            Icons.mode_edit_outline_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildChoices(List<Choice> choices) {
    return Column(
      children: List.generate(choices.length, (int index) {
        return Container(
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  choices[index].name[userLanguage]!,
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Switch(
                value: choices[index].available,
                onChanged: (bool v) {
                  widget.viewController.switchChoiceAvailablity(
                      choiceId: choices[index].id,
                      optionId: widget.option.id,
                      value: v,
                      catgeoryId: widget.categoryID ?? null,
                      itemId: widget.itemId!);
                },
                activeColor: primaryBlueColor,
                activeTrackColor: SecondaryLightBlueColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            ],
          ),
        );
      }),
    );
  }
}
