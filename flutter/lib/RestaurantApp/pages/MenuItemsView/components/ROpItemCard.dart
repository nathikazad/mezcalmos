import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/controllers/restaurantInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpItemCard extends StatefulWidget {
  const ROpItemCard({Key? key, required this.item, this.category})
      : super(key: key);
  final Item item;
  final Category? category;

  @override
  State<ROpItemCard> createState() => _ROpItemCardState();
}

class _ROpItemCardState extends State<ROpItemCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  RestaurantInfoController _restaurantInfoController =
      Get.find<RestaurantInfoController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image!),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  widget.item.name[userLanguage] ?? "",
                  style: Get.textTheme.bodyText1,
                ),
                Spacer(),
                Text(
                  widget.item.cost.toPriceString(),
                  style: Get.textTheme.bodyText1,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    // TODO IMPLEMENT ONTAP
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SecondaryLightBlueColor,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: primaryBlueColor,
                      size: 23,
                    ),
                  ),
                )
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
                Text("Category: "),
                Text(
                  widget.category?.name![userLanguage] ?? "None",
                  style: Get.textTheme.bodyText1,
                ),
                Spacer(),
                Text("Item status"),
                Switch(
                  value: widget.item.available,
                  onChanged: (bool v) {
                    _restaurantInfoController.switchItemAvailable(
                        widget.item.id!, v);
                  },
                  activeColor: primaryBlueColor,
                  activeTrackColor: SecondaryLightBlueColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
