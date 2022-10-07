import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/RestaurantApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpMenuView"]["components"]["ROpItemCard"];

//
class ROpSpecialItemCard extends StatelessWidget {
  const ROpSpecialItemCard(
      {Key? key,
      required this.item,
      required this.isCurrent,
      required this.viewController})
      : super(key: key);
  final Item item;
  final ROpMenuViewController viewController;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.toNamed(
              getEditItemRoute(
                  itemId: item.id!,
                  restaurntID: viewController.restaurant.value!.info.id),
              arguments: {"specials": true});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: (item.image != null)
                    ? CachedNetworkImageProvider(item.image!)
                    : AssetImage(aNoImage) as ImageProvider,
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name[userLanguage] ?? "",
                      style: Get.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (item.getPeriod != null) Text(item.getPeriod!.toString())
                  ],
                ),
              ),
              // SizedBox(
              //   width: 15,
              // ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(item.cost.toPriceString(),
                              style: Get.textTheme.bodyText1),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          onTap: () {
                            if (isCurrent) {
                              viewController.removeFromSpecials(item: item);
                            } else {
                              viewController.addToSpecials(item: item);
                            }
                          },
                          customBorder: CircleBorder(),
                          child: Ink(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: secondaryLightBlueColor),
                            child: Icon(
                              (isCurrent) ? Icons.remove : Icons.add,
                              color: primaryBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${_i18n()["available"]}'),
                        Switch(
                          value: item.available,
                          onChanged: (bool v) {
                            viewController.switchSpecialItemAv(
                                v: v, itemId: item.id!, isCurrent: isCurrent);
                          },
                          activeColor: primaryBlueColor,
                          activeTrackColor: secondaryLightBlueColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
