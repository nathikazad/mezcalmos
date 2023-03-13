import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/CategoryView/CategoryView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/ROpMenuView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"]["components"]["ROpCategoryItems"];

class ROpCategoryItems extends StatefulWidget {
  const ROpCategoryItems(
      {Key? key,
      required this.category,
      required this.viewController,
      required this.restaurantId})
      : super(key: key);
  final Category category;
  final int restaurantId;

  final ROpMenuViewController viewController;

  @override
  State<ROpCategoryItems> createState() => _ROpCategoryItemsState();
}

class _ROpCategoryItemsState extends State<ROpCategoryItems> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
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
                      widget.category.name?[userLanguage] ?? "",
                      style: context.txt.bodyText1,
                    ),
                  ),
                  (widget.viewController.reOrderMode.isTrue)
                      ? ROpRerorderIcon()
                      : _categoryMenuBtn(context)
                ],
              ),
              if (widget.category.dialog?[userLanguage] != null)
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    widget.category.dialog![userLanguage]!,
                    style: context.txt.bodyText2,
                  ),
                ),
              if (widget.category.items.isEmpty)
                Container(
                    alignment: Alignment.center,
                    child: Text('${_i18n()["noItems"]}')),
              (widget.viewController.reOrderMode.isTrue)
                  ? ReorderableListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      proxyDecorator: (Widget child, int index,
                          Animation<double> animation) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: child,
                        );
                      },
                      children: <Widget>[
                        for (int index = 0;
                            index < widget.category.items.length;
                            index += 1)
                          ROpItemCard(
                            key: Key('$index'),
                            viewController: widget.viewController,
                            item: widget.category.items[index],
                            category: widget.category,
                          ),
                      ],
                      onReorder: (int oldIndex, int newIndex) {
                        // to avoid last element missbehavior
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        widget.viewController.rorderSingleItem(
                            catgeoryId: widget.category.id!,
                            oldIndex: oldIndex,
                            newIndex: newIndex);
                      })
                  : Column(
                      children: List.generate(
                          widget.category.items.length,
                          (int index) => ROpItemCard(
                              item: widget.category.items[index],
                              category: widget.category,
                              viewController: widget.viewController)),
                    ),
            ],
          ),
        );
      },
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
                      onTap: () async {
                        MezRouter.back();
                        final bool? result =
                            await ROpCategoryView.navigateWithCategory(
                                categoryId: widget.category.id!,
                                restaurantId: widget.restaurantId) as bool?;
                        if (result == true) {
                          await widget.viewController.fetchCategories();
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          alignment: Alignment.center,
                          child: Text(
                            '${_i18n()["editCatgeory"]}',
                            style: context.txt.bodyText1,
                          )),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () async {
                        await showConfirmationDialog(context,
                            title: '${_i18n()["deleteTitle"]}',
                            helperText: '${_i18n()["deleteHelper"]}',
                            primaryButtonText: '${_i18n()["deleteBtn"]}',
                            onYesClick: () async {
                          mezDbgPrint("Clicked bbbbbbbb ${widget.category.id}");
                          await widget.viewController
                              .deleteCategory(categoryId: widget.category.id!)
                              .then((bool value) {
                            if (value) {
                              MezRouter.popTillExclusive(
                                  ROpMenuView.constructPath(
                                      restaurantId: widget.restaurantId));
                            }
                          });
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: Text(
                            '${_i18n()["deleteCatgeory"]}',
                            style: context.txt.bodyText1
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
