import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/ItemView/ROpItemView.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/components/ROpReorderIcon.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router/router.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
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
                  final bool? shouldRefresh = await ROpItemView.navigate(
                      itemId: widget.item.id!,
                      categoryId: widget.category?.id ?? null,
                      restaurantId: widget.viewController.restaurnatId,
                      arguments: <String, dynamic>{"specials": false}) as bool;

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
                        style: context.txt.bodyLarge,
                        maxLines: 2,
                      ),
                    ),
                    (widget.viewController.reOrderMode.isTrue)
                        ? ROpRerorderIcon()
                        : Text(
                            widget.item.cost.toPriceString(),
                            style: context.txt.bodyLarge,
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
                                  style: context.txt.bodyMedium,
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
                              widget.viewController
                                  .switchItemAv(item: widget.item, value: v);
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
