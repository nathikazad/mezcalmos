import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Common/PickLocationView.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:sizer/sizer.dart';

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
        contentPadding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 6.h,
                width: 6.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: primaryBlueColor),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                // padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Text(
                  (comingFromCart != null && comingFromCart)
                      ? '${_i18n()["addLocationDialogTitle"]}'
                      : '${_i18n()["editLocationDialogTitle"]}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13),
                  controller: txtController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 11, left: 8),
                    // hintText: lang.strings["customer"]["savedLocations"]
                    //     ["addLocationDialog"]["textHint"],
                    hintText: '${_i18n()["pickLocationHintText"]}',
                    hintStyle: context.txt.titleLarge
                        ?.copyWith(color: pickLocationHintTextFieldColor),
                    filled: true,
                    fillColor: pickLocationTextFieldColor,
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.grey.shade200),
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pickLocationTextFieldColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: pickLocationTextFieldColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    MezRouter.back(backResult: txtController.text);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(bottom: 4),
                    backgroundColor: secondaryLightBlueColor,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                  child: Text(
                    nameVal != null
                        ? _i18n()["editLocationDialogButton"]
                        : _i18n()["addLocationDialogButton"],
                    style: context.txt.headlineMedium?.copyWith(
                      color: primaryBlueColor,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              ),
              if (mode == PickLocationMode.AddNewLocation &&
                  comingFromCart != null &&
                  comingFromCart)
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      MezRouter.back();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.topCenter,
                      child: Text(
                        _i18n()["addLocationDialogSkip"],
                        style: context.txt.headlineMedium?.copyWith(
                          color: offShadeGreyColor,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
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
      MezRouter.back(backResult: txtController.text);
    },
  );
}
