import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpCategoryItems extends StatelessWidget {
  const ROpCategoryItems(
      {Key? key, required this.category, required this.viewController})
      : super(key: key);
  final Category category;
  static final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  final ROpMenuViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    category.name![userLanguage]!,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                if (viewController.reOrderMode.isTrue) ROpRerorderIcon()
              ],
            ),
            if (category.dialog != null)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  category.dialog![userLanguage]!,
                  style: Get.textTheme.bodyText2,
                ),
              ),
            (viewController.reOrderMode.isTrue)
                ? ReorderableListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    proxyDecorator:
                        (Widget child, int index, Animation<double> animation) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: child,
                      );
                    },
                    children: <Widget>[
                      for (int index = 0;
                          index < category.items.length;
                          index += 1)
                        ROpItemCard(
                          key: Key('$index'),
                          viewController: viewController,
                          item: category.items[index],
                          category: category,
                        ),
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      mezDbgPrint("OLD INDEX ======>>>>> $oldIndex");
                      mezDbgPrint("NEw INDEX ======>>>>> $newIndex");
                      // to avoid last element missbehavior
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      viewController.rorderSingleItem(
                          catgeoryId: category.id!,
                          oldIndex: oldIndex,
                          newIndex: newIndex);
                    })
                : Column(
                    children: List.generate(
                        category.items.length,
                        (int index) => ROpItemCard(
                            item: category.items[index],
                            category: category,
                            viewController: viewController)),
                  ),
          ],
        ),
      ),
    );
  }
}
