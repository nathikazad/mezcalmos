import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustBusinessHeading extends StatelessWidget {
  const CustBusinessHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = context.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
