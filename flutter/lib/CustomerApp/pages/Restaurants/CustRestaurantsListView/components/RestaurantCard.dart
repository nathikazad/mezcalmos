import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ListRestaurantsScreen"]["components"]
    ["RestaurandCard"];

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final num shippingPrice;
  final GestureTapCallback? onClick;

  const RestaurantCard({
    Key? key,
    @required this.onClick,
    required this.restaurant,
    required this.shippingPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.only(bottom: 2.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 15.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mezRestuarntCardImage(),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(restaurant.info.name, style: txt.bodyLarge),
                      SizedBox(height: 0.3.h),
                      if (restaurant.info.description?[userLanguage] != null)
                        Text(
                          restaurant.info.description![userLanguage]!,
                          style: txt.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (restaurant.info.description != null &&
                          restaurant.info.description!.length > 1)
                        const Spacer(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: Colors.black,
                                  size: 3.2.h,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                ShippingCostComponent(
                                  shippingCost: shippingPrice,
                                  alignment: MainAxisAlignment.start,
                                  textStyle: txt.bodyLarge,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.w),
                                    child: Icon(
                                      Icons.payments_outlined,
                                      color: Colors.black,
                                      size: 3.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.h,
                                  ),
                                  if (restaurant.paymentInfo?.acceptCard ==
                                      true)
                                    Icon(
                                      Icons.credit_card,
                                      color: Colors.black,
                                      size: 3.h,
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Flexible(
                                child: Row(children: [
                              Icon(
                                Icons.star,
                                size: 3.h,
                                color: Color(0xFF6779FE),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                restaurant.rate != null
                                    ? restaurant.rate!.toStringAsFixed(1)
                                    : 0.toString(),
                                style: txt.bodyLarge,
                              )
                            ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container mezRestuarntCardImage() {
    ///responsible for the image of restaurant
    return Container(
      height: double.infinity,
      width: 130,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: restaurant.info.image,
                fit: BoxFit.cover,
                placeholder: (_, __) {
                  return Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                    ),
                    highlightColor: Colors.grey[400]!,
                    baseColor: Colors.grey[300]!,
                    direction: ShimmerDirection.ltr,
                  );
                },
              ),
            ),
            Container(
              color: restaurant.isOpen() ? null : Colors.black.withOpacity(0.5),
              child: restaurant.isOpen()
                  ? null
                  : Center(
                      child: Text(
                        "${_i18n()["closed"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  String _getDollarsSign() {
    if (restaurant.getAverageCost() <= 80) {
      return "\$";
    }
    if (restaurant.getAverageCost() > 80 &&
        restaurant.getAverageCost() <= 140) {
      return "\$\$";
    }
    if (restaurant.getAverageCost() > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
