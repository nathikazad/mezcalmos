import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/components/TitlesComponent.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

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
        child: Obx(() => Text(
            // oneOption.name
            cartChooseOneItem
                .chosenOptionDetails.name[lang.userLanguageKey]!.inCaps,
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontFamily: "ProductSans",
                fontStyle: FontStyle.normal,
                fontSize: 17.0),
            textAlign: TextAlign.left)),
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
