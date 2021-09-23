import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/NoScrollGlowBehaviour.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';

class MezcalmosSharedWidgets {
  static Image logo({double size = 20}) => Image.asset(
        aLogoPath,
        height: size,
        width: size,
        fit: BoxFit.contain,
      );

  static RichText mezcalmos(
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

  static Widget fillTitle() => Row(
        children: [
          logo(size: getSizeRelativeToScreen(85, Get.width, Get.height)),
          Padding(padding: EdgeInsets.only(left: 10), child: mezcalmos()),
        ],
      );

  static AppBar mezcalmosAppBar(
      String btnType, Function onTapFunction,
      {dynamic bgColor = Colors.white}) {
    Widget btn_icon;

    switch (btnType) {
      case "back":
        btn_icon = Center(
          child: Icon(
            MezcalmosIcons.chevron_left,
            color: Colors.white,
            size: getSizeRelativeToScreen(35, Get.width, Get.height),
          ),
        );
        break;
      default:
        btn_icon = Icon(
          MezcalmosIcons.stream,
          color: Colors.white,
          size: 16,
        );
        break;
    }
    return AppBar(
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          width: Get.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 32,
                width: 32,
                child: GestureDetector(
                  onTap: () {
                    print("Taped Drawer btn !");
                    onTapFunction();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 216, 225, 249),
                          spreadRadius: 0,
                          blurRadius: 7,
                          offset: Offset(0, 7), // changes position of shadow
                        ),
                      ],
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 97, 127, 255),
                        Color.fromARGB(255, 198, 90, 252),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: btn_icon,
                  ),
                ),
              ),
              // Positioned(
              //     right: getSizeRelativeToScreen(40, Get.height, Get.width),
              //     child: fillTitle())
              SizedBox(
                  width: getSizeRelativeToScreen(20, Get.height, Get.width)),
              fillTitle(),
            ],
          ),
        ));
  }

  static Future<void> mezcalmosDialog(
          double val, double sh, double sw, String message) async =>
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
                          image: AssetImage(taxiImageAsset),
                          fit: BoxFit.contain)),
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

  static Future<void> mezcalmosDialogOrderNoMoreAvailable(
          double val, double sh, double sw) async =>
      mezcalmosDialog(
          val,
          sh,
          sw,
          Get.find<LanguageController>().strings['taxi']['cancelOrder']
              ['rideUnavailble']);

  static Future<void> mezcalmosDialogOrderCancelled(
          double val, double sh, double sw) async =>
      mezcalmosDialog(
          val,
          sh,
          sw,
          Get.find<LanguageController>().strings['taxi']['cancelOrder']
              ['customerCancelled']);

  static Future<void> yesNoDefaultConfirmationDialog(
          onYes, String text) async =>
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
                child: Icon(
                  MezcalmosIcons.times_circle,
                  size: 40,
                  color: Colors.black,
                )),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 20,
                )),
            Flexible(
                fit: FlexFit.loose,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'psr', fontSize: 18),
                )),
            Flexible(
                child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            (Size(double.infinity, 50))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (Colors.grey.shade300))),
                    onPressed: onYes,
                    child: Obx(() => Text(
                        Get.find<LanguageController>().strings['taxi']
                            ['taxiView']['yes'],
                        style: TextStyle(
                          fontFamily: 'psr',
                          fontSize: 14,
                          color: Colors.black,
                        )))),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            (Size(double.infinity, 50))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (Colors.grey.shade300))),
                    onPressed: () => Get.back(),
                    child: Obx(() => Text(
                        Get.find<LanguageController>().strings['taxi']
                            ['taxiView']['no'],
                        style: TextStyle(
                          fontFamily: 'psr',
                          fontSize: 14,
                          color: Colors.black,
                        ))))
              ],
            )),
          ],
        ),
      );
}
