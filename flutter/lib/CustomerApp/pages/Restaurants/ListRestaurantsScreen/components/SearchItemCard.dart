import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/NumHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class SearchItemCard extends StatelessWidget {
  const SearchItemCard({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 7),
      child: InkWell(
        onTap: () {
          if (item.restaurant != null && item.id != null) {
            Get.toNamed(
              getItemRoute(item.restaurant!.info.firebaseId, item.id!),
              arguments: {
                "mode": ViewItemScreenMode.AddItemMode,
                "showViewRestaurant": true
              },
            );
          }
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          height: 17.h,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item.name[userLanguage]!,
                      maxLines: 2,
                      style: Get.textTheme.headline3?.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.cost.toPriceString(),
                      style: Get.textTheme.headline3?.copyWith(fontSize: 14.sp),
                    ),
                    Spacer(),
                    Divider(
                      height: 8,
                      indent: 5,
                      endIndent: 12,
                    ),
                    if (item.restaurant != null)
                      Text(
                        item.restaurant!.info.name,
                        maxLines: 1,
                      )
                  ],
                ),
              ),
              if (item.image != null)
                CachedNetworkImage(
                  imageUrl: item.image!,
                  errorWidget: (BuildContext context, String url, error) {
                    return Container(
                      width: 12.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(aNoImage), fit: BoxFit.cover)),
                    );
                  },
                  imageBuilder: (BuildContext context,
                      ImageProvider<Object> imageProvider) {
                    return Container(
                      width: 12.h,
                      height: 12.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
