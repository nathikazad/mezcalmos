import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/CustomerHomeFooterButtons.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/widgets/ThreeDotsLoading.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    LanguageController lang = Get.find<LanguageController>();
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
                    i18n.strings['shared']
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
                    i18n.strings['shared']
                        ['conenctionStatus']['reconnecting'],
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ThreeDotsLoading(
                  dotsColor: Colors.purple.shade400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
