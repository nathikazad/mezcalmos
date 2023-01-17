import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/customerCartController.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class MyCartAppBarIcon extends StatelessWidget {
  const MyCartAppBarIcon({
    Key? key,
    required this.iconColor,
  }) : super(key: key);

  final Color iconColor;

  /// AuthController
  static final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _authController.isUserSignedIn &&
              Get.find<CustomerCartController>().cart.value != null &&
              Get.find<CustomerCartController>().cart.value!.cartItems.length >
                  0
          ? Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 8.0),
              child: IconButton(
                onPressed: () {
                  MezRouter.toNamed<void>(kCartRoute);
                },
                icon: Badge(
                  padding: EdgeInsets.all(6),
                  badgeContent: Text(
                    Get.find<CustomerCartController>()
                        .cart
                        .value!
                        .cartItems
                        .length
                        .toStringAsFixed(0),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  badgeColor: Theme.of(context).primaryColorLight,
                  child: Icon(
                    Ionicons.cart,
                    color: iconColor,
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
