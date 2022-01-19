import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerHomeFooterButtons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:progress_indicators/progress_indicators.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: HomeFooterButtons(),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    Get.find<LanguageController>().strings['shared']
                        ['conenctionStatus']['noInternetConnection'],
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: Get.width / 2,
                  width: Get.width / 2,
                  child: Image.asset(aNoInternetAsset),
                ),
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Text(
                    Get.find<LanguageController>().strings['shared']
                        ['conenctionStatus']['reconnecting'],
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: CollectionScaleTransition(
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple.shade400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple.shade400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.purple.shade400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
