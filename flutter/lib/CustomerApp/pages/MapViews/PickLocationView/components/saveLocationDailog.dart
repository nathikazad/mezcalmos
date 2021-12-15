import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewItemScreen/components/chooseOneCheckBox.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

Future<String> savedLocationDailog(
    {required BuildContext context,
    required Function function,
    String? nameVal}) async {
  LanguageController lang = Get.find<LanguageController>();
  TextEditingController txtController = TextEditingController();
  if (nameVal != null && nameVal != "") {
    txtController.text = nameVal;
  }
  return await Get.defaultDialog(
      radius: 4,
      title: lang.strings["customer"]["savedLocations"]["title"],
      content: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: Text(
                  nameVal != null
                      ? lang.strings["customer"]["savedLocations"]
                          ["editLocationDialog"]["title"]
                      : lang.strings["customer"]["savedLocations"]
                          ["addLocationDialog"]["title"],
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
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 13),
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
            Container(
                height: 42,
                child: ButtonComponent(
                  function: () {
                    Get.back(result: txtController.text);
                  },
                  widget: Center(
                    child: Text(
                        nameVal != null
                            ? lang.strings["customer"]["savedLocations"]
                                ["editLocationDialog"]["button"]
                            : lang.strings["customer"]["savedLocations"]
                                ["addLocationDialog"]["button"],
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Text("Skip",
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
                Get.back();
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        )),
      ));
}
