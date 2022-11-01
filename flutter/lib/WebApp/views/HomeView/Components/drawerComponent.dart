import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';
import 'package:mezcalmos/WebApp/views/HomeView/Components/WebAppBar.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class DrawerComponent extends StatefulWidget {
  DrawerComponent({Key? key, required this.controller}) : super(key: key);
  final AutoScrollController controller;

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  List<bool> isSelected = <bool>[false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              buildTitle(logoSize: 20, titleSize: 15, spaceSize: 5),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
        body: buildWidgetForTabletAndDesktop(
            isSelected: isSelected,
            txt: Theme.of(context).textTheme,
            controller: widget.controller,
            direction: "vertical"),
      ),
    );
  }
}

class LangaugePageForMobile extends StatefulWidget {
  LangaugePageForMobile({Key? key}) : super(key: key);

  @override
  State<LangaugePageForMobile> createState() => _LangaugePageForMobileState();
}

class _LangaugePageForMobileState extends State<LangaugePageForMobile> {
  final LanguageController langController = Get.find<LanguageController>();
  List<bool> isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            buildTitle(logoSize: 20, titleSize: 15, spaceSize: 5),
            Spacer(),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: Container(
        child: ToggleButtons(
          direction: Axis.vertical,
          renderBorder: false,
          fillColor: Colors.transparent,
          children: <Widget>[
            ContainerForActionListtile(
                direction: "vertical",
                title: Text(
                  "English",
                  style: getRightTextStyle(txt: txt, isEnable: isSelected[0]),
                )),
            ContainerForActionListtile(
                direction: "vertical",
                title: Text(
                  "Spanish",
                  style: getRightTextStyle(txt: txt, isEnable: isSelected[1]),
                )),
          ],
          onPressed: (int index) {
            setState(() {
              for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                  doAction(index);
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
          },
          isSelected: isSelected,
        ),
      ),
    );
  }

  void doAction(int index) {
    switch (index) {
      case 0:
        langController.changeLangForWeb(LanguageType.EN);
        Get.back();
        break;
      case 1:
        langController.changeLangForWeb(LanguageType.ES);
        Get.back();
        break;
    }
  }

  TextStyle getRightTextStyle(
      {required TextTheme txt, required bool isEnable}) {
    return txt.bodyText1!.copyWith(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        color: isEnable ? Color.fromRGBO(103, 121, 254, 1) : Colors.black);
  }
}
