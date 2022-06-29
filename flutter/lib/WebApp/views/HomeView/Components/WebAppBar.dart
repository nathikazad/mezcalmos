import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/WebApp/services/widgets/mezCalmosLogo.dart';
import 'package:mezcalmos/WebApp/services/widgets/responsive.dart';
import 'package:get/get.dart';

class WebAppBar extends StatefulWidget implements PreferredSizeWidget {
  WebAppBar({Key? key, required this.golbalKey}) : super(key: key);
  GlobalKey<ScaffoldState> golbalKey;

  @override
  State<WebAppBar> createState() => _WebAppBarState();

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}

class _WebAppBarState extends State<WebAppBar> {
  List<bool> isSelected = <bool>[false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Responsive(
        desktop: Row(
          children: [
            SizedBox(
              width: 100,
            ),
            buildTitle(logoSize: 25, titleSize: 20, spaceSize: 5),
            Spacer(),
            buildWidgetForTabletAndDesktop(txt: txt, isSelected: isSelected),
            SizedBox(
              width: 100,
            )
          ],
        ),
        tablet: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            buildTitle(logoSize: 25, titleSize: 20, spaceSize: 5),
            Spacer(),
            buildWidgetForTabletAndDesktop(txt: txt, isSelected: isSelected),
            SizedBox(
              width: 50,
            )
          ],
        ),
        mobile: Row(
          children: [
            buildTitle(logoSize: 20, titleSize: 15, spaceSize: 5),
            Spacer(),
            buildWidgetForMobile(func: () {
              widget.golbalKey.currentState!.openDrawer();
            })
          ],
        ),
      ),
      centerTitle: false,
    );
  }

  //functions

}

Widget buildTitle(
    {required double logoSize,
    required double titleSize,
    required double spaceSize}) {
  return Container(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        getMezcalmosLogo(logoSize),
        SizedBox(
          width: spaceSize,
        ),
        getMezcalmosText(titleSize)
      ],
    ),
  );
}

class ContainerForActionListtile extends StatelessWidget {
  ContainerForActionListtile({Key? key, required this.title, this.direction})
      : super(key: key);
  final Widget title;
  String? direction = "horizontal";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: direction == "horizontal"
          ? const EdgeInsets.symmetric(horizontal: 15)
          : const EdgeInsets.only(left: 15, top: 5, bottom: 5),
      child: Container(
          width: direction == "horizontal"
              ? null
              : MediaQuery.of(context).size.width - 15,
          child: title),
    );
  }
}

Widget buildWidgetForMobile({required Function func}) {
  return IconButton(
      onPressed: () {
        mezDbgPrint('==========> ´Open Drawar´<============');
        func();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ));
}

Widget buildWidgetForTabletAndDesktop(
    {required TextTheme txt,
    required List<bool> isSelected,
    String? direction = "horizontal"}) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return ToggleButtons(
        direction: direction == "horizontal" ? Axis.horizontal : Axis.vertical,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: <Widget>[
          ContainerForActionListtile(
            direction: direction,
            title: Text("Services",
                style: getRightTextStyle(txt: txt, isEnable: isSelected[0])),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Text("FAQ",
                style: getRightTextStyle(txt: txt, isEnable: isSelected[1])),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Text(
              "Blog",
              style: getRightTextStyle(txt: txt, isEnable: isSelected[2]),
            ),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Text(
              "Contact us",
              style: getRightTextStyle(txt: txt, isEnable: isSelected[3]),
            ),
          ),
          ContainerForActionListtile(
            direction: direction,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "EN",
                  style: getRightTextStyle(txt: txt, isEnable: isSelected[4]),
                ),
                Icon(
                  Icons.expand_more_outlined,
                  size: 11,
                  color: isSelected[4]
                      ? Color.fromRGBO(103, 121, 254, 1)
                      : Colors.black,
                )
              ],
            ),
          )
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: isSelected,
      );
    },
  );
}

TextStyle getRightTextStyle({required TextTheme txt, required bool isEnable}) {
  return txt.bodyText1!.copyWith(
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w600,
      color: isEnable ? Color.fromRGBO(103, 121, 254, 1) : Colors.black);
}
