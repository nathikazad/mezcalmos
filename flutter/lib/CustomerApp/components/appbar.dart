import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/userMenuComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

import 'myCartAppBarIcon.dart';
import 'noUserIcon.dart';

// ignore: must_be_immutable
class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onLeadingTaped;

  final String? title;
  final Widget? myLeading;
  final bool? center;
  final Color? color;
  final bool autoBack;
  bool? userMenu = true;
  CustomerAppBar(
      {Key? key,
      this.title,
      this.color,
      this.userMenu = true,
      required this.autoBack,
      this.myLeading,
      this.onLeadingTaped,
      this.center})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  AuthController _authController = Get.find<AuthController>();

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      centerTitle: center,
      automaticallyImplyLeading: autoBack,
      leading: myLeading != null
          ? InkWell(
              child: myLeading,
              onTap: onLeadingTaped != null ? onLeadingTaped : null)
          : null,
      title: (title != null)
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline2,
            )
          : Container(
              alignment: Alignment.center,
              width: 180,
              child: FittedBox(
                child: MezcalmosSharedWidgets.fillTitle(1),
              ),
            ),
      actions: [
        MyCartAppBarIcon(),
        Obx(() => (_authController.isUserSignedIn) ? UserMenu() : NoUserIcon())
      ],
      elevation: 0.1,
    );
  }
}
