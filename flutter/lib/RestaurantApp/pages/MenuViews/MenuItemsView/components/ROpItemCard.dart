import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Category.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"]["components"]["ROpItemCard"];
//

class ROpItemCard extends StatefulWidget {
  const ROpItemCard(
      {Key? key,
      required this.item,
      this.category,
      required this.viewController})
      : super(key: key);
  final Item item;
  final Category? category;
  final ROpMenuViewController viewController;

  @override
  State<ROpItemCard> createState() => _ROpItemCardState();
}

class _ROpItemCardState extends State<ROpItemCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  @override
  void initState() {
    super.initState();
  }

  RxBool imageError = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: (widget.viewController.reOrderMode.isTrue)
              ? null
              : () async {
                  final bool? shouldRefresh = await MezRouter.toNamed(
                          getEditItemRoute(
                              itemId: widget.item.id!,
                              categoryId: widget.category?.id ?? null,
                              restaurntID: widget.viewController.restaurnatId))
                      as bool?;

                  if (shouldRefresh == true) {
                    await widget.viewController.fetchCategories();
                  }
                },
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      onBackgroundImageError:
                          (Object exception, StackTrace? stackTrace) {
                        imageError.value = true;
                      },
                      backgroundImage:
                          (widget.item.image != null && imageError.isFalse)
                              ? CachedNetworkImageProvider(widget.item.image!)
                              : AssetImage(aNoImage) as ImageProvider,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        widget.item.name[userLanguage] ?? "",
                        style: Get.textTheme.bodyText1,
                        maxLines: 2,
                      ),
                    ),
                    (widget.viewController.reOrderMode.isTrue)
                        ? ROpRerorderIcon()
                        : Text(
                            widget.item.cost.toPriceString(),
                            style: Get.textTheme.bodyText1,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 4,
                ),
                Row(
                  children: [
                    (widget.category != null)
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text('${_i18n()["category"]}: '),
                                Text(
                                  widget.category?.name![userLanguage] ??
                                      "Error",
                                  style: Get.textTheme.bodyText2,
                                ),
                              ],
                            ),
                          )
                        : Spacer(),
                    Text(
                      '${_i18n()["available"]}',
                      maxLines: 2,
                    ),
                    Switch(
                      value: widget.item.available,
                      onChanged: (widget.viewController.reOrderMode.isTrue)
                          ? null
                          : (bool v) {
                              // _restaurantInfoController.switchItemAvailable(
                              //     itemId: widget.item.id!,
                              //     value: v,
                              //     caytegoryId: (widget.category != null)
                              //         ? widget.category!.id
                              //         : null);
                            },
                      activeColor: primaryBlueColor,
                      activeTrackColor: secondaryLightBlueColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
