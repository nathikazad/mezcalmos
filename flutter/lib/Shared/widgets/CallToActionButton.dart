import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/helpers/ContextHelper.dart';

class CallToActionButton extends StatefulWidget {
  const CallToActionButton(
      {Key? key,
      this.height,
      this.width,
      this.enabled = true,
      required this.onTap,
      required this.text})
      : super(key: key);
  final double? height;
  final double? width;
  final bool enabled;

  final String text;
  final Future<void> Function()? onTap;

  @override
  State<CallToActionButton> createState() => _CallToActionButtonState();
}

class _CallToActionButtonState extends State<CallToActionButton> {
  RxBool _isLoading = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: widget.height,
        width: widget.width,
        child: Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            child: Ink(
                decoration: BoxDecoration(
                    color: (!widget.enabled) ? Colors.grey.shade300 : null,
                    gradient: (widget.enabled) ? bluePurpleGradient : null),
                child: Center(
                    child: (_isLoading.isTrue)
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            widget.text,
                            style: context.txt.bodyLarge
                                ?.copyWith(color: Colors.white),
                          ))),
            onTap: widget.onTap != null
                ? () {
                    _isLoading.value = true;
                    widget.onTap!
                        .call()
                        .whenComplete(() => _isLoading.value = false);
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
