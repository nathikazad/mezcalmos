import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class MezIconButton extends StatefulWidget {
  const MezIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.child,
    this.padding,
    this.backgroundColor,
    this.shadowColor,
    this.materialColor,
    this.shape,
    this.borderRadius,
    this.iconColor,
    this.iconSize,
    this.margin,
    this.elevation,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget? child;
  final IconData? icon;
  final double? iconSize;
  final double? elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? materialColor;
  final Color? iconColor;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  _MezIconButtonState createState() => _MezIconButtonState();
}

class _MezIconButtonState extends State<MezIconButton> {
  bool isLoading = false;

  Future<void> _handleTap() async {
    if (widget.onTap != null) {
      if (widget.onTap is Future<void> Function()) {
        setState(() {
          isLoading = true;
        });

        await (widget.onTap as Future<void> Function())();

        setState(() {
          isLoading = false;
        });
      } else {
        widget.onTap!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Material(
        shadowColor: widget.shadowColor,
        color: widget.materialColor,
        elevation: widget.elevation ?? 1,
        borderRadius: widget.borderRadius,
        shape: widget.shape == null ? CircleBorder() : null,
        child: InkWell(
          onTap: isLoading || widget.onTap == null ? null : _handleTap,
          borderRadius: widget.borderRadius,
          customBorder: widget.shape == null ? CircleBorder() : null,
          child: Ink(
            padding: isLoading
                ? EdgeInsets.zero
                : (widget.padding ?? const EdgeInsets.all(8)),
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              color: widget.backgroundColor ?? secondaryLightBlueColor,
              shape: widget.shape ?? BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (!isLoading) // Show the child widget if not loading
                  widget.child ??
                      Icon(
                        widget.icon,
                        color: widget.iconColor ?? primaryBlueColor,
                        size: widget.iconSize ?? 20,
                      ),
                if (isLoading) // Show the loading spinner if loading
                  SpinKitRing(
                    color: widget.iconColor ?? primaryBlueColor,
                    size: 25.mezSp,
                    lineWidth: 5,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
