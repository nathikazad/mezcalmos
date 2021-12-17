import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  final GestureTapCallback? onClick;

  const RestaurantCard({
    Key? key,
    @required this.onClick,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 120.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: txt.headline3,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        restaurant.description,
                        style: txt.subtitle1,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.restaurant_menu,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            restaurant.items.length.toStringAsFixed(0) +
                                ' ${lang.strings["customer"]["restaurant"]["menu"]["items"]}',
                            style: txt.bodyText2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 150.w,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: restaurant.photo,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 15,
                      height: 15,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
