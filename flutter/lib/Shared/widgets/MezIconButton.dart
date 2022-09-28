import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezIconButton extends StatelessWidget {
  const MezIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.child,
      this.padding,
      this.iconSize});
  final Function()? onTap;
  final Widget? child;
  final IconData? icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Ink(
        padding: padding ?? const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: secondaryLightBlueColor, shape: BoxShape.circle),
        child: child ??
            Icon(
              icon,
              color: primaryBlueColor,
              size: iconSize,
            ),
      ),
    );
  }
}
