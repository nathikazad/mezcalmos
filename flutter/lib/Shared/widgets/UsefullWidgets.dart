import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/NoScrollGlowBehaviour.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:mezcalmos/TaxiApp/constants/taxiConstants.dart';

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
            fontWeight: FontWeight.w400),
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
          logo(size: 32),
          Padding(padding: EdgeInsets.only(left: 10), child: mezcalmos()),
        ],
      );

  static AppBar mezcalmosAppBar(String btnType, Function onTapFunction,
      {dynamic bgColor = Colors.white}) {
    Widget btn_icon;

    switch (btnType) {
      case "back":
        btn_icon = Padding(
          padding: EdgeInsets.only(
              left: getSizeRelativeToScreen(4, Get.height, Get.width)),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: getSizeRelativeToScreen(50, Get.width, Get.height),
          ),
        );
        break;
      default:
        btn_icon = Icon(
          Icons.menu,
          color: Colors.white,
          size: 20,
        );
        break;
    }
    return AppBar(
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          width: Get.width,
          child: Stack(
            alignment: Alignment.centerLeft,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Positioned(
                  right: getSizeRelativeToScreen(40, Get.height, Get.width),
                  child: fillTitle())
            ],
          ),
        ));
    // return AppBar(
    //   // automaticallyImplyLeading: false,
    //   centerTitle: true,
    //   toolbarHeight: getSizeRelativeToScreen(45, Get.height, Get.width),
    //   // leadingWidth: 55,
    //   // toolbarHeight: 65,
    //   // backgroundColor: bgColor,
    //   // backgroundColor: Colors.red,
    //   elevation: 0,
    //   title: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.only(left: getSizeRelativeToScreen(5, Get.height, Get.width)),
    //         child: logo(size: getSizeRelativeToScreen(20, Get.height, Get.width)),
    //       ),
    //       Padding(padding: EdgeInsets.only(left: getSizeRelativeToScreen(5, Get.height, Get.width)), child: mezcalmos())
    //     ],
    //   ),

    //   // actions: [
    //   //   Transform.scale(
    //   //     scale: 0.85,
    //   //     child: GestureDetector(
    //   //       onTap: () => print("Clicked back btn!"),
    //   //       child: Container(
    //   //       width: 45,
    //   //       height: 45,
    //   //       margin: EdgeInsets.only(top: 5, right: 10, bottom: 5),
    //   //       decoration: BoxDecoration(
    //   //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //   //           // bottom-right : #f7eafb
    //   //           // top left : #edeffc
    //   //         gradient: LinearGradient(
    //   //           colors: [
    //   //             Color.fromARGB(255, 237, 239, 252),
    //   //             Color.fromARGB(255, 247, 234, 251),
    //   //           ],
    //   //           begin: Alignment.topLeft,
    //   //           end: Alignment.bottomRight
    //   //           ),
    //   //         ),
    //   //         child: Icon(Icons.restore , color: Color.fromARGB(255, 117, 146, 254) , size: 20,),
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ],

    //   leading: GestureDetector(
    //     onTap: () {
    //       print("Taped Drawer btn !");
    //       onTapFunction();
    //     },
    //     child: Container(
    //       height: 32,
    //       width: 32,
    //       margin: EdgeInsets.only(
    //           top: getSizeRelativeToScreen(11, Get.height, Get.width), left: getSizeRelativeToScreen(5, Get.height, Get.width), bottom: getSizeRelativeToScreen(11, Get.height, Get.width)),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Color.fromARGB(255, 216, 225, 249),
    //             spreadRadius: 0,
    //             blurRadius: 7,
    //             offset: Offset(0, 7), // changes position of shadow
    //           ),
    //         ],
    //         gradient: LinearGradient(colors: [
    //           Color.fromARGB(255, 97, 127, 255),
    //           Color.fromARGB(255, 198, 90, 252),
    //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //       ),
    //       child: btn_icon,
    //     ),
    //   ),
    // );
  }

  static Future<void> mezcalmosDialog(double val, double sh, double sw) async =>
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
                  Icons.error,
                  color: Colors.redAccent.shade200,
                  size: getSizeRelativeToScreen(val, sh, sw),
                )),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 20,
                )),
            Flexible(
                fit: FlexFit.loose, child: Text(tOrderIsNotAvailableAnymore))
          ],
        ),
      );

  static Future<void> mezcalmosDialogOrderNoMoreAvailable() async =>
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
                      image:
                          DecorationImage(image: AssetImage(taxiImageAsset))),
                )),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 20,
                )),
            Flexible(
                fit: FlexFit.loose,
                child: Text(
                  "Sorry This ride could not be accepted, Please try another one.",
                  style: TextStyle(fontFamily: 'psr', fontSize: 18),
                ))
          ],
        ),
      );

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
                  CupertinoIcons.delete,
                  size: 30,
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
                  style: TextStyle(fontFamily: 'psr', fontSize: 18),
                )),
            Flexible(child: TextButton(onPressed: onYes, child: Text('Yes'))),
            Flexible(
                fit: FlexFit.loose,
                child: SizedBox(
                  height: 5,
                )),
            Flexible(
                child:
                    TextButton(onPressed: () => Get.back(), child: Text('No'))),
          ],
        ),
      );
}
