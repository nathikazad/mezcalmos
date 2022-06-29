import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/WebApp/views/HomeView/Components/WebAppBar.dart';

class DrawerComponent extends StatefulWidget {
  DrawerComponent({Key? key}) : super(key: key);

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
            direction: "vertical"),
      ),
    );
  }
}
