import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class RestaurantOrderItemsComponent extends StatefulWidget {
  const RestaurantOrderItemsComponent({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<RestaurantOrderItem> items;

  @override
  State<RestaurantOrderItemsComponent> createState() =>
      _RestaurantOrderItemsComponentState();
}

class _RestaurantOrderItemsComponentState
    extends State<RestaurantOrderItemsComponent> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  bool imageLoaded = true;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return _orderItemsItemCard(item: widget.items[index]);
            },
          )
        ],
      ),
    );
  }

  Widget _orderItemsItemCard({required RestaurantOrderItem item}) {
    return Card(
      child: Container(
        // padding: EdgeInsets.all(8),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(8),
            tilePadding: EdgeInsets.all(5),
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: (imageLoaded)
                        ? CachedNetworkImageProvider(item.image ?? '',
                            errorListener: () {
                            setState(() {
                              imageLoaded = false;
                            });
                          })
                        : AssetImage(aNoImage) as ImageProvider<Object>?,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  if (item.name[userLanguage] != null)
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Text(
                        item.name[userLanguage]!,
                        style: Get.theme.textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  Spacer(),
                  Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColorLight.withOpacity(0.2),
                        shape: BoxShape.circle),
                    padding: EdgeInsets.all(12),
                    child: Text(
                      item.quantity.toStringAsFixed(0),
                      style: Get.theme.textTheme.headline2!
                          .copyWith(color: Get.theme.primaryColorLight),
                    ),
                  ),
                ],
              ),
            ),
            children: [
              Theme(
                data: Get.theme.copyWith(dividerColor: Colors.grey.shade400),
                child: Column(
                  children: _buildChoices(item.chosenChoices),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Item Notes",
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\t\t${item.notes ?? "Nothing"}',
                  style: Get.theme.textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(height: 2, color: Colors.grey),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.bottomRight,
                child: Text('\$' + item.totalCost.toInt().toString(),
                    style: Get.theme.textTheme.bodyText1!
                        .copyWith(fontSize: 17.sp)),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChoices(Map<String, List<Choice>> choices) {
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
