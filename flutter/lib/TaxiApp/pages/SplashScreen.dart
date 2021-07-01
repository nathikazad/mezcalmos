import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/settingsController.dart';
import 'package:mezcalmos/TaxiApp/pages/Wrapper.dart';


class SplashScreen extends GetWidget<AuthController> {

  SettingsController _settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return _settingsController.isAppInitialized ? Wrapper() : Scaffold(

      body: SafeArea(

        child: Flex(direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            CircularProgressIndicator(),
            SizedBox(height: 10,),
            Flexible(
              child: Text(
                "Application is loading ...",
                style: TextStyle(

                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              )
            )

          ],

        ),
      ),
    );
  }
}