import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["SaveLocationDailog"];

Future<String?> savedLocationDailog({
  required BuildContext context,
  bool? comingFromCart = false,
  String? nameVal,
  PickLocationMode mode = PickLocationMode.AddNewLocation,
}) async {
  /// TextEditingController
  final TextEditingController txtController = TextEditingController();

  ///
  if (nameVal != null && nameVal != "") {
    txtController.text = nameVal;
  }
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(20),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text(
                  (comingFromCart != null && comingFromCart)
                      ? '${_i18n()["addLocationDialogTitle"]}'
                      : '${_i18n()["editLocationDialogTitle"]}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 15),
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  MezRouter.popDialog(result: txtController.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    nameVal != null
                        ? _i18n()["editLocationDialogButton"]
                        : _i18n()["addLocationDialogButton"],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              if (mode == PickLocationMode.AddNewLocation &&
                  comingFromCart != null &&
                  comingFromCart)
                TextButton(
                  onPressed: () {
                    MezRouter.back();
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.all(12)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      _i18n()["addLocationDialogSkip"],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}

InkWell skipButton(
  LanguageController lang,
  TextEditingController txtController,
) {
  return InkWell(
    child: Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Colors.grey.shade700,
      ),
      child: Center(
        child: Text(
          _i18n()["addLocationDialogSkip"],
          style: const TextStyle(
              color: Color(0xfffff4f4),
              fontWeight: FontWeight.w700,
              fontFamily: "ProductSans",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    onTap: () {
      MezRouter.back(result: txtController.text);
    },
  );
}
