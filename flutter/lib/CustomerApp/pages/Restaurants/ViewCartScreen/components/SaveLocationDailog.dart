import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

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
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(20),
            content: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: Text(
                    (comingFromCart != null && comingFromCart)
                        ? '${lang.strings["customer"]["savedLocations"]["addLocationDialog"]["title"]}'
                        : '${lang.strings["customer"]["savedLocations"]["editLocationDialog"]["title"]}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
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
                TextButton(
                    onPressed: () {
                      Get.back(result: txtController.text);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        nameVal != null
                            ? lang.strings["customer"]["savedLocations"]
                                ["editLocationDialog"]["button"]
                            : lang.strings["customer"]["savedLocations"]
                                ["addLocationDialog"]["button"],
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                if (mode == PickLocationMode.AddNewLocation &&
                    comingFromCart != null &&
                    comingFromCart)
                  TextButton(
                      onPressed: () {
                        Get.back(result: txtController.text);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.all(12)),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(lang.strings["customer"]["savedLocations"]
                              ["addLocationDialog"]["skip"]))),
              ],
            )));
      });
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
