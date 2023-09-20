import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/CustRestaurantView/CustRestaurantView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:shimmer/shimmer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["components"]["CustRestaurantCard"];

class CustRestaurantCard extends StatelessWidget {
  final Restaurant? restaurant;

  // Constructor with a restaurant
  const CustRestaurantCard({super.key, required this.restaurant});

  // Constructor for shimmer effect
  const CustRestaurantCard.shimmer() : restaurant = null;

  @override
  Widget build(BuildContext context) {
    if (restaurant == null) {
      return _shimmerCard();
    }
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          CustRestaurantView.navigate(
            restaurantId: restaurant!.info.hasuraId,
          );
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 30.mezW,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: restaurant!.info.image,
                    height: double.infinity,
                    width: 30.mezW,
                    fit: BoxFit.cover,
                    imageBuilder: (BuildContext context,
                        ImageProvider<Object> imageProvider) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 2, color: Colors.grey.shade100),
                        ),
                      );
                    },
                  ),
                  if (restaurant!.isOpen == false)
                    Container(
                      height: double.infinity,
                      width: 30.mezW,
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade900.withOpacity(0.5),
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text.rich(TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.lock_clock,
                                size: 15.mezSp,
                              ),
                            ),
                            WidgetSpan(child: hTinySepartor),
                            TextSpan(text: "${_i18n()['closed']}"),
                          ]))),
                    ),
                ],
              ),
              hTinySepartor,
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              restaurant!.info.name,
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                          if (restaurant!.rate != null)
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text.rich(TextSpan(children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.amber,
                                    size: 15.mezSp,
                                  ),
                                ),
                                TextSpan(
                                  text: restaurant!.rate!.toStringAsFixed(1),
                                  style: context.textTheme.bodyLarge,
                                )
                              ])),
                            ),
                        ],
                      ),
                      if (restaurant!.info.description
                              ?.getTranslation(userLanguage) !=
                          null)
                        Text(
                          restaurant!.info.description!
                              .getTranslation(userLanguage)!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      Spacer(),
                      (restaurant!.hasDelivery && restaurant!.hasPickup)
                          ? Text("${_i18n()['dvOrPick']}")
                          : (restaurant!.hasDelivery)
                              ? Text("${_i18n()['onlyDv']}")
                              : Text("${_i18n()['onlyPick']}")
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
}

Widget _shimmerCard() {
  return Card(
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 10),
    child: Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 30.mezW,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: 30.mezW,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(width: 8.0),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Container(
                          width: 20,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                    ),
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
