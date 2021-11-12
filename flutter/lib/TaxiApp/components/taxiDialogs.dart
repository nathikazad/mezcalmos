import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/TaxiApp/constants/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mezcalmos/Shared/utilities/MezIcons.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

Future<void> mezcalmosDialogWithTaxi(
        double val, double sh, double sw, String message) =>
    MezcalmosSharedWidgets.mezcalmosDialogWithImage(
        val, sh, sw, message, taxiImageAsset);

Future<void> mezcalmosDialogOrderNoMoreAvailable(
        double val, double sh, double sw) async =>
    mezcalmosDialogWithTaxi(
        val,
        sh,
        sw,
        Get.find<LanguageController>().strings['taxi']['cancelOrder']
            ['rideUnavailble']);

// THIS BELONGS TO TAXI
Future<void> mezcalmosDialogOrderCancelled(
        double val, double sh, double sw) async =>
    mezcalmosDialogWithTaxi(
        val,
        sh,
        sw,
        Get.find<LanguageController>().strings['taxi']['cancelOrder']
            ['customerCancelled']);

// THIS BELONGS TO TAXI
Future<bool> yesNoDefaultConfirmationDialog(String text) async {
  bool res = true;

  await Get.defaultDialog<bool>(
    backgroundColor: Colors.grey.shade100,
    title: '',
    content: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            fit: FlexFit.loose,
            child: Icon(
              MezcalmosIcons.times_circle,
              size: 40,
              color: Colors.black,
            )),
        Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
              height: 20,
            )),
        Flexible(
            fit: FlexFit.loose,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'psr', fontSize: 18),
            )),
        Flexible(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        (Size(double.infinity, 50))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        (Colors.grey.shade300))),
                onPressed: () {
                  res = true;
                  Get.back();
                },
                child: Obx(() => Text(
                    Get.find<LanguageController>().strings['taxi']['taxiView']
                        ['yes'],
                    style: TextStyle(
                      fontFamily: 'psr',
                      fontSize: 14,
                      color: Colors.black,
                    )))),
            SizedBox(
              height: 5,
            ),
            TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        (Size(double.infinity, 50))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        (Colors.grey.shade300))),
                onPressed: () {
                  res = false;
                  Get.back();
                },
                child: Obx(() => Text(
                    Get.find<LanguageController>().strings['taxi']['taxiView']
                        ['no'],
                    style: TextStyle(
                      fontFamily: 'psr',
                      fontSize: 14,
                      color: Colors.black,
                    ))))
          ],
        )),
      ],
    ),
  );

  return Future.value(res);
}
