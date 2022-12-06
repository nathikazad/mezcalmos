import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpCategoryItems.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpSpecialsComponent.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:mezcalmos/Shared/widgets/MezLogoAnimation.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"];
//

class ROpMenuView extends StatefulWidget {
  const ROpMenuView({Key? key, this.restID, this.canGoBack = true})
      : super(key: key);
  final String? restID;
  final bool canGoBack;
  @override
  _ROpMenuViewState createState() => _ROpMenuViewState();
}

class _ROpMenuViewState extends State<ROpMenuView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ROpMenuViewController viewController = ROpMenuViewController();
  String? restaurantID;
  @override
  void initState() {
    restaurantID = widget.restID ?? Get.parameters["restaurantId"];

    if (restaurantID != null) {
      _tabController = TabController(length: 2, vsync: this);
      Future.microtask(() async {
        await viewController.init(restId: restaurantID!);
      });
    }

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
      appBar: mezcalmosAppBar(
        AppBarLeftButtonType.Back,
        onClick: handleBack,
        title: '${_i18n()["menu"]}',
        showNotifications: true,
        tabBar: _tabBar(),
      ),
      body: Obx(
        () {
          if (viewController.pageLoaded.value) {
            return TabBarView(
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
                        onClick: () async {
                          mezDbgPrint("Tapped");

                          final bool? newCategoryAdded = await Get.toNamed(
                              getROpCategoryRoute(
                                  restaurantId: restaurantID!)) as bool?;
                          if (newCategoryAdded == true) {
                            await viewController.fetchCategories();
                          }
                        },
                        title: '${_i18n()["addCategory"]}',
                        btnColor: primaryBlueColor,
                        primaryColor: Colors.white,
                      ),
                      MezAddButton(
                        onClick: () async {
                          final bool? newItemAdded = await Get.toNamed(
                              getROpAddItemRoute(
                                  restaurantId: restaurantID!)) as bool?;
                          if (newItemAdded == true) {
                            await viewController.fetchCategories();
                          }
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
                      //   _noCategoryItemsList()
                    ],
                  ),
                ),
                // specials view //
                ROpSpecialsComponent(
                  restaurantID: restaurantID!,
                  viewController: viewController,
                ),
              ],
            );
          } else {
            return MezLogoAnimation(
              centered: true,
            );
          }
        },
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
        child:
            // (viewController.reOrderMode.isTrue)
            //     ? ReorderableListView(
            //         shrinkWrap: true,
            //         physics: NeverScrollableScrollPhysics(),
            //         children: <Widget>[
            //           for (int index = 0;
            //               index < viewController.rOcategories.length;
            //               index += 1)
            //             ROpCategoryItems(
            //                 key: Key('$index'),
            //                 category: viewController.rOcategories[index],
            //                 restaurantId: restaurantID!,
            //                 viewController: viewController)
            //         ],
            //         onReorder: (int oldIndex, int newIndex) {
            //           // to avoid last element missbehavior
            //           if (oldIndex < newIndex) {
            //             newIndex -= 1;
            //           }
            //           viewController.rorderSingleCategory(
            //               oldIndex: oldIndex, newIndex: newIndex);
            //         })
            //     :
            Column(
          children: List.generate(
              viewController.mainCategories.length,
              (int index) => ROpCategoryItems(
                  viewController: viewController,
                  restaurantId: restaurantID!,
                  category: viewController.mainCategories[index])),
        ),
      ),
    );
  }

  // Widget _noCategoryItemsList() {
  //   if (viewController.restaurant.value!.getItemsWithoutCategory != null) {
  //     return Container(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('${_i18n()["noCategory"]}'),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Column(
  //             children: List.generate(
  //                 viewController
  //                     .restaurant.value!.getAvItemsWithoutCategories!.length,
  //                 (int index) => ROpItemCard(
  //                     viewController: viewController,
  //                     item: viewController.restaurant.value!
  //                         .getAvItemsWithoutCategories![index])),
  //           ),
  //         ],
  //       ),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

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
      if (widget.canGoBack) {
        Get.back();
      }
    }
  }
}
