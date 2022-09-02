import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';

class RestaurantgridItemCard extends StatefulWidget {
  const RestaurantgridItemCard(
      {Key? key,
      required this.item,
      required this.restaurant,
      this.isSpecial = false})
      : super(key: key);
  final Item item;
  final Restaurant restaurant;
  final bool isSpecial;

  @override
  State<RestaurantgridItemCard> createState() => _RestaurantgridItemCardState();
}

class _RestaurantgridItemCardState extends State<RestaurantgridItemCard> {
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;
  bool isImageExist = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(
            getItemRoute(widget.restaurant.info.id, widget.item.id!),
            arguments: {
              "mode": ViewItemScreenMode.AddItemMode,
              "isSpecial": widget.isSpecial
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isImageExist && widget.item.image != null)
              CircleAvatar(
                radius: 45,
                backgroundImage: CachedNetworkImageProvider(widget.item.image!),
                onBackgroundImageError: (Object e, StackTrace? s) {
                  mezDbgPrint(
                      "Item ${widget.item.name} ==========> Image url corrupted please check ");
                  setState(() {
                    isImageExist = false;
                  });
                },
              ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.item.name[userLanguage] ?? "",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "\$${widget.item.cost}",
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
