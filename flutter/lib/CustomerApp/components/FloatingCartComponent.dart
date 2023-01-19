import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class FloatingCartComponent extends StatelessWidget {
  const FloatingCartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Get.find<AuthController>().isUserSignedIn) {
      return Obx(
        () => Get.find<CustomerCartController>().cart.value != null &&
                Get.find<CustomerCartController>()
                        .cart
                        .value!
                        .cartItems
                        .length >
                    0
            ? FloatingActionButton(
                onPressed: () {
                  MezRouter.toNamed(kCartRoute);
                },
                child: Badge(
                  badgeContent: Text(
                    Get.find<CustomerCartController>()
                        .cart
                        .value!
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
    } else
      return SizedBox();
  }
}
