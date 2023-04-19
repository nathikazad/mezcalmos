import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustBusinessTitle extends StatelessWidget {
  const CustBusinessTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.displayMedium,
    );
  }
}
