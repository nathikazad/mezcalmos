import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/titlesComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
// import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

List<Widget> choosenOneOption(
    List<CartChooseOneItem> cartChooseOneItems, BuildContext context) {
  LanguageController lang = Get.find<LanguageController>();
  final txt = Theme.of(context).textTheme;
  List<Widget> myWidgets = [
    SizedBox(
      height: 15,
    ),
  ];

  cartChooseOneItems.forEach((cartChooseOneItem) {
    myWidgets.addAll([
      // title aka Id FIRST
      MenuTitles(
          title: cartChooseOneItem
              .optionDetails.name[lang.userLanguageKey]!.capitalizeFirst,
          textTheme: txt.subtitle1!
              .copyWith(fontSize: 13, color: Color.fromRGBO(33, 33, 33, 0.8))),

      Container(
        width: Get.width,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25, top: 5),
        child: Text(
            // oneOption.name
            cartChooseOneItem
                .chosenOptionDetails.name[lang.userLanguageKey]!.inCaps,
            style: TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontFamily: "psr",
                fontStyle: FontStyle.normal,
                fontSize: 17.0.sp),
            textAlign: TextAlign.left),
      ),
      // THEN WE ADD THE CHOSED NAME
      // Container(
      //   width: Get.width,
      //   alignment: Alignment.centerLeft,
      //   padding: const EdgeInsets.only(left: 25, top: 5),
      //   child: Text(
      //       // oneOption.name
      //       oneOption.chooseOneOptionListItems[0].name[lang.userLanguageKey]
      //           .toString()
      //           .inCaps,
      //       style: TextStyle(
      //           color: const Color(0xff000000),
      //           fontWeight: FontWeight.w400,
      //           fontFamily: "psr",
      //           fontStyle: FontStyle.normal,
      //           fontSize: 17.0.sp),
      //       textAlign: TextAlign.left),
      // ),
      SizedBox(
        height: 10,
      )
    ]);
  });

  // data.forEach((value) {
  //   myWidgets.add(MenuTitles(
  //     title: value.name[lang.userLanguageKey].toString().capitalizeFirst,
  //     textTheme: txt.subtitle1!
  //         .copyWith(fontSize: 13, color: Color.fromRGBO(33, 33, 33, 0.8)),
  //   ));

  //   myWidgets.addAll([
  //     Container(
  //       width: Get.width,
  //       alignment: Alignment.centerLeft,
  //       padding: const EdgeInsets.only(left: 25, top: 5),
  //       child: Text(
  //           value.chooseOneOptionListItems[0].name[lang.userLanguageKey]
  //               .toString()
  //               .inCaps,
  //           style: TextStyle(
  //               color: const Color(0xff000000),
  //               fontWeight: FontWeight.w400,
  //               fontFamily: "psr",
  //               fontStyle: FontStyle.normal,
  //               fontSize: 17.0.sp),
  //           textAlign: TextAlign.left),
  //     ),
  //     SizedBox(
  //       height: 10,
  //     )
  //   ]);
  // });

  if (cartChooseOneItems.length == 0) {
    return [];
  } else {
    return myWidgets;
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize).join(" ");
}
