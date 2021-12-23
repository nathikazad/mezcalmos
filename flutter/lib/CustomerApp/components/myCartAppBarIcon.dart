import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class MyCartAppBarIcon extends StatelessWidget {
  Color iconColor;
  MyCartAppBarIcon({
    Key? key,
    required this.iconColor,
  }) : super(key: key);

  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => _authController.isUserSignedIn &&
            Get.find<RestaurantController>().cart.value.items.length > 0
        ? Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(kCartRoute);
                },
                splashRadius: 20,
                icon: Badge(
                    badgeContent: Text(
                      Get.find<RestaurantController>()
                          .cart
                          .value
                          .items
                          .length
                          .toStringAsFixed(0),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.white),
                    ),
                    badgeColor: Theme.of(context).primaryColorLight,
                    child: Icon(
                      Ionicons.cart,
                      color: iconColor,
                    ))),
          )
        : Container());
  }
}
