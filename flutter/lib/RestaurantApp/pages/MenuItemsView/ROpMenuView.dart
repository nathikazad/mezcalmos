import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpCategoryItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpSpecialsComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/CallToActionButton.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"];
//

class ROpMenuView extends StatefulWidget {
  const ROpMenuView({Key? key}) : super(key: key);

  @override
  _ROpMenuViewState createState() => _ROpMenuViewState();
}

class _ROpMenuViewState extends State<ROpMenuView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ROpMenuViewController viewController = ROpMenuViewController();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    viewController.init();

    super.initState();
  }

  @override
  void dispose() {
    viewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Back,
          onClick: handleBack,
          title: '${_i18n()["menu"]}',
          showNotifications: true,
          tabBar: _tabBar()),
      bottomNavigationBar: Obx(() {
        if (viewController.reOrderMode.isTrue) {
          return CallToActionButton(
            onTap: () async {
              await viewController
                  .saveReorder()
                  .then((value) => viewController.reOrderMode.value = false);
            },
            text: '${_i18n()["saveOrder"]}',
            height: 65,
          );
        } else
          return Container(
            height: 0,
          );
      }),
      body: Obx(
        () => TabBarView(
          controller: _tabController,
          children: [
            // Items view //
            SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  MezAddButton(
                    onClick: () {
                      Get.toNamed(kCategoryView);
                    },
                    title: '${_i18n()["addCategory"]}',
                    btnColor: primaryBlueColor,
                    primaryColor: Colors.white,
                  ),
                  MezAddButton(
                    onClick: () {
                      Get.toNamed(kItemView);
                    },
                    title: '${_i18n()["addItem"]}',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_i18n()["categories"]}',
                        style: Get.textTheme.bodyText1,
                      ),
                      (viewController.reOrderMode.isTrue)
                          ? SizedBox()
                          : _reorderBtn()
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  _categoriesItemsList(),
                  _noCategoryItemsList()
                ],
              ),
            ),

            // specials view //
            ROpSpecialsComponent(viewController: viewController),
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
        controller: _tabController,
        labelColor: primaryBlueColor,
        unselectedLabelColor: Colors.grey.shade800,
        labelStyle: Get.textTheme.bodyText1,
        unselectedLabelStyle: Get.textTheme.bodyText2,
        tabs: [
          Tab(
            text: '${_i18n()["myItems"]}',
          ),
          Tab(
            text: '${_i18n()["specials"]}',
          ),
        ]);
  }

  InkWell _reorderBtn() {
    return InkWell(
      onTap: () {
        viewController.startReoderMode();
      },
      child: Ink(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Ink(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: secondaryLightBlueColor),
              child: Icon(
                Icons.low_priority_rounded,
                color: primaryBlueColor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${_i18n()["reorder"]}',
              style: Get.textTheme.bodyText1?.copyWith(color: primaryBlueColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoriesItemsList() {
    return Obx(
      () => Container(
        alignment: Alignment.centerLeft,
        child: (viewController.reOrderMode.isTrue)
            ? ReorderableListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  for (int index = 0;
                      index < viewController.rOcategories.length;
                      index += 1)
                    ROpCategoryItems(
                        key: Key('$index'),
                        category: viewController.rOcategories[index],
                        viewController: viewController)
                ],
                onReorder: (int oldIndex, int newIndex) {
                  // to avoid last element missbehavior
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  viewController.rorderSingleCategory(
                      oldIndex: oldIndex, newIndex: newIndex);
                })
            : Column(
                children: List.generate(
                    viewController.restaurant.value!.getCategories.length,
                    (int index) => ROpCategoryItems(
                        viewController: viewController,
                        category: viewController
                            .restaurant.value!.getCategories[index])),
              ),
      ),
    );
  }

  Widget _noCategoryItemsList() {
    if (viewController.restaurant.value!.getItemsWithoutCategory != null) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${_i18n()["noCategory"]}'),
            SizedBox(
              height: 5,
            ),
            Column(
              children: List.generate(
                  viewController
                      .restaurant.value!.getItemsWithoutCategory!.length,
                  (int index) => ROpItemCard(
                      viewController: viewController,
                      item: viewController
                          .restaurant.value!.getItemsWithoutCategory![index])),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  void handleBack() {
    mezDbgPrint(viewController.reOrderMode.value);
    if (viewController.reOrderMode.isTrue) {
      showConfirmationDialog(context,
          title: '${_i18n()["cancelTitle"]}',
          primaryButtonText: '${_i18n()["prCancelBtn"]}',
          helperText: '${_i18n()["cancelHelperText"]}', onYesClick: () async {
        viewController.cancelReoderMode();
        Get.back();
      });
    } else {
      Get.back();
    }
  }
}
