import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart' as cModels;
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

class OrderItemsItemCard extends StatefulWidget {
  const OrderItemsItemCard({
    Key? key,
    required this.item,
    required this.order,
  }) : super(key: key);

  final RestaurantOrderItem item;
  final RestaurantOrder order;

  @override
  State<OrderItemsItemCard> createState() => _OrderItemsItemCardState();
}

class _OrderItemsItemCardState extends State<OrderItemsItemCard> {
  bool imageLoded = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final cModels.Language userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(
      margin: EdgeInsets.only(top: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: (widget.item.chosenChoices.isEmpty && widget.item.notes == null)
            ? Container(
                margin: EdgeInsets.only(top: 4.5, bottom: 4.5),
                child: _itemHeader(userLanguage, txt),
              )
            : _itemExpandableComponent(context, userLanguage, txt),
      ),
    );
  }

  Widget _itemExpandableComponent(
      BuildContext context, cModels.Language userLanguage, TextTheme txt) {
    return Theme(
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
          margin: const EdgeInsets.only(right: 14),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: secondaryLightBlueColor, shape: BoxShape.circle),
          child:
              (isExpanded) ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
        ),

        //  tilePadding: EdgeInsets.all(5),
        tilePadding: EdgeInsets.zero,
        title: _itemHeader(userLanguage, txt),
        children: [
          Theme(
            data:
                Theme.of(context).copyWith(dividerColor: Colors.grey.shade400),
            child: Column(
              children: buildChoices(
                  widget.item.chosenChoices, widget.item.optionNames),
            ),
          ),
          if (widget.item.notes != null)
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              //   alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  Container(
                    child: Text(
                      "${_i18n()["itemNotes"]}",
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

  Widget _itemHeader(cModels.Language userLanguage, TextTheme txt) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 8,
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
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: widget.item.name[userLanguage]!,
                          style: txt.bodyLarge?.copyWith(
                              color: widget.item.unavailable
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.black,
                              decoration: (widget.item.unavailable)
                                  ? TextDecoration.lineThrough
                                  : null),
                          children: <TextSpan>[
                            TextSpan(
                              text: " x${widget.item.quantity}",
                              style: txt.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: widget.item.unavailable
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black,
                                  decoration: (widget.item.unavailable)
                                      ? TextDecoration.lineThrough
                                      : null),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$' + widget.item.totalCost.toInt().toString(),
                              style: txt.bodyLarge?.copyWith(
                                  color: widget.item.unavailable
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black,
                                  decoration: (widget.item.unavailable)
                                      ? TextDecoration.lineThrough
                                      : null)),
                          if (widget.item.unavailable) _itemunav(),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Row _itemunav() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          child: Icon(
            Icons.do_disturb_off,
            color: Colors.red,
            size: 14.sp,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          '${_i18n()["itemUnav"]}',
          style: context.txt.headline6?.copyWith(
              color: widget.item.unavailable ? Colors.red : Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  List<Widget> buildChoices(
      Map<String, List<Choice>> choices, Map<String, LanguageMap> optionNames) {
    mezDbgPrint(optionNames);
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      mezDbgPrint(
          "[544DDD] choices.forEach ==> KEY ($key)  |  VALUE (${value.toString()})");
      viewWidgets.add(
        ItemChosenChoiceComponent(
          choices: value,
          optionName: optionNames[key]!,
        ),
      );
    });
    return viewWidgets;
  }
}
