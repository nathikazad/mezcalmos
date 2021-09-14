import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';
import 'package:mezcalmos/Shared/helpers/HasuraHelper.dart';
import 'package:mezcalmos/AdminApp/pages/StatsIndexPage.dart';

class Wrapper extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user != null) {
        Get.put(HasuraHelper());
        return StatsIndexPage();
      } else
        return SignIn();
    });
  }
}
