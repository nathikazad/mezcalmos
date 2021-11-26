import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/components/incrementalComponent.dart';
import 'package:mezcalmos/CustomerApp/components/textFieldComponent.dart';
import 'package:mezcalmos/CustomerApp/components/titlesComponent.dart';
import 'package:mezcalmos/CustomerApp/controllers/restaurant/restaurantController.dart';
import 'package:mezcalmos/CustomerApp/models/Cart.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/ViewItemScreen.dart';
import 'package:mezcalmos/CustomerApp/router.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chooseOneCheckBox.dart';
import 'choosenManyCheckBox.dart';
import 'package:intl/intl.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

Widget buildPanel(BuildContext context, Item item, Rxn<CartItem> cartItem,
    ScrollController scrollController, ViewItemScreenMode viewItemScreenMode) {
  LanguageController lang = Get.find<LanguageController>();
  RestaurantController restaurantCartController =
      Get.find<RestaurantController>();

  return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: Container(
        // height: Get.height * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            color: const Color(0xffffffff)),
        child: SingleChildScrollView(
          controller: scrollController,
          //clipBehavior: ,
          child: Container(
            // padding: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                MenuTitles(
                  title:
                      "${lang.strings['customer']['restaurant']['menu']['description']}",
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${item.description}",
                      style: const TextStyle(
                          color: const Color(0xff000f1c),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                chooseOneCheckBoxes(item.chooseOneOptions, cartItem),
                SizedBox(
                  height: 20.sp,
                ),
                chooseManyCheckBoxes(item.chooseManyOptions, cartItem),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  width: Get.width,
                  // height: 313.sp,
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: const Color.fromRGBO(240, 242, 245, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      MenuTitles(
                        title:
                            "${lang.strings['customer']['restaurant']['menu']['notes']}",
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      TextFieldComponent(
                        textController:
                            TextEditingController(text: cartItem.value?.notes),
                        onChangeCallback: (String newNotes) {
                          cartItem.value?.notes = newNotes;
                        },
                        hint: lang.strings['customer']['restaurant']['menu']
                            ['notes'],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                                "${lang.strings['customer']['restaurant']['menu']['quantity']}",
                                style: TextStyle(
                                    color: const Color(0xff000f1c),
                                    fontFamily: "psr",
                                    fontSize: 20.sp),
                                textAlign: TextAlign.left),
                            Spacer(),
                            IncrementalComponent(
                              increment: () {
                                cartItem.value!.quantity++;
                                cartItem.refresh();
                              },
                              decrement: () {
                                cartItem.value!.quantity--;
                                cartItem.refresh();
                              },
                              value: cartItem.value!.quantity,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      ButtonComponent(
                          widget: Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: GoogleFonts.mulish(
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "psb",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0.sp),
                                    ),
                                    text: (ViewItemScreenMode.AddItemMode ==
                                            viewItemScreenMode)
                                        ? "+"
                                        : ""),
                                TextSpan(
                                    style: GoogleFonts.sourceSansPro(
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontFamily: "psr",
                                          fontSize: 16.0.sp),
                                    ),
                                    text: ViewItemScreenMode.AddItemMode ==
                                            viewItemScreenMode
                                        ? lang.strings['customer']['restaurant']
                                            ['menu']['addToCart']
                                        : lang.strings['customer']['restaurant']
                                            ['menu']['modifyItem'])
                              ])),
                              Spacer(),
                              Text(
                                  "\$${currency.format(cartItem.value!.totalCost())}",
                                  style: GoogleFonts.mulish(
                                    textStyle: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "ProductSans",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0.sp),
                                  ),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                          function: () {
                            if (ViewItemScreenMode.AddItemMode ==
                                viewItemScreenMode) {
                              restaurantCartController.addItem(cartItem.value!);
                              Get.offNamed(kCartRoute);
                            } else {
                              restaurantCartController.addItem(cartItem.value!);
                              Get.back();
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        ),
      ));
}
