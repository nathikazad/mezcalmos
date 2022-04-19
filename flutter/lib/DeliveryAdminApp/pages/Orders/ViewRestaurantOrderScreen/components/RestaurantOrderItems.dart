import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/DeliveryAdminApp/pages/Orders/ViewRestaurantOrderScreen/components/itemChosenChoices.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Orders/RestaurantOrder.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class RestaurantOrderItemsComponent extends StatelessWidget {
  RestaurantOrderItemsComponent({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<RestaurantOrderItem> items;
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return _orderItemsItemCard(item: items[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _orderItemsItemCard({required RestaurantOrderItem item}) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(item.image),
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
            Divider(),
            Column(
              children: _buildChoices(item.chosenChoices),
            ),
            Container(
              margin: EdgeInsets.all(5),
              alignment: Alignment.bottomRight,
              child: Text('\$' + item.totalCost.toInt().toString(),
                  style:
                      Get.theme.textTheme.bodyText1!.copyWith(fontSize: 17.sp)),
            )
          ],
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
