import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:shimmer/shimmer.dart';
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
  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        // margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            if (widget.item.image != null)
            CachedNetworkImage(
              imageUrl: widget.item.image!,
              fit: BoxFit.cover,
              imageBuilder:
                  (BuildContext context, ImageProvider<Object> imageProvider) =>
                      Container(
                height: 63,
                width: 63,
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              placeholder: (BuildContext context, String url) => Container(
                height: 63,
                width: 63,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (BuildContext context, String url, error) =>
                  Container(
                      height: 63,
                      width: 63,
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 20,
                          ))),
            ),
            SizedBox(
              width: 15,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.item.name[userLanguage]!.capitalizeFirstofEach}",
                      style: txt.headline3!.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("\$${widget.item.cost}", style: txt.headline3),
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
