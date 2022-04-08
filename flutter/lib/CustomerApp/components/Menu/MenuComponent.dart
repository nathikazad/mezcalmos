import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/NoUserIcon.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/UserMenuComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  /// AuthController
  static final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (_authController.isUserSignedIn)
          ? UserMenu(padding: padding)
          : NoUserIcon(),
    );
  }
}
