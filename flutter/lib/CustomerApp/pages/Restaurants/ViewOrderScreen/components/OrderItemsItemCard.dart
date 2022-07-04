import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

class OrderItemsItemCard extends StatefulWidget {
  const OrderItemsItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RestaurantOrderItem item;

  @override
  State<OrderItemsItemCard> createState() => _OrderItemsItemCardState();
}

class _OrderItemsItemCardState extends State<OrderItemsItemCard> {
  bool imageLoded = true;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: (widget.item.chosenChoices.isEmpty && widget.item.notes == null)
            ? _itemHeader(userLanguage, txt)
            : _itemExpandableComponent(context, userLanguage, txt),
      ),
    );
  }

  Widget _itemExpandableComponent(
      BuildContext context, LanguageType userLanguage, TextTheme txt) {
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
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: SecondaryLightBlueColor, shape: BoxShape.circle),
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
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      widget.item.notes!,
                      style: Theme.of(context).textTheme.bodyText2,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 5,
          ),
          Container(
            //  padding: const EdgeInsets.all(5),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (imageLoded)
                      ? CachedNetworkImageProvider(widget.item.image ?? '',
                          errorListener: () {
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
              flex: 6,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          widget.item.name[userLanguage]!,
                          style: txt.bodyText1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Text(
                          "x${widget.item.quantity}",
                          style: txt.bodyText1
                              ?.copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    // margin: EdgeInsets.all(5),

                    child: Text('\$' + widget.item.totalCost.toInt().toString(),
                        style: txt.bodyText1),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> buildChoices(
      Map<String, List<Choice>> choices, Map<String, LanguageMap> optionNames) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: optionNames[key]!,
      ));
    });
    return viewWidgets;
  }
}
