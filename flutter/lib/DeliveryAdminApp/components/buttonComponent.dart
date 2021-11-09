import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonComponent extends StatelessWidget {
  final Widget? widget;
  final LinearGradient? gradient;
  final GestureTapCallback? function;
  ButtonComponent({this.widget, this.gradient, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            //width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x332362f1),
                      offset: Offset(0, 6),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                gradient: gradient!),
            child: Center(child: widget)),
        onTap: () {
          function!();
        },
      ),
    );
  }
}
