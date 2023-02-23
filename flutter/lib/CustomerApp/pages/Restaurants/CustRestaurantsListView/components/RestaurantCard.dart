import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/thirdParty/MapHelper.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Restaurant.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/widgets/ShippingCostComponent.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
        ["pages"]["Restaurants"]["ListRestaurantsScreen"]["components"]
    ["RestaurandCard"];

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;
  final GestureTapCallback? onClick;

  const RestaurantCard({
    Key? key,
    @required this.onClick,
    required this.restaurant,
  }) : super(key: key);

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    final LanguageType userLanguage =
        Get.find<LanguageController>().userLanguageKey;
    final TextTheme txt = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.only(bottom: 2.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onClick,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(widget.restaurant.info.name, style: txt.bodyLarge),
                      SizedBox(height: 5),
                      if (widget.restaurant.info.description?[userLanguage] !=
                          null)
                        Text(
                          widget.restaurant.info.description![userLanguage]!,
                          style: txt.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (widget.restaurant.info.description != null &&
                          widget.restaurant.info.description!.length > 1)
                        const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            fit: FlexFit.loose,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(width: 3),
                                Flexible(
                                  flex: 5,
                                  child: ShippingCostComponent(
                                    shippingCost: _getShippingPrice(),
                                    alignment: MainAxisAlignment.start,
                                    textStyle: txt.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.payments_outlined,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                if (widget.restaurant.paymentInfo?.acceptCard ==
                                    false)
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 4.w,
                          // ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Color(0xFF6779FE),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  widget.restaurant.rate != null
                                      ? widget.restaurant.rate!
                                          .toStringAsFixed(1)
                                      : 0.toString(),
                                  style: txt.bodyLarge,
                                )
                              ],
                            ),
                          ),
                        ],
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

  num _getShippingPrice() {
    mezDbgPrint(
        "Distance ======>${calculateDistance(Get.find<CustomerAuthController>().customerCurrentLocation.value!, widget.restaurant.info.location.toLocationData()).round()}");
    return max(
        widget.restaurant.deliveryCost!.minimumCost,
        (calculateDistance(
                    Get.find<CustomerAuthController>()
                        .customerCurrentLocation
                        .value!,
                    widget.restaurant.info.location.toLocationData())
                .round() *
            widget.restaurant.deliveryCost!.costPerKm));
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
                imageUrl: widget.restaurant.info.image,
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
              color: widget.restaurant.isOpen()
                  ? null
                  : Colors.black.withOpacity(0.5),
              child: widget.restaurant.isOpen()
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
    if (widget.restaurant.getAverageCost() <= 80) {
      return "\$";
    }
    if (widget.restaurant.getAverageCost() > 80 &&
        widget.restaurant.getAverageCost() <= 140) {
      return "\$\$";
    }
    if (widget.restaurant.getAverageCost() > 140) {
      return "\$\$\$";
    } else {
      return "";
    }
  }
}
