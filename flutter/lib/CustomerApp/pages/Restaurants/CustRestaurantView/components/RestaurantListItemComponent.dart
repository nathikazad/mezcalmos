import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Item.dart';
import 'package:sizer/sizer.dart';

class RestaurantsListOfItemsComponent extends StatefulWidget {
  const RestaurantsListOfItemsComponent({
    Key? key,
    required this.item,
    this.function,
  }) : super(key: key);
  final Item item;

  final GestureTapCallback? function;

  @override
  _RestaurantsListOfItemsComponentState createState() =>
      _RestaurantsListOfItemsComponentState();
}

class _RestaurantsListOfItemsComponentState
    extends State<RestaurantsListOfItemsComponent> {
  // bool isImageExist = true;
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
        margin: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 75,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  if (isImageExist.isTrue) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
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
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.item.name[userLanguage]?.capitalizeFirstofEach}",
                        style: Get.textTheme.headline3?.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                      if (widget.item.isSpecial)
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(widget.item.getPeriod!
                                .toNormalString(removeDay: true)))
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.item.cost.toPriceString(),
                    style: Get.textTheme.headline3,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
              ],
            ),
            onTap: () {
              widget.function!();
            },
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
