import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/components/userMenuComponent.dart';
import 'package:mezcalmos/Shared/widgets/UsefulWidgets.dart';

// ignore: must_be_immutable
class CustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GestureTapCallback? onLeadingTaped;

  final String? title;
  final Widget? myLeading;
  final bool? center;
  final Color? color;
  final bool autoBack;
  CustomerAppBar(
      {Key? key,
      this.title,
      this.color,
      required this.autoBack,
      this.myLeading,
      this.onLeadingTaped,
      this.center})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  // getting user image;

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
              width: Get.width * 0.5,
              child: FittedBox(
                child: Row(
                  children: [MezcalmosSharedWidgets.fillTitle(1)],
                ),
              ),
            ),
      actions: [
        UserMenu(),
      ],
      elevation: 0.1,
    );
  }
}
