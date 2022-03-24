import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonComponent extends StatelessWidget {
  final Widget? widget;
  final Color bgColor;
  final GestureTapCallback? function;

  ButtonComponent({
    this.widget,
    this.function,
    this.bgColor = const Color(0xffac59fc),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(4)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x332362f1),
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              color: this.bgColor,
            ),
            child: widget),
        onTap: () {
          function?.call();
        },
      ),
    );
  }
}
