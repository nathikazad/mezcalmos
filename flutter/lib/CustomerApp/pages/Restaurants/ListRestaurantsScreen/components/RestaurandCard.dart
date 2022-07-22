import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:shimmer/shimmer.dart';

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
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onClick,
        child: Container(
          width: double.infinity,
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mezRestuarntCardImage(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.info.name,
                        style: txt.headline3,
                      ),
                      const SizedBox(height: 10),
                      if (restaurant.description != null)
                        Text(
                          restaurant.description![userLanguage]!,
                          style: txt.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (restaurant.description != null &&
                          restaurant.description!.length > 1)
                        const Spacer(),
                      Container(
                        //  alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // Flexible(
                            //   flex: 2,
                            //   fit: FlexFit.tight,
                            //   child: Text(_getDollarsSign(),
                            //       style: txt.bodyText1?.copyWith(
                            //         color: Colors.grey.shade800,
                            //       )),
                            // ),
                            Flexible(
                              flex: 7,
                              // fit: FlexFit.tight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Colors.grey.shade800,
                                  ),
                                  Flexible(
                                    //    flex: 5,
                                    fit: FlexFit.tight,
                                    child: ShippingCostComponent(
                                      shippingCost: shippingPrice,
                                      alignment: MainAxisAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Icon(
                                Icons.payments_sharp,
                                color: Colors.green.shade500,
                              ),
                            ),
                            if (restaurant.paymentInfo.acceptCard)
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Icon(
                                    Ionicons.card,
                                    color: primaryBlueColor,
                                  ),
                                ),
                              ),
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
