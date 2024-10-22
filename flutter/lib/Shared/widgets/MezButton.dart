import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/ResponsiveHelper.dart';

class MezButton extends StatefulWidget {
  final double? width;

  const MezButton({
    Key? key,
    this.enabled = true,
    this.withGradient = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8,
    this.textStyle,
    this.height = 55,
    this.border,
    this.width,
    this.icon,
    required this.label,
    this.onClick,
    this.borderColor,
    this.fontSize,
  }) : super(key: key);

  final bool enabled;
  final bool withGradient;
  final String label;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Future<void> Function()? onClick;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;
  final BoxBorder? border;
  final double? fontSize;

  @override
  State<MezButton> createState() => _MezButtonState();
}

class _MezButtonState extends State<MezButton> {
  RxBool isLoading = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          side: BorderSide(
            color: widget.borderColor ?? Colors.transparent,
          ),
        ),
        child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
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
              width: widget.width ?? double.infinity,
              height: widget.height,
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
                  borderRadius:
                      BorderRadius.circular(widget.borderRadius ?? 10)),
              child: Container(
                alignment: Alignment.center,
                child: (isLoading.value)
                    ? Transform.scale(
                        scale: 0.6,
                        child: CircularProgressIndicator(
                          color: widget.textColor ?? Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (widget.icon != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Icon(
                                widget.icon,
                                color: widget.textColor ?? Colors.white,
                                size: 15.mezSp,
                              ),
                            ),
                          Flexible(
                            child: Text(
                              widget.label,
                              style: widget.textStyle ??
                                  context.txt.bodyLarge?.copyWith(
                                      fontSize: widget.fontSize,
                                      color: widget.textColor ?? Colors.white),
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
