import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

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
  RxBool isImageExist = RxBool(false);
  @override
  void initState() {
    isImageExist.value =
        widget.item.image != null && widget.item.image?.isURL == true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.item.available) {
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
              Obx(() {
                if (isImageExist.isTrue) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          CachedNetworkImageProvider(widget.item.image!),
                      onBackgroundImageError: (Object e, StackTrace? s) {
                        isImageExist.value = false;
                      },
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
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
    } else
      return SizedBox();
  }
}
