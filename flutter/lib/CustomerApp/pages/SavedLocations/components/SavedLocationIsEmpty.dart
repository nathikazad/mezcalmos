import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:sizer/sizer.dart';

class SavedlocationISEmpty extends StatelessWidget {
  const SavedlocationISEmpty({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
    final txt = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            child: Image.asset(
              "assets/images/shared/noSavedLoc.png",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              //customer.savedLocations.savedLocationsListEmpty
              i18n.strings['customer']
                  ['savedLocations']['savedLocationsListEmpty'],
              textAlign: TextAlign.center,
              style: txt.headline2!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              i18n.strings['customer']
                  ['savedLocations']['clickBtnToAddNewLocation'],
              textAlign: TextAlign.center,
              style: txt.subtitle1!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
