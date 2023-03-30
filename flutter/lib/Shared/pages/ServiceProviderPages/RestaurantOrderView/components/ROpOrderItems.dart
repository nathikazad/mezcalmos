import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/MezExpandCard.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOrderView"]["components"]["ROpOrderItems"];

class ROpOrderItems extends StatefulWidget {
  const ROpOrderItems({
    Key? key,
    required this.item,
    required this.order,
  }) : super(key: key);

  final RestaurantOrderItem item;
  final RestaurantOrder order;

  @override
  State<ROpOrderItems> createState() => _ROpOrderItemsState();
}

class _ROpOrderItemsState extends State<ROpOrderItems> {
  bool imageLoded = true;
  bool isExpanded = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(
      child: (isLoading)
          ? Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: (widget.item.chosenChoices.isNotEmpty ||
                      widget.item.notes?.isNotEmpty == true)
                  ? _itemExpandableComponent(context, userLanguage, txt)
                  : _itemHeader(userLanguage, txt)),
    );
  }

  Widget _itemExpandableComponent(
      BuildContext context, LanguageType userLanguage, TextTheme txt) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: MezExpandCard(
        childrenPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        collapsedIconColor: primaryBlueColor,
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        onExpansionChanged: (bool v) {
          setState(() {
            isExpanded = v;
          });
        },
        iconColor: primaryBlueColor,

        trailing: Container(
          // width: 25,
          // height: 25,
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child:
              (isExpanded) ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
        ),

        //  tilePadding: EdgeInsets.all(5),
        tilePadding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        title: _itemHeader(userLanguage, txt),
        children: [
          Theme(
            data:
                Theme.of(context).copyWith(dividerColor: Colors.grey.shade400),
            child: Column(
              children: buildChoices(
                  context, widget.item.chosenChoices, widget.item.optionNames),
            ),
          ),
          if (widget.item.notes != null)
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  Container(
                    child: Text(
                      '${_i18n()["note"]} :',
                      style: context.txt.bodyLarge,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      widget.item.notes!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _itemHeader(LanguageType userLanguage, TextTheme txt) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 5,
              ),
              if (widget.order.showItemsImages)
                Container(
                  //  padding: const EdgeInsets.all(5),
                  height: 55,
                  width: 55,
                  foregroundDecoration: BoxDecoration(
                      color: (widget.item.unavailable)
                          ? Colors.white.withOpacity(0.4)
                          : null),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (imageLoded)
                            ? CachedNetworkImageProvider(
                                widget.item.image ?? '', errorListener: () {
                                setState(() {
                                  imageLoded = false;
                                });
                              })
                            : AssetImage(aNoImage) as ImageProvider<Object>,
                      )),
                ),
              SizedBox(
                width: 10,
              ),
              if (widget.item.name[userLanguage] != null)
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name[userLanguage]! +
                            " x${widget.item.quantity}",
                        style: txt.bodyLarge?.copyWith(
                            color: widget.item.unavailable
                                ? Colors.black.withOpacity(0.5)
                                : Colors.black,
                            decoration: (widget.item.unavailable)
                                ? TextDecoration.lineThrough
                                : null),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('\$' + widget.item.totalCost.toInt().toString(),
                          style: txt.bodyLarge?.copyWith(
                              color: widget.item.unavailable
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black,
                              decoration: (widget.item.unavailable)
                                  ? TextDecoration.lineThrough
                                  : null)),
                    ],
                  ),
                ),
            ],
          ),
          // if (widget.order.inProcess())
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Theme(data: context.theme, child: Divider()),
          //       _unAvailableBtn(),
          //     ],
          //   ),
        ],
      ),
    );
  }




  List<Widget> buildChoices(BuildContext context,
      Map<String, List<Choice>> choices, Map<String, LanguageMap> optionNames) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(_itemChoiche(
        context: context,
        choices: value,
        optionName: optionNames[key]!,
      ));
    });
    return viewWidgets;
  }
}

Widget _itemChoiche(
    {required List<Choice> choices,
    required BuildContext context,
    required Map<LanguageType, String> optionName}) {
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
        optionName[userLanguage] ?? "Error",
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
                        child: Text(
                          choices[index].name[userLanguage] ?? "Error",
                          style: Get.theme.textTheme.bodyMedium,
                          maxLines: 2,
                        ),
                      ),
                      if (choices[index].cost > 0)
                        Text(
                          "\$${choices[index].cost}",
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(color: Get.theme.primaryColorLight),
                        ),
                    ],
                  ),
                )),
      ),
    ],
  );
}
