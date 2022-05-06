import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/MezIcons.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

enum AppBarLeftButtonType { Back, Menu, Lang }

AppBar mezcalmosAppBar(AppBarLeftButtonType leftBtnType,
    {bgColor = Colors.white,
    Function? onClick,
    PreferredSizeWidget? tabBar,
    List<Widget> actionIcons = const <Widget>[]}) {
  Widget btnIcon;

  switch (leftBtnType) {
    case AppBarLeftButtonType.Back:
      btnIcon = Center(
        child: Icon(
          MezcalmosIcons.chevron_left,
          color: Colors.white,
          size: getSizeRelativeToScreen(35, Get.width, Get.height),
        ),
      );
      break;
    case AppBarLeftButtonType.Menu:
      if (onClick == null) {
        onClick = Get.find<SideMenuDrawerController>().openMenu;
      }
      btnIcon = Icon(
        MezcalmosIcons.stream,
        color: Colors.white,
        size: 16,
      );

      break;
    case AppBarLeftButtonType.Lang:
      btnIcon = Obx(
        () => Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () =>
                onClick?.call() ??
                Get.find<LanguageController>().changeUserLanguage(),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(Get.find<LanguageController>().oppositFlag),
                ),
              ),
            ),
          ),
        ),
      );
      break;
  }
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    bottom: tabBar,
    automaticallyImplyLeading: false,
    title: Column(
      children: [
        Container(
          // width: Get.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (leftBtnType != AppBarLeftButtonType.Lang)
                Container(
                  height: 30,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      onClick?.call();
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
                            colors: onClick != null
                                ? [
                                    Color.fromARGB(255, 97, 127, 255),
                                    Color.fromARGB(255, 198, 90, 252),
                                  ]
                                : [Colors.grey.shade300, Colors.grey.shade300],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: btnIcon,
                    ),
                  ),
                )
              else
                btnIcon,
              Spacer(),
              MezcalmosSharedWidgets.fillTitle(actionIcons.length),
              Spacer(),
              for (var i = 0; i < actionIcons.length; i++) ...<Widget>[
                actionIcons[i]
              ],
            ],
          ),
        ),
        // if (_appUpdate.appVersionInfos.value != null)
        //   ...getReminderIfNewUpdate(),
      ],
    ),
  );
}
