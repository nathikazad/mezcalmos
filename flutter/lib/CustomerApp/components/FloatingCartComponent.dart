import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class FloatingCartComponent extends StatelessWidget {
  const FloatingCartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Badge(
        badgeContent: Text(
          "2",
          style: Get.textTheme.bodyText1?.copyWith(color: customerAppColor),
        ),
        position: BadgePosition.topEnd(top: -8, end: 0),
        badgeColor: lightCustomerAppColor,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // circular shape
            gradient: LinearGradient(
              colors: [customerAppColor, Color(0xFFAC59FC)],
            ),
          ),
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
