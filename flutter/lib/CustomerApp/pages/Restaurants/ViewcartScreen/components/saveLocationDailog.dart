import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/buttonComponent.dart';
import 'package:mezcalmos/CustomerApp/pages/Restaurants/ViewcartScreen/PickLocationView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

Future<String?> savedLocationDailog(
    {required BuildContext context,
    bool? comingFromCart = false,
    String? nameVal,
    PickLocationMode mode = PickLocationMode.AddNewLocation}) async {
  LanguageController lang = Get.find<LanguageController>();
  TextEditingController txtController = TextEditingController();
  if (nameVal != null && nameVal != "") {
    txtController.text = nameVal;
  }

  return await Get.defaultDialog(
      radius: 12,
      title: ' ',
      titlePadding: EdgeInsets.zero,
      content: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(
                (comingFromCart != null && comingFromCart)
                    ? 'enter location name, if you want to save for future use, else you may skip'
                    : 'Enter location name',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: 13),
                controller: txtController,
                decoration: InputDecoration(
                  // hintText: lang.strings["customer"]["savedLocations"]
                  //     ["addLocationDialog"]["textHint"],
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            SizedBox(
              height: 15,
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
            if (mode == PickLocationMode.AddNewLocation &&
                comingFromCart != null &&
                comingFromCart)
              skipButton(lang, txtController),
          ],
        )),
      ));
}

InkWell skipButton(
    LanguageController lang, TextEditingController txtController) {
  return InkWell(
    child: Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.grey.shade700),
      child: Center(
        child: Text(
            lang.strings["customer"]["savedLocations"]["addLocationDialog"]
                ["skip"],
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
  );
}
