import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/Menu/MenuComponent.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

import 'myCartAppBarIcon.dart';

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
              width: 170.w,
              child: FittedBox(
                child: MezcalmosSharedWidgets.fillTitle(1),
              ),
            ),
      actions: [
        MyCartAppBarIcon(
          iconColor: Colors.black,
        ),
        MenuComponent(
          padding: 0,
        )
      ],
      elevation: 0.1,
    );
  }
}
