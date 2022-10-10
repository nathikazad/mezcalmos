import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpSpecialItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"]["components"]["ROpSpecialsComponent"];

//
class ROpSpecialsComponent extends StatelessWidget {
  const ROpSpecialsComponent(
      {Key? key, required this.viewController, required this.restaurantID})
      : super(key: key);
  final ROpMenuViewController viewController;
  final String restaurantID;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // current specials //
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_i18n()["currentSp"]}',
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 15,
                ),
                MezAddButton(
                  onClick: () {
                    Get.toNamed(getROpAddItemRoute(restaurantId: restaurantID),
                        arguments: {"specials": true});
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GroupedListView<Item, DateTime>(
                          shrinkWrap: true,
                          order: GroupedListOrder.DESC,
                          elements:
                              viewController.restaurant.value!.currentSpecials,
                          groupBy: (Item element) => DateTime(
                              element.startsAt!.year,
                              element.startsAt!.month,
                              element.startsAt!.day),
                          groupComparator: (DateTime value1, DateTime value2) =>
                              value2.compareTo(value1),
                          itemComparator: (Item element1, Item element2) =>
                              element2.startsAt!.compareTo(element1.startsAt!),
                          physics: NeverScrollableScrollPhysics(),
                          groupHeaderBuilder: (Item element) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                element.startsAt!
                                    .toDayName(withDateNumber: true),
                                style: Get.textTheme.headline3
                                    ?.copyWith(fontSize: 13.sp),
                              ),
                            );
                          },
                          separator: SizedBox(
                            height: 5,
                          ),
                          itemBuilder: (BuildContext context, Item element) {
                            return ROpSpecialItemCard(
                              item: element,
                              viewController: viewController,
                              isCurrent: true,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${_i18n()["recentSp"]}',
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.restaurant.value!.pastSpecials.length,
                        (int index) => ROpSpecialItemCard(
                            isCurrent: false,
                            viewController: viewController,
                            item: viewController
                                .restaurant.value!.pastSpecials[index])),
                  ),
                ),
              ],
            ),
          ),

          // recent specials //
          Container()
        ],
      ),
    );
  }
}
