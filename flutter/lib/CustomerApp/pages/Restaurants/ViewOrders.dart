import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mezcalmos/CustomerApp/components/actionIconsComponents.dart';
import 'package:mezcalmos/CustomerApp/components/imagesComponents.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';

class ViewOrders extends StatelessWidget {
  LanguageController _lang = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar("back", () => Get.back(),
          actionIcons: [
            ActionIconsComponents.cartIcon(),
            ActionIconsComponents.notificationIcon(),
            ActionIconsComponents.orderIcon()
          ]),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              width: Get.width,
              child: Obx(
                () => Text(_lang.strings["customer"]["orders"]["title"],
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                          color: const Color(0xfd1d1d1d),
                          fontWeight: FontWeight.w500,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 40.0),
                    ),
                    textAlign: TextAlign.left),
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Expanded(
                child: ListView(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(1, 1),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                    color: const Color(0xffe8f5ec),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => Text(
                              _lang.strings["customer"]["orders"]["inProcess"],
                              style: const TextStyle(
                                  color: const Color(0xff000f1c),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "psr",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width,
                        height: 65,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: const Color(0xffececec), width: 0.5),
                          color: const Color(0xffffffff),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TowAvatars(),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text("Garry Nolan",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.0),
                                              textAlign: TextAlign.left),
                                        ),
                                      ),
                                      Text(
                                        "7:46AM",
                                        style: const TextStyle(
                                            color: const Color(0xff000f1c),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "ProductSans",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.0),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 12,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(" 212 Aveni",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0)),
                                        ),
                                      ),
                                      Text("\$15.00",
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: const Color(0xff000f1c),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "ProductSans",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13.0),
                                          ),
                                          textAlign: TextAlign.right)
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width,
                        height: 65,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: const Color(0xffececec), width: 0.5),
                          color: const Color(0xffffffff),
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TowAvatars(),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text("Garry Nolan",
                                              style: const TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.0),
                                              textAlign: TextAlign.left),
                                        ),
                                      ),
                                      Text(
                                        "7:46AM",
                                        style: const TextStyle(
                                            color: const Color(0xff000f1c),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "ProductSans",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.0),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 12,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(" 212 Aveni",
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff000f1c),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "ProductSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0)),
                                        ),
                                      ),
                                      Text("\$15.00",
                                          style: GoogleFonts.mulish(
                                            textStyle: TextStyle(
                                                color: const Color(0xff000f1c),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "ProductSans",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 13.0),
                                          ),
                                          textAlign: TextAlign.right)
                                    ],
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TowAvatars extends StatelessWidget {
  const TowAvatars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: 70,

      child: Stack(
        children: [
          Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: const Color(0xff5582ff).withOpacity(0.25),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: FoodImage(
                  sw: 20,
                  sh: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 27,
            child: Container(
              width: 40,
              height: 40,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
