import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:sizer/sizer.dart';

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
    this.width,
    this.icon,
    required this.label,
    this.onClick,
  }) : super(key: key);

  final bool enabled;
  final bool withGradient;
  final String label;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;
  final Future<void> Function()? onClick;
  final double? borderRadius;
  final TextStyle? textStyle;
  final IconData? icon;

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
            side: BorderSide.none),
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
                          // Get.snackbar("Error", "", backgroundColor: Colors.black);
                        });
                      }
                    : null,
            child: Ink(
              width: widget.width ?? double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
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
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (widget.icon != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                widget.icon,
                                color: widget.textColor ?? Colors.white,
                                size: 15.sp,
                              ),
                            ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                widget.label,
                                style: widget.textStyle ??
                                    Get.textTheme.bodyLarge?.copyWith(
                                        color:
                                            widget.textColor ?? Colors.white),
                              ),
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
