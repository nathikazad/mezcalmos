import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantgridItemCard extends StatefulWidget {
  const RestaurantgridItemCard(
      {Key? key, required this.item, required this.restaurant})
      : super(key: key);
  final Item item;
  final Restaurant restaurant;

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
            getItemRoute(widget.restaurant.info.id, widget.item.id),
            arguments: {"mode": ViewItemScreenMode.AddItemMode},
          );
        },
        child: Container(
          //  padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: (isImageExist)
                    ? CachedNetworkImageProvider(widget.item.image ?? "")
                    : AssetImage(aNoImage) as ImageProvider,
                onBackgroundImageError: (Object e, StackTrace? s) {
                  setState(() {
                    isImageExist = false;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(widget.item.name[userLanguage] ?? ""),
              SizedBox(
                height: 15,
              ),
              Text(
                "\$${widget.item.cost}",
                style: Get.textTheme.bodyText1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
