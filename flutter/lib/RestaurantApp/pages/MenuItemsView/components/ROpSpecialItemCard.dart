import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuItemsView/controllers/ROpMenuViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

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
      child: Container(
        margin: const EdgeInsets.all(12),
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
              child: Text(
                item.name[userLanguage] ?? "",
                style: Get.textTheme.bodyText1,
              ),
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
                    shape: BoxShape.circle, color: secondaryLightBlueColor),
                child: Icon(
                  (isCurrent) ? Icons.remove : Icons.add,
                  color: primaryBlueColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}