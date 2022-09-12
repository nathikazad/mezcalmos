import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mez_services_web_app/controllers/languageController.dart';
import 'package:mez_services_web_app/models/Generic.dart';
import 'package:mez_services_web_app/models/Services/Restaurant.dart';

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
          //TODO add routing
          // Get.toNamed(
          //   getItemRoute(widget.restaurant.info.id, widget.item.id),
          //   arguments: {"mode": ViewItemScreenMode.AddItemMode},
          // );
        },
        child: Container(
          //  padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isImageExist)
                CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image ?? ""),
                  onBackgroundImageError: (Object e, StackTrace? s) {
                    setState(() {
                      isImageExist = false;
                    });
                  },
                ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.item.name[userLanguage] ?? "",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3,
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
      ),
    );
  }
}
