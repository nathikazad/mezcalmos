import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/components/ROpSpecialItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';

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
                Obx(
                  () => Column(
                    children: List.generate(
                        viewController.restaurant.value!.currentSpecials.length,
                        (int index) => ROpSpecialItemCard(
                            isCurrent: true,
                            viewController: viewController,
                            item: viewController
                                .restaurant.value!.currentSpecials[index])),
                  ),
                ),
                MezAddButton(
                  onClick: () {
                    Get.toNamed(getROpAddItemRoute(restaurantId: restaurantID),
                        arguments: {"specials": true});
                  },
                ),
                SizedBox(
                  height: 25,
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
