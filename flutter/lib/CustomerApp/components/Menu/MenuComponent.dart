
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

import 'noUserIcon.dart';
import 'userMenuComponent.dart';

class MenuComponent extends StatelessWidget {
  MenuComponent({
    Key? key,  required this.padding,
  }) : super(key: key);
final double padding;
  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => (_authController.isUserSignedIn) ? UserMenu(padding:padding ,) : NoUserIcon());
  }
}