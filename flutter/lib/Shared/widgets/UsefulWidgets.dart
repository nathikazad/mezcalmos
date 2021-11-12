import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/NoScrollGlowBehaviour.dart';

class MezcalmosSharedWidgets {
  // Admin Appbar
  static AppBar mezCalmosAdminAppBar(BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(10),
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(81, 132, 255, 1),
              Color.fromRGBO(206, 73, 252, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: Container(
          height: Get.height,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(aLogoPath),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                    text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'psr',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: "MEZ",
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle
                            ?.fontSize,
                        // fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "ADMIN",
                      style: TextStyle(
                        fontSize: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle
                            ?.fontSize,
                        //fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                        color: Color.fromARGB(255, 103, 122, 253),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
        // actions: [
        //   ActionButtons(Icons.notifications_outlined, true),
        //   ActionButtons(Icons.history_outlined)
        // ],
      );
  static Image logo({double size = 20}) => Image.asset(
        aLogoPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );

  static RichText mezcalmosTitle(
          {double textSize = nDefaultMezcalmosTextSize, bool isBold = false}) =>
      RichText(
          text: TextSpan(
        style: TextStyle(
          fontFamily: 'psr',
          color: Colors.black,
          fontSize: textSize,
        ),
        children: <TextSpan>[
          TextSpan(
            text: tMez,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            ),
          ),
          TextSpan(
            text: tCalmos,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              color: Color.fromARGB(255, 103, 122, 253),
            ),
          ),
        ],
      ));

  static Widget MezcalmosNoGlowScrollConfiguration(Widget child) {
    return ScrollConfiguration(
      behavior: NoScrollGlowBehaviour(
          testCaller: "MezcalmosNoGlowScrollConfiguration"),
      child: child,
    );
  }

  static Widget fillTitle(int actionLength) {
    return Container(
      width: Get.width * (actionLength >= 3 && Get.width <= 320 ? 0.45 : 0.55),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            logo(size: getSizeRelativeToScreen(80, Get.width, Get.height)),
            Padding(
                padding: EdgeInsets.only(left: 10), child: mezcalmosTitle()),
          ],
        ),
      ),
    );
  }

  static Future<void> mezcalmosDialogWithImage(double val, double sh, double sw,
          String message, String imagUrl) async =>
      await Get.defaultDialog(
        backgroundColor: Colors.grey.shade100,
        title: '',
        content: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: Get.height / 4,
                  width: Get.width / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagUrl), fit: BoxFit.contain)),
                )),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 20,
                )),
            Flexible(
                fit: FlexFit.loose,
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'psr',
                        fontSize: 20,
                        color: Colors.grey.shade700),
                  ),
                ))
          ],
        ),
      );
}
