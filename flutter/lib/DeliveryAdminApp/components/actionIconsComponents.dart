import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mezcalmos/Shared/pages/ViewNotifications.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import '../../CustomerApp/router.dart';

enum ButtonColorType { ButtonLightColor, ButtonDarkColor }
LinearGradient gradientLightColor = LinearGradient(
  begin: Alignment(0.1689453125, 0),
  end: Alignment(1, 1),
  colors: [
    Color(0xff5582ff).withOpacity(0.10000000149011612),
    Color(0xffc54efc).withOpacity(0.10000000149011612)
  ],
);

LinearGradient gradientDarkColor = LinearGradient(
  begin: Alignment(0, 0),
  end: Alignment(1, 1),
  colors: [
    Color(0xffeaeefb),
    Color(0xfff4eafb),
  ],
);

class ActionIconsComponents {
  /// notification icon
  static Widget notificationIcon(
      {bool hasNewNotif = false,
      EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 5),
      Function? function,
      ButtonColorType btnTypeColor = ButtonColorType.ButtonLightColor}) {
    return Container(
      margin: margin,
      child: GestureDetector(
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: (btnTypeColor == ButtonColorType.ButtonLightColor)
                  ? gradientLightColor
                  : gradientDarkColor,
            ),
            child: Center(
              child: Stack(children: [
                Icon(
                  FontAwesomeIcons.bell,
                  size: 18,
                  color: Color(0xff5582ff),
                ),
                Positioned(
                    left: 8,
                    child: hasNewNotif
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xfff6efff), width: 2),
                                color: const Color(0xffff0000)))
                        : SizedBox(
                            height: 0,
                            width: 0,
                          ))
              ]),
            )),
        onTap: () {
          print("notification");
          if (function != null) {
            mezDbgPrint("notification screen called");
            function();
            Get.toNamed(kNotificationsRoute);
          }
          Get.toNamed(kNotificationsRoute);
        },
      ),
    );
  }

  /// orders icon
  static Widget orderIcon(
      {bool hasInprossesOrders = false,
      EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 5),
      Function? function,
      ButtonColorType btnTypeColor = ButtonColorType.ButtonLightColor}) {
    return Container(
      margin: margin,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          child: Stack(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: (btnTypeColor == ButtonColorType.ButtonLightColor)
                      ? gradientLightColor
                      : gradientDarkColor,
                ),
                child: Container(
                  child: Icon(
                    FontAwesomeIcons.history,
                    size: 14,
                    color: Color(0xff5582ff),
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  left: 15,
                  //  bottom: 10,
                  child: hasInprossesOrders
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xfff6efff), width: 2),
                              color: const Color(0xffff0000)))
                      : SizedBox(
                          height: 0,
                          width: 0,
                        ))
            ],
          ),
        ),
        onTap: () {
          mezDbgPrint("ActionIconsComponent: orders icon clicked");
          if (function != null) {
            function();
            Get.toNamed(kOrdersRoute);
          }
          Get.toNamed(kOrdersRoute);
        },
      ),
    );
  }

  /// messages icon
  static Widget messageIcon(
      {EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 5),
      Function? function,
      ButtonColorType btnTypeColor = ButtonColorType.ButtonLightColor}) {
    return Container(
      margin: margin,
      child: GestureDetector(
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: (btnTypeColor == ButtonColorType.ButtonLightColor)
                ? gradientLightColor
                : gradientDarkColor,
          ),
          child: Icon(
            Icons.mail_outline,
            size: 18,
            color: Color(0xff5582ff),
          ),
        ),
        onTap: () {
          if (function != null) {
            function();
            print("messages");
          }
        },
      ),
    );
  }

  /// cart icon
  static Widget cartIcon(
      {EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 5),
      Function? function,
      ButtonColorType btnTypeColor = ButtonColorType.ButtonLightColor}) {
    return Container(
      margin: margin,
      child: GestureDetector(
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: (btnTypeColor == ButtonColorType.ButtonLightColor)
                ? gradientLightColor
                : gradientDarkColor,
          ),
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 18,
            color: Color(0xff5582ff),
          ),
        ),
        onTap: () {
          print("cart");
          if (function != null) {
            function();
            Get.toNamed(kCartRoute);
          }
          Get.toNamed(kCartRoute);

          // Get.to(ViewCartScreen(),
          //);
        },
      ),
    );
  }
}
