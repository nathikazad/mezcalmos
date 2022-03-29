import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Utils/GenerateTheNameExtension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RestaurantsListItemsOfComponent extends StatefulWidget {
  const RestaurantsListItemsOfComponent({
    Key? key,
    required this.item,
    this.function,
  }) : super(key: key);

  final Item item;
  final GestureTapCallback? function;

  @override
  _RestaurantsListItemsOfComponentState createState() =>
      _RestaurantsListItemsOfComponentState();
}

class _RestaurantsListItemsOfComponentState
    extends State<RestaurantsListItemsOfComponent> {
  /// LanguageType
  final LanguageType userLanguage =
      Get.find<LanguageController>().userLanguageKey;

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.item.image!,
              fit: BoxFit.cover,
              imageBuilder: (_, ImageProvider imageProvider) => Container(
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
              placeholder: (_, __) {
                return Shimmer.fromColors(
                  child: Container(
                    height: 63,
                    width: 63,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  highlightColor: Colors.grey[400]!,
                  baseColor: Colors.grey[300]!,
                  direction: ShimmerDirection.ltr,
                );
              },
              errorWidget: (_, __, ___) {
                return Container(
                  height: 63,
                  width: 63,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.item.name[userLanguage]!.capitalizeFirstofEach}"
                        .generateTheName(),
                    style: const TextStyle(
                      color: Color.fromRGBO(172, 89, 252, 0.8),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
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
