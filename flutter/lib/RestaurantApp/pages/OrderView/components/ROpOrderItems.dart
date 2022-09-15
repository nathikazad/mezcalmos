import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/orderController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
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
              child: (widget.item.chosenChoices.isEmpty &&
                      widget.item.notes == null)
                  ? _itemHeader(userLanguage, txt)
                  : _itemExpandableComponent(context, userLanguage, txt),
            ),
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
        subtitle: (widget.order.inProcess())
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(data: context.theme, child: Divider()),
                  _unAvailableBtn(),
                ],
              )
            : null,
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
                  widget.item.chosenChoices, widget.item.optionNames),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 5,
              ),
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
                          style: txt.bodyText1?.copyWith(
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
        ],
      ),
    );
  }

  Widget _unAvailableBtn() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: (!widget.order.inProcess() || widget.item.unavailable)
            ? null
            : () async {
                setState(() {
                  isLoading = true;
                });
                await Get.find<ROpOrderController>()
                    .markItemUnavailable(
                        widget.order.orderId, widget.item.idInCart)
                    .then((ServerResponse response) {
                  if (!response.success) {
                    Get.snackbar("Error", response.errorMessage ?? "Error");
                  }
                }).whenComplete(() {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
        child: Ink(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color:
                    (widget.item.unavailable) ? offRedColor : primaryBlueColor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Icon(
                    widget.item.unavailable
                        ? Icons.do_disturb_off
                        : Icons.do_disturb_on,
                    color: widget.item.unavailable ? Colors.red : Colors.white,
                    size: 14.sp,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  (widget.item.unavailable)
                      ? "${_i18n()["itemUnav"]}".capitalizeFirstofEach
                      : '${_i18n()["markitemUnav"]}',
                  style: Get.textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      color:
                          widget.item.unavailable ? Colors.red : Colors.white),
                ),
                SizedBox(
                  width: 3,
                ),
              ],
            )),
      ),
    );
  }

  List<Widget> buildChoices(
      Map<String, List<Choice>> choices, Map<String, LanguageMap> optionNames) {
    final List<Widget> viewWidgets = [];
    choices.forEach((String key, List<Choice> value) {
      viewWidgets.add(_itemChoiche(
        choices: value,
        optionName: optionNames[key]!,
      ));
    });
    return viewWidgets;
  }
}

Widget _itemChoiche(
    {required List<Choice> choices,
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
        style: Get.textTheme.bodyText1,
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
                          style: Get.theme.textTheme.bodyText2,
                          maxLines: 2,
                        ),
                      ),
                      if (choices[index].cost > 0)
                        Text(
                          "\$${choices[index].cost}",
                          style: Get.theme.textTheme.bodyText2!
                              .copyWith(color: Get.theme.primaryColorLight),
                        ),
                    ],
                  ),
                )),
      ),
    ],
  );
}
