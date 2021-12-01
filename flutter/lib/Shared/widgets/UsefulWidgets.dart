import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/TaxiApp/pages/Orders/IncomingOrders/IncomingListScreen/NoScrollGlowBehaviour.dart';

class MezcalmosSharedWidgets {
  // Admin Appbar
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
}
