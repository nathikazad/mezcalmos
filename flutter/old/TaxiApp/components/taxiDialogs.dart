import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/MezDialogs.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:sizer/sizer.dart';

Future<void> mezcalmosDialogWithTaxi({required String message}) =>
    oneButtonDialog(body: message, imagUrl: taxiImageAsset);

dynamic _i18n() => Get.find<LanguageController>().strings["TaxiApp"]
    ["components"]["taxiDialogs"];

Future<void> mezcalmosDialogOrderNoMoreAvailable(BuildContext ctx) {
  return showDialog(
      context: ctx,
      builder: (BuildContext bCtx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(top: 16.w, bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Text(
                  _i18n()['rideUnavailable'],
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'psb',
                    color: Color.fromARGB(255, 38, 14, 43),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: -14.5.w,
                child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(100)
                      ),
                      height: 30.w,
                      // width: 45.w,
                      child: Center(
                          child: Image.asset(
                        a404,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ))),
                ),
              ),
            ],
          ),
        );
      });
}

// THIS BELONGS TO TAXI
Future<void> mezcalmosDialogOrderCancelled() {
  return mezcalmosDialogWithTaxi(message: _i18n()['customerCancelled']);
}
