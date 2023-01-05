import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class FloatingCartComponent extends StatelessWidget {
  const FloatingCartComponent({Key? key}) : super(key: key);
  static final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          Get.find<CustomerCartController>().cart.value.cartItems.length > 0 &&
                  _authController.isUserSignedIn
              ? FloatingActionButton(
                  onPressed: () {
                    MezRouter.toNamed(kCartRoute);
                  },
                  child: Badge(
                    badgeContent: Text(
                      Get.find<CustomerCartController>()
                          .cart
                          .value
                          .cartItems
                          .length
                          .toStringAsFixed(0),
                      style: Get.textTheme.bodyText1
                          ?.copyWith(color: primaryBlueColor),
                    ),
                    position: BadgePosition.topEnd(top: -8, end: 0),
                    badgeColor: secondaryLightBlueColor,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // circular shape
                        gradient: LinearGradient(
                          colors: [primaryBlueColor, Color(0xFFAC59FC)],
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
    );
  }
}
