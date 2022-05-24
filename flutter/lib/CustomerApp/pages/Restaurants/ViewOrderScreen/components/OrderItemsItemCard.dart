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
        // padding: EdgeInsets.all(8),
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
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: SecondaryLightBlueColor, shape: BoxShape.circle),
              child: (isExpanded)
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),

            //  tilePadding: EdgeInsets.all(5),
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: (imageLoded)
                        ? CachedNetworkImageProvider(widget.item.image ?? '',
                            errorListener: () {
                            setState(() {
                              imageLoded = false;
                            });
                          })
                        : AssetImage(aNoImage) as ImageProvider<Object>?,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (widget.item.name[userLanguage] != null)
                    Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.name[userLanguage]!,
                            style: txt.bodyText1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            // margin: EdgeInsets.all(5),

                            child: Text(
                                '\$' + widget.item.totalCost.toInt().toString(),
                                style: txt.bodyText1),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.grey.shade400),
                child: Column(
                  children: buildChoices(widget.item.chosenChoices),
                ),
              ),
              if (widget.item.notes != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("${_i18n()["itemNotes"]}"),
                      ),
                      Container(
                        child: Text(
                          widget.item.notes!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Divider(color: Get.theme.dividerColor),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildChoices(Map<String, List<Choice>> choices) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: key,
      ));
    });
    return viewWidgets;
  }
}
