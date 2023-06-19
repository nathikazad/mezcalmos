import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class MezInkwell extends StatefulWidget {
  const MezInkwell({
    Key? key,
    this.enabled = true,
    this.withGradient = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 20,
    this.textStyle,
    this.border,
    this.icon,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    this.label,
    this.onClick,
    this.borderColor,
    this.fontSize,
  }) : super(key: key);

  final bool enabled;
  final bool withGradient;
  final String? label;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Future<void> Function()? onClick;
  final double borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;
  final BoxBorder? border;
  final double? fontSize;
  final EdgeInsets padding;

  @override
  State<MezInkwell> createState() => _MezInkwellState();
}

class _MezInkwellState extends State<MezInkwell> {
  RxBool isLoading = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          side: BorderSide(
            color: widget.borderColor ?? Colors.transparent,
          ),
        ),
        child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            onTap:
                (!isLoading.value && widget.enabled && widget.onClick != null)
                    ? () {
                        HapticFeedback.lightImpact();
                        SystemSound.play(SystemSoundType.click);

                        isLoading.value = true;
                        widget.onClick
                            ?.call()
                            .whenComplete(() => isLoading.value = false)
                            .onError((Object? e, StackTrace stk) {
                          mezDbgPrint(stk);
                        });
                      }
                    : null,
            child: Ink(
              // width: widget.width ?? double.infinity,
              // height: widget.height,
              decoration: BoxDecoration(
                  gradient: widget.withGradient &&
                          widget.enabled &&
                          widget.onClick != null
                      ? bluePurpleGradient
                      : null,
                  color: (widget.enabled && widget.onClick != null)
                      ? (widget.backgroundColor != null)
                          ? widget.backgroundColor
                          : primaryBlueColor
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(widget.borderRadius)),
              child: Container(
                // alignment: Alignment.center,
                padding: widget.padding,
                child: (isLoading.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: CircularProgressIndicator(
                          color: widget.textColor ?? Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (widget.icon != null)
                            Padding(
                              padding: (widget.label != null)
                                  ? const EdgeInsets.only(right: 12)
                                  : EdgeInsets.all(3),
                              child: Icon(
                                widget.icon,
                                color: widget.textColor ?? Colors.white,
                                size: 15.mezSp,
                              ),
                            ),
                          if (widget.label != null)
                            Flexible(
                              child: Text(
                                widget.label!,
                                style: widget.textStyle ??
                                    context.txt.bodyLarge?.copyWith(
                                        fontSize: widget.fontSize,
                                        color:
                                            widget.textColor ?? Colors.white),
                              ),
                            ),
                        ],
                      ),
              ),
            )),
      );
    });
  }
}
