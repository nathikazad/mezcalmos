import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpCategoryItems extends StatelessWidget {
  const ROpCategoryItems({Key? key, required this.category}) : super(key: key);
  final Category category;
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.name![userLanguage]!,
            style: Get.textTheme.bodyText1,
          ),
          if (category.dialog != null)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                category.dialog![userLanguage]!,
                style: Get.textTheme.bodyText2,
              ),
            ),
          Column(
            children: List.generate(
                category.getItems.length,
                (int index) => ROpItemCard(
                      item: category.getItems[index],
                      category: category,
                    )),
          )
        ],
      ),
    );
  }
}
