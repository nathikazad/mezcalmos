import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/customerAuthController.dart';
import 'package:mezcalmos/CustomerApp/models/Customer.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/routes/MezRouter.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';
import 'package:sizer/sizer.dart';

dynamic _i18n() =>
    Get.find<LanguageController>().strings["CustomerApp"]["pages"]
        ["Restaurants"]["ViewCartScreen"]["components"]["SaveLocationDailog"];

Future<SavedLocation?> savedLocationDailog({
  required BuildContext context,
  required MezLocation loc,
  bool skippable = true,
  SavedLocation? savedLoc,
}) async {
  /// TextEditingController
  final TextEditingController txtController = TextEditingController();

  ///
  if (savedLoc != null) {
    txtController.text = savedLoc.name;
  }
  return showDialog(
    //  useRootNavigator: false,
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
                  (savedLoc == null)
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
                child: MezButton(
                  onClick: () async {
                    SavedLocation? res;
                    if (savedLoc == null) {
                      res = await Get.find<CustomerAuthController>()
                          .saveNewLocation(SavedLocation(
                              name: txtController.text,
                              id: null,
                              location: loc));
                    } else {
                      res = await Get.find<CustomerAuthController>()
                          .editLocation(SavedLocation(
                              name: txtController.text,
                              id: savedLoc.id,
                              location: loc));
                    }
                    mezDbgPrint("Calling back =============>$res");
                    //await MezRouter.back(backResult: res);
                    Navigator.pop(context, res);
                  },
                  backgroundColor: secondaryLightBlueColor,
                  textColor: primaryBlueColor,
                  label: savedLoc != null
                      ? _i18n()["editLocationDialogButton"]
                      : _i18n()["addLocationDialogButton"],
                ),
              ),
              if (skippable)
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                          fontSize: 11.mezSp,
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
