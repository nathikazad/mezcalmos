import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';
import 'package:mezcalmos/Shared/utilities/ResponsiveUtilities.dart';

enum AppBarLeftButtonType { Back, Menu }

AppBar mezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {dynamic bgColor = Colors.white,
    Function? function,
    List<Widget> actionIcons = const <Widget>[]}) {
  Widget btn_icon;
  Function onTapFunction;
  switch (leftBtnType) {
    case AppBarLeftButtonType.Back:
      btn_icon = Center(
        child: Icon(
          MezcalmosIcons.chevron_left,
          color: Colors.white,
          size: getSizeRelativeToScreen(35, Get.width, Get.height),
        ),
      );
      onTapFunction = () {
        if (function != null) {
          function();
        }
        Get.back();
      };
      break;
    case AppBarLeftButtonType.Menu:
      btn_icon = Icon(
        MezcalmosIcons.stream,
        color: Colors.white,
        size: 16,
      );
      onTapFunction = () {
        if (function != null) {
          function();
        }
        Get.find<SideMenuDrawerController>().openMenu();
      };
      break;
  }
  mezDbgPrint(
      "Getx => ScreenSize ========> ${Get.width} x ${Get.height}  the length of actionIcons is ${actionIcons.length}!!");
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Container(
      // width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            child: GestureDetector(
              onTap: () {
                mezDbgPrint("Taped Drawer btn !");
                if (onTapFunction != null) onTapFunction();
              },
              child: Container(
                height: 30,
                width: 30,
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
                  gradient: LinearGradient(
                      colors: onTapFunction != null
                          ? [
                              Color.fromARGB(255, 97, 127, 255),
                              Color.fromARGB(255, 198, 90, 252),
                            ]
                          : [Colors.grey.shade300, Colors.grey.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: btn_icon,
              ),
            ),
          ),
          // Positioned(
          //     right: getSizeRelativeToScreen(40, Get.height, Get.width),
          //     child: fillTitle())
          //SizedBox(width: getSizeRelativeToScreen(20, Get.height, Get.width)),
          Spacer(),
          MezcalmosSharedWidgets.fillTitle(actionIcons.length),
          Spacer(),
          for (var i = 0; i < actionIcons.length; i++) ...[
            //SizedBox(width: 5),
            actionIcons[i]
          ]
          //  actionIcons==null?Spacer():(actionIcons!.map((e) {
          //    return <Widget>[Spacer(),e];
          //  }))
        ],
      ),
    ),
  );
}
