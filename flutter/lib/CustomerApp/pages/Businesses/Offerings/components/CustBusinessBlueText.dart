import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustBusinessBlueText extends StatelessWidget {
  const CustBusinessBlueText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.textTheme.bodyLarge!.copyWith(
      color: primaryBlueColor,
      fontWeight: FontWeight.w600,
    );
    return Text(
      text,
      style: style,
      maxLines: 3,
      textAlign: TextAlign.start,
    );
  }
}
