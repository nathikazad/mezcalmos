import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustBusinessSubHeading extends StatelessWidget {
  const CustBusinessSubHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
