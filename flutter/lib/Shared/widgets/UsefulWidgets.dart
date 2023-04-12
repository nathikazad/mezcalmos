import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:sizer/sizer.dart';

class MezcalmosSharedWidgets {
  // Admin Appbar
  static Image logo({double size = 20}) => Image.asset(
        aLogoPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );

  static RichText mezcalmosTitle({
    double textSize = nDefaultMezcalmosTextSize,
    bool isBold = false,
  }) =>
      RichText(
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'psr',
            color: Colors.black,
            fontSize: textSize,
          ),
          children: <TextSpan>[
            TextSpan(
              text: sMez,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              ),
            ),
            TextSpan(
              text: sCalmos,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
                color: Color.fromARGB(255, 103, 122, 253),
              ),
            ),
          ],
        ),
      );

  static Widget fillTitle({required int actionLength, bool showLogo = true}) {
    return Container(
      width: 45.w,
      //  width: ,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showLogo)
              logo(
                  size: 9
                      .mezW), //getSizeRelativeToScreen(60, Get.width, Get.height)),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: mezcalmosTitle(),
            ),
          ],
        ),
      ),
    );
  }
}
