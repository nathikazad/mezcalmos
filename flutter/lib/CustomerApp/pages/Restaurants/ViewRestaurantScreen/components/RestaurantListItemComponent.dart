import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class RestaurantsListOfItemsComponent extends StatefulWidget {
  const RestaurantsListOfItemsComponent(
      {Key? key, required this.item, this.function})
      : super(key: key);
  final Item item;
  final GestureTapCallback? function;

  @override
  _RestaurantsListOfItemsComponentState createState() =>
      _RestaurantsListOfItemsComponentState();
}

class _RestaurantsListOfItemsComponentState
    extends State<RestaurantsListOfItemsComponent> {
  bool isImageExist = true;
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: (isImageExist)
              ? const EdgeInsets.symmetric(horizontal: 5, vertical: 12)
              : const EdgeInsets.all(16),
          // margin: const EdgeInsets.all(5),

          child: Row(
            children: [
              if (isImageExist)
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image ?? ""),
                  onBackgroundImageError: (Object e, StackTrace? s) {
                    setState(() {
                      isImageExist = false;
                    });
                  },
                ),
              if (isImageExist)
                SizedBox(
                  width: 15,
                ),
              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${widget.item.name[userLanguage]!.capitalizeFirstofEach}",
                    style: txt.headline3!.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("\$${widget.item.cost}", style: txt.headline3),
              )
            ],
          ),
        ),
        onTap: () {
          widget.function!();
        },
      ),
    );
  }
}
