import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpSpecialItemCard.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/DateTimeHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/widgets/MezAddButton.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"]["components"]["ROpSpecialsComponent"];

//
class ROpSpecialsComponent extends StatefulWidget {
  const ROpSpecialsComponent(
      {Key? key, required this.viewController, required this.restaurantID})
      : super(key: key);
  final ROpMenuViewController viewController;
  final int restaurantID;

  @override
  State<ROpSpecialsComponent> createState() => _ROpSpecialsComponentState();
}

class _ROpSpecialsComponentState extends State<ROpSpecialsComponent> {
  @override
  void initState() {
    widget.viewController.fetchSpecials();
    super.initState();
  }

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
                  onClick: () async {
                    final bool? newItemAdded = await MezRouter.toNamed(
                        getROpAddItemRoute(
                            restaurantId: widget.viewController.restaurnatId),
                        arguments: {"specials": true}) as bool?;
                    if (newItemAdded == true) {
                      await widget.viewController.fetchSpecials();
                    }
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
                        if (widget.viewController.currentSpec.isNotEmpty)
                          GroupedListView<Item, DateTime>(
                            shrinkWrap: true,
                            order: GroupedListOrder.ASC,
                            elements: widget.viewController.currentSpec,
                            groupBy: (Item element) => DateTime(
                              element.startsAt!.toLocal().year,
                              element.startsAt!.toLocal().month,
                              element.startsAt!.toLocal().day,
                            ),
                            // groupComparator: (DateTime value1, DateTime value2) =>
                            //     value2
                            //         .toLocal()
                            //         .day
                            //         .compareTo(value1.toLocal().day),
                            itemComparator: (Item element1, Item element2) =>
                                element2.startsAt!
                                    .toLocal()
                                    .compareTo(element1.startsAt!.toLocal()),
                            physics: NeverScrollableScrollPhysics(),
                            groupHeaderBuilder: (Item element) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  element.startsAt!
                                      .toLocal()
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
                                viewController: widget.viewController,
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
                Obx(
                  () {
                    if (widget.viewController.pastSpec.isNotEmpty) {
                      return Column(
                        children: [
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
                          Column(
                            children: List.generate(
                                widget.viewController.pastSpec.length,
                                (int index) => ROpSpecialItemCard(
                                    isCurrent: false,
                                    viewController: widget.viewController,
                                    item:
                                        widget.viewController.pastSpec[index])),
                          ),
                        ],
                      );
                    } else
                      return SizedBox();
                  },
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
