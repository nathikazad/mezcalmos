import 'package:flutter/material.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezIconButton extends StatelessWidget {
  const MezIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
      this.child,
      this.padding,
      this.backgroundColor,
      this.shape,
      this.borderRadius,
      this.iconColor,
      this.iconSize});
  final Function()? onTap;
  final Widget? child;
  final IconData? icon;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: borderRadius,
      shape: shape == null ? CircleBorder() : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        customBorder: shape == null ? CircleBorder() : null,
        child: Ink(
          padding: padding ?? const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: backgroundColor ?? secondaryLightBlueColor,
              shape: shape ?? BoxShape.circle),
          child: child ??
              Icon(
                icon,
                color: iconColor ?? primaryBlueColor,
                size: iconSize,
              ),
        ),
      ),
    );
  }
}
