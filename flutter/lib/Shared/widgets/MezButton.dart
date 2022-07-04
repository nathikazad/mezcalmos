import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class MezButton extends StatefulWidget {
  const MezButton({
    Key? key,
    this.enabled = true,
    this.withGradient = false,
    this.borderRadius = 10,
    this.height = 55,
    required this.label,
    this.onClick,
  }) : super(key: key);

  final bool enabled;
  final bool withGradient;
  final String label;
  final double height;
  final Future<void> Function()? onClick;
  final double? borderRadius;

  @override
  State<MezButton> createState() => _MezButtonState();
}

class _MezButtonState extends State<MezButton> {
  RxBool isLoading = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            side: BorderSide.none),
        child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            onTap:
                (!isLoading.value && widget.enabled && widget.onClick != null)
                    ? () {
                        isLoading.value = true;
                        widget.onClick
                            ?.call()
                            .whenComplete(() => isLoading.value = false);
                      }
                    : null,
            child: Ink(
              width: double.infinity,
              height: widget.height,
              decoration: BoxDecoration(
                  color: (widget.enabled && widget.onClick != null)
                      ? primaryBlueColor
                      : Colors.grey.shade400,
                  gradient: (widget.withGradient) ? bluePurpleGradient : null,
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
                    : Text(
                        widget.label,
                        style: Get.textTheme.bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
              ),
            )),
      );
    });
  }
}