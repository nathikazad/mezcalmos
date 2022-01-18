import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class RestaurantsListItemsOfComponent extends StatefulWidget {
  RestaurantsListItemsOfComponent({Key? key, required this.item, this.function})
      : super(key: key);
  final Item item;
  final GestureTapCallback? function;

  @override
  _RestaurantsListItemsOfComponentState createState() =>
      _RestaurantsListItemsOfComponentState();
}

class _RestaurantsListItemsOfComponentState
    extends State<RestaurantsListItemsOfComponent> {
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    LanguageController lang = Get.find<LanguageController>();
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.item.image!,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                height: 63,
                width: 63,
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                height: 63,
                width: 63,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                  height: 63,
                  width: 63,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 20,
                      ))),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${widget.item.name[lang.userLanguageKey]!.capitalizeFirstofEach}",
                        style: txt.headline3!
                            .copyWith(color: Colors.grey.shade800)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("\$${widget.item.cost}", style: txt.headline1),
                  )
                ],
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Color.fromRGBO(172, 89, 252, 0.8),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        widget.function!();
      },
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
