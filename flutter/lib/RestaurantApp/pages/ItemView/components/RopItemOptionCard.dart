import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/ItemView/controllers/ItemViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class ROpItemOptionCard extends StatefulWidget {
  const ROpItemOptionCard(
      {Key? key,
      this.itemId,
      this.categoryID,
      required this.viewController,
      required this.restaurantID})
      : super(key: key);
  final String restaurantID;
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
    return Obx(
      () => Column(
          children: List.generate(
              widget.viewController.itemOptions.length,
              (int index) => _itemOptionCard(
                  option: widget.viewController.itemOptions[index],
                  context: context))),
    );
  }

  Card _itemOptionCard(
      {required Option option, required BuildContext context}) {
    return Card(
        child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child: (isExpanded)
              ? Icon(
                  Icons.expand_less,
                  size: 20,
                )
              : Icon(
                  Icons.expand_more,
                  size: 20,
                ),
        ),
        tilePadding: EdgeInsets.zero,
        title: _optionHeader(option: option),
        children: [
          Theme(
              data: Theme.of(context)
                  .copyWith(dividerColor: Colors.grey.shade400),
              child: _buildChoices(option: option)),
        ],
      ),
    ));
  }

  Container _optionHeader({required Option option}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              option.name[userLanguage]!,
              style: Get.textTheme.bodyText1,
            ),
          ),
          _editBtn(option: option)
        ],
      ),
    );
  }

  Widget _editBtn({required Option option}) {
    return InkWell(
      onTap: () async {
        final Option? newOp = await Get.toNamed(
            getROpOptionRoute(restaurantId: widget.restaurantID),
            arguments: {
              "option": option,
              "itemId": widget.itemId,
              "categoryId": widget.categoryID
            }) as Option?;
        if (newOp != null) {
          widget.viewController.editOption(option.id, newOp);
        } else {
          widget.viewController.deleteOption(optionId: option.id);
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

  Widget _buildChoices({required Option option}) {
    return Column(
      children: List.generate(option.choices.length, (int index) {
        return Container(
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  option.choices[index].name[userLanguage]!,
                  style: Get.textTheme.bodyText1,
                ),
              ),
              Switch(
                value: option.choices[index].available,
                onChanged: (bool v) {
                  widget.viewController.switchChoiceAv(
                      choiceId: option.choices[index].id,
                      optionId: option.id,
                      value: v);
                  widget.viewController.itemOptions.refresh();
                },
                activeColor: primaryBlueColor,
                activeTrackColor: secondaryLightBlueColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            ],
          ),
        );
      }),
    );
  }
}
