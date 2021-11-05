import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewNotifications.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';


import '../router.dart';

class ActionIconsComponents {
  /// notification icon
  static Widget notificationIcon() {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment(0.1689453125, 0),
            end: Alignment(1, 1),
            colors: [
              const Color(0xff5582ff).withOpacity(0.10000000149011612),
              const Color(0xffc54efc).withOpacity(0.10000000149011612)
            ],
          ),
        ),
        child: Icon(
          FontAwesomeIcons.bell,
          size: 18,
          color: Color(0xff5582ff),
        ),
      ),
      onTap: () {
        print("notification");
        Get.to(() => ViewNotifications());
        //Get.toNamed(kCartRoute);
        // Get.to(ViewCartScreen(),
        //);
      },
    );
  }

  /// orders icon
  static Widget orderIcon() {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment(0.1689453125, 0),
            end: Alignment(1, 1),
            colors: [
              const Color(0xff5582ff).withOpacity(0.10000000149011612),
              const Color(0xffc54efc).withOpacity(0.10000000149011612)
            ],
          ),
        ),
        child: Icon(
          FontAwesomeIcons.history,
          size: 14,
          color: Color(0xff5582ff),
        ),
      ),
      onTap: () {
        mezDbgPrint("ActionIconsComponent: orders icon clicked");
        Get.toNamed(kOrdersRoute);
      },
    );
  }

  /// messages icon
  static Widget messageIcon() {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment(0.1689453125, 0),
            end: Alignment(1, 1),
            colors: [
              const Color(0xff5582ff).withOpacity(0.10000000149011612),
              const Color(0xffc54efc).withOpacity(0.10000000149011612)
            ],
          ),
        ),
        child: Icon(
          Icons.mail_outline,
          size: 18,
          color: Color(0xff5582ff),
        ),
      ),
      onTap: () {
        print("messages");
      },
    );
  }

  /// cart icon
  static Widget cartIcon() {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment(0.1689453125, 0),
            end: Alignment(1, 1),
            colors: [
              const Color(0xff5582ff).withOpacity(0.10000000149011612),
              const Color(0xffc54efc).withOpacity(0.10000000149011612)
            ],
          ),
        ),
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 18,
          color: Color(0xff5582ff),
        ),
      ),
      onTap: () {
        print("cart");
        Get.toNamed(kCartRoute);
        // Get.to(ViewCartScreen(),
        //);
      },
    );
  }
}
