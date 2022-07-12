import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {Key? key,
      this.height,
      this.width,
      this.enabled = true,
      this.isLoading,
      required this.onTap,
      required this.text})
      : super(key: key);
  final double? height;
  final double? width;
  final bool enabled;
  final RxBool? isLoading;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: height,
        width: width,
        child: Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            child: Ink(
                decoration: BoxDecoration(
                    color: (!enabled) ? Colors.grey.shade300 : null,
                    gradient: (enabled) ? bluePurpleGradient : null),
                child: Center(
                    child: (isLoading != null && isLoading!.isTrue)
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            text,
                            style: Get.textTheme.bodyText1
                                ?.copyWith(color: Colors.white),
                          ))),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
