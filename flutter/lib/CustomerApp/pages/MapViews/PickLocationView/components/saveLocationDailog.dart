import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

Future<String> savedLocationDailog(
    {required Function function, String? nameVal}) async {
  LanguageController lang = Get.find<LanguageController>();
  TextEditingController txtController = TextEditingController();
  if (nameVal != null && nameVal != "") {
    txtController.text = nameVal;
  }
  return await Get.defaultDialog(
      radius: 4,
      title: "",
      content: Container(
        width: 230,
        height: 190,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Text(lang.strings["customer"]["savedLocations"]["title"],
                  style: const TextStyle(
                      color: const Color(0xff000f1c),
                      fontWeight: FontWeight.w700,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 25.0),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                  nameVal != null
                      ? lang.strings["customer"]["savedLocations"]
                          ["editLocationDialog"]["title"]
                      : lang.strings["customer"]["savedLocations"]
                          ["addLocationDialog"]["title"],
                  style: const TextStyle(
                      color: const Color(0xff1d1d1d),
                      fontWeight: FontWeight.w400,
                      fontFamily: "ProductSans",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 48,
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border:
                      Border.all(color: const Color(0xffececec), width: 0.5),
                  color: const Color(0xfff8f8f8)),
              alignment: Alignment.center,
              child: TextField(
                controller: txtController,
                decoration: InputDecoration(
                    hintText: lang.strings["customer"]["savedLocations"]
                        ["addLocationDialog"]["textHint"],
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            InkWell(
              child: Container(
                width: 88,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0x332362f1),
                          offset: Offset(0, 6),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment(0.1689453125, 0),
                        end: Alignment(1, 1),
                        colors: [
                          const Color(0xff5582ff),
                          const Color(0xffc54efc)
                        ])),
                child: Center(
                  child: Text(
                      nameVal != null
                          ? lang.strings["customer"]["savedLocations"]
                              ["editLocationDialog"]["button"]
                          : lang.strings["customer"]["savedLocations"]
                              ["addLocationDialog"]["button"],
                      style: const TextStyle(
                          color: const Color(0xfffff4f4),
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProductSans",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.center),
                ),
              ),
              onTap: () {
                Get.back(result: txtController.text);
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        )),
      ));
}
