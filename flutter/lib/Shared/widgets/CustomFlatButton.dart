import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.buttonColor,
    required this.onTap,
    required this.height,
    required this.text,
    this.width,
    this.borderRadius = 9.8,
    this.textAlignement = Alignment.center,
    Key? key,
  }) : super(key: key);
  final Text text;
  final void Function() onTap;
  final List<Color> buttonColor;
  final double height;
  final double? width;
  final Alignment textAlignement;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: 48,
        decoration: BoxDecoration(
          color: buttonColor.length == 1 ? buttonColor.first : null,
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: buttonColor.length > 1
              ? LinearGradient(colors: buttonColor)
              : null,
        ),
        child: Align(alignment: textAlignement, child: text),
      ),
    );
  }
}
