import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/Components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Choice.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewOrderScreen"]["components"]["OrdersItemsCard"];

class OrderItemsItemCard extends StatefulWidget {
  OrderItemsItemCard(
      {Key? key, required this.item, required this.order, this.isWebVersion})
      : super(key: key);

  final RestaurantOrderItem item;
  final RestaurantOrder order;
  bool? isWebVersion = false;

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
            : _itemExpandableComponent(
                context, userLanguage, txt, widget.isWebVersion),
      ),
    );
  }

  Widget _itemExpandableComponent(BuildContext context,
      LanguageType userLanguage, TextTheme txt, bool? isWebVersion) {
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
                      style: txt.bodyText1!.copyWith(),
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
                        style: txt.bodyText1?.copyWith(
                            color: widget.item.unavailable
                                ? Colors.black.withOpacity(0.5)
                                : Colors.black,
                            fontSize: widget.isWebVersion == true ? 16 : null,
                            decoration: (widget.item.unavailable)
                                ? TextDecoration.lineThrough
                                : null),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$' + widget.item.totalCost.toInt().toString(),
                              style: txt.bodyText1?.copyWith(
                                  color: widget.item.unavailable
                                      ? Colors.black.withOpacity(0.5)
                                      : Colors.black,
                                  fontSize:
                                      widget.isWebVersion == true ? 16 : null,
                                  decoration: (widget.item.unavailable)
                                      ? TextDecoration.lineThrough
                                      : null)),
                          if (widget.item.unavailable) _itemunav(context),
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

  Row _itemunav(BuildContext context) {
    final txt = Theme.of(context).textTheme;
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
          style: txt.bodyText2?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11.sp,
              color: widget.item.unavailable ? Colors.red : Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  // Widget _itemHeader(LanguageType userLanguage, TextTheme txt) {
  //   return Container(
  //     height: 60,
  //     alignment: Alignment.center,
  //     margin: EdgeInsets.symmetric(horizontal: 8),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         if (widget.order.showItemsImages)
  //           Container(
  //             margin: const EdgeInsets.only(right: 8),
  //             height: 55,
  //             width: 55,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(12),
  //                 image: DecorationImage(
  //                     fit: BoxFit.cover,
  //                     image: (imageLoded)
  //                         ? CachedNetworkImageProvider(widget.item.image ?? '',
  //                             errorListener: () {
  //                             setState(() {
  //                               imageLoded = false;
  //                             });
  //                           })
  //                         : AssetImage(aNoImage) as ImageProvider)),
  //           ),
  //         if (widget.item.name[userLanguage] != null)
  //           Flexible(
  //             flex: 6,
  //             fit: FlexFit.tight,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Flexible(
  //                       flex: 3,
  //                       child: Text(
  //                         widget.item.name[userLanguage]!.inCaps,
  //                         style: txt.bodyText1,
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 5,
  //                     ),
  //                     Flexible(
  //                       child: Text(
  //                         "x${widget.item.quantity}",
  //                         style: txt.bodyText1
  //                             ?.copyWith(fontWeight: FontWeight.w700),
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 3,
  //                 ),
  //                 Container(
  //                   // margin: EdgeInsets.all(5),

  //                   child: Text('\$' + widget.item.totalCost.toInt().toString(),
  //                       style: txt.bodyText1),
  //                 ),
  //               ],
  //             ),
  //           ),
  //       ],
  //     ),
  //   );
  // }

  List<Widget> buildChoices(
      Map<String, List<Choice>> choices, Map<String, LanguageMap> optionNames) {
    mezDbgPrint(optionNames);
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      mezDbgPrint(
          "[544DDD] choices.forEach ==> KEY ($key)  |  VALUE (${value.toString()})");
      viewWidgets.add(ItemChosenChoiceComponent(
        choices: value,
        optionName: optionNames[key]!,
        isWebVersion: widget.isWebVersion,
      ));
    });
    return viewWidgets;
  }
}
