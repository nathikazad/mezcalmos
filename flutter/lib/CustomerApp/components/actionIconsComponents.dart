import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mezcalmos/Shared/pages/ViewNotifications.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';

import '../router.dart';

class ActionIconsComponents {
  /// notification icon
  static Widget notificationIcon([bool hasNewNotif = false]) {
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
        Get.toNamed(kNotificationsRoute);
      },
    );
  }

  /// orders icon
  static Widget orderIcon([bool hasInprossesOrders = false]) {
    return GestureDetector(
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
                gradient: LinearGradient(
                  begin: Alignment(0.1689453125, 0),
                  end: Alignment(1, 1),
                  colors: [
                    const Color(0xff5582ff).withOpacity(0.10000000149011612),
                    const Color(0xffc54efc).withOpacity(0.10000000149011612)
                  ],
                ),
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
