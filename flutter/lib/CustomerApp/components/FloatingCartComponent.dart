import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/CustRestaurantCartController.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

enum CartType {
  restaurant,
  business,
}

class FloatingCartComponent extends StatefulWidget {
  const FloatingCartComponent({
    Key? key,
    this.withGradient = false,
    required this.cartType,
    this.backgroundColor,
    this.badgePosition,
    this.iconColor = primaryBlueColor,
  }) : super(key: key);
  final bool withGradient;
  final Color? backgroundColor;
  final Color iconColor;
  final badge.BadgePosition? badgePosition;
  final CartType cartType;

  @override
  State<FloatingCartComponent> createState() => _FloatingCartComponentState();
}

class _FloatingCartComponentState extends State<FloatingCartComponent> {
  List<dynamic> items = [].obs;

  @override
  Widget build(BuildContext context) {
    if (Get.find<AuthController>().isUserSignedIn) {
      return Obx(
        () {
          items = widget.cartType == CartType.restaurant
              ? Get.find<CustRestaurantCartController>()
                      .cart
                      .value
                      ?.cartItems ??
                  []
              : Get.find<CustBusinessCartController>().cart.value?.items ?? [];
          return items.length > 0
              ? badge.Badge(
                  elevation: 0,
                  badgeContent: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: primaryBlueColor,
                      child: Text(
                        items.length.toStringAsFixed(0),
                        style: context.txt.labelLarge
                            ?.copyWith(color: secondaryLightBlueColor),
                      ),
                    ),
                  ),
                  position: widget.badgePosition ??
                      badge.BadgePosition.topEnd(top: -3, end: -8),
                  badgeColor: Colors.transparent,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      if (widget.cartType == CartType.restaurant) {
                        ViewCartScreen.navigate();
                      } else {
                        CustCartView.navigate();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.backgroundColor ??
                            secondaryLightBlueColor, // circular shape
                        gradient: (widget.withGradient)
                            ? LinearGradient(
                                colors: [primaryBlueColor, Color(0xFFAC59FC)],
                              )
                            : null,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: widget.iconColor,
                        size: 17,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink();
        },
      );
    } else
      return SizedBox();
  }
}
