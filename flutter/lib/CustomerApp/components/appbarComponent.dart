import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewCartScreen.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewNotifications.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewOrders.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';

Widget restaurantAppBarComponent(
    String leadingIconType, Function? func, List<String>? trailingIconsType) {
  List<Widget> trailigIcons = [];
  if (trailingIconsType != null) {
    trailingIconsType.forEach((element) {
      switch (element) {
        case "messages":
          trailigIcons.add(GestureDetector(
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
              //Get.toNamed(kCartRoute);
              // Get.to(ViewCartScreen(),
              //);
            },
          ));
          break;
        case "carts":
          trailigIcons.add(GestureDetector(
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
          ));
          break;
        case "notifications":
          trailigIcons.add(GestureDetector(
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
                Icons.notifications_outlined,
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
          ));
          break;
        case "oredrs":
          trailigIcons.add(GestureDetector(
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
                Icons.history,
                size: 18,
                color: Color(0xff5582ff),
              ),
            ),
            onTap: () {
              print("orders");
              Get.to(() => ViewOrders());
              //Get.toNamed(kCartRoute);
              // Get.to(ViewCartScreen(),
              //);
            },
          ));
          break;
        default:
      }
      trailigIcons.add(SizedBox(
        width: 5,
      ));
    });
  }
  return Container(
    height: 30,
    width: Get.width,
    margin: EdgeInsets.only(top: 15),
    // height: 48,
    decoration: BoxDecoration(
      color: const Color(0xa3fbfbfb),
    ),
    child: FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(81, 132, 255, 1),
                  Color.fromRGBO(206, 73, 252, 1)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: (leadingIconType == "back")
                  ? Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: Colors.white,
                    )
                  : Icon(
                      MezcalmosIcons.stream,
                      color: Colors.white,
                      size: 16,
                    ),
            ),
            onTap: (leadingIconType == "back")
                ? () {
                    Get.back();
                  }
                : () {
                    print("open menu");
                    func!();
                  },
          ),
          (trailigIcons.length == 0)
              ? SizedBox(
                  width: Get.width * 0.1,
                )
              : SizedBox(
                  width: 0,
                ),
          Container(
            height: 29,
            width: 29,
            child: Image.asset(aLogoPath),
          ),
          SizedBox(
            width: Get.width * 0.01,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                text: TextSpan(
              style: TextStyle(
                  fontFamily: 'psr',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(
                  text: "MEZ",
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "CALMOS",
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                    color: Color.fromARGB(255, 103, 122, 253),
                  ),
                ),
              ],
            )),
          ),
          (trailigIcons.length == 0)
              ? SizedBox(
                  width: Get.width * 0.15,
                )
              : buildIcons(trailigIcons),
          SizedBox(
            width: 5,
          )
        ],
      ),
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget buildIcons(List<Widget> widgets) {
  return Container(
      child: Row(
    children: widgets,
  ));
}
