import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Restaurants/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

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
                  ViewCartScreen.navigate();
                },
                child: badge.Badge(
                  badgeContent: Text(
                    Get.find<CustomerCartController>()
                        .cart
                        .value!
                        .cartItems
                        .length
                        .toStringAsFixed(0),
                    style: context.txt.bodyLarge
                        ?.copyWith(color: primaryBlueColor),
                  ),
                  position: badge.BadgePosition.topEnd(top: -8, end: 0),
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
