import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> choosenOneOption(
    Map<dynamic, dynamic> data, BuildContext context) {
  final txt = Theme.of(context).textTheme;
  List<Widget> myWidgets = [
    SizedBox(
      height: 15,
    )
  ];

  data.forEach((key, value) {
    myWidgets.add(MenuTitles(
      title: key.toUpperCase(),
      textTheme: txt.subtitle1!
          .copyWith(fontSize: 13, color: Color.fromRGBO(33, 33, 33, 0.8)),
    ));

    myWidgets.addAll([
      Container(
        width: Get.width,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25, top: 5),
        child: Text(data[key].toString().inCaps,
            style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontFamily: "psr",
                fontStyle: FontStyle.normal,
                fontSize: 17.0.sp),
            textAlign: TextAlign.left),
      ),
      SizedBox(
        height: 10,
      )
    ]);
  });
  return myWidgets;
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
