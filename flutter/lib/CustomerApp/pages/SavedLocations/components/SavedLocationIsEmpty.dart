import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

// dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
//     ["pages"]["SavedLocations"]["components"]["SavedLocationIsEmpty"];

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["SavedLocations"]["components"]["SavedLocationIsEmpty"];

class SavedLocationISEmpty extends StatelessWidget {
  const SavedLocationISEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme txt = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80.w,
            height: 80.w,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/shared/noSavedLoc.png",
            ),
          ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            child: Text(
              //customer.savedLocations.savedLocationsListEmpty
              _i18n()['savedLocationsListEmpty'],

              style: txt.headline2!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.center,
            child: Text(
              _i18n()['clickBtnToAddNewLocation'],
              style: txt.subtitle1!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          )
        ],
      ),
    );
  }
}
