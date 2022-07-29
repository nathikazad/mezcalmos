import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpCategoryItems extends StatelessWidget {
  const ROpCategoryItems(
      {Key? key,
      required this.category,
      required this.viewController,
      required this.restaurantId})
      : super(key: key);
  final Category category;
  final String restaurantId;

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
                (viewController.reOrderMode.isTrue)
                    ? ROpRerorderIcon()
                    : _categoryMenuBtn(context)
              ],
            ),
            if (category.dialog?[userLanguage] != null)
              Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  category.dialog![userLanguage]!,
                  style: Get.textTheme.bodyText2,
                ),
              ),
            if (category.items.isEmpty)
              Container(alignment: Alignment.center, child: Text("No items")),
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

  Widget _categoryMenuBtn(BuildContext context) {
    return InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              builder: (BuildContext ctx) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed(getCategoryEditRoute(
                            categoryId: category.id!, restaurantId: ""));
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          alignment: Alignment.center,
                          child: Text(
                            "Edit category",
                            style: Get.textTheme.bodyText1,
                          )),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        showConfirmationDialog(context,
                            title: "Delete category",
                            helperText:
                                "Are you sure you want to delete this category",
                            primaryButtonText: "Yes, delete",
                            onYesClick: () async {
                          await viewController.deleteCategory(
                              categoryId: category.id!);
                        }).then((value) => Get.back());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: Text(
                            "Delete category",
                            style: Get.textTheme.bodyText1
                                ?.copyWith(color: Colors.red),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              });
        },
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: Icon(Icons.more_horiz_rounded)));
  }
}
