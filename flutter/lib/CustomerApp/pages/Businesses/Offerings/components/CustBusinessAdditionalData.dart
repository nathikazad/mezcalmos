import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustBusinessAdditionalData extends StatelessWidget {
  const CustBusinessAdditionalData({
    super.key,
    required this.additionalValues,
  });

  final Map<String, dynamic> additionalValues;

  @override
  Widget build(BuildContext context) {
    Widget smallCircle() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          Icons.circle,
          color: primaryBlueColor,
          size: 8,
        ),
      );
    }

    String wholeAdditionalParamString() {
      final String circle = "•";
      String wholeString = "";
      additionalValues.map(
        (key, value) {
          wholeString += "$circle $key $value ";
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    return additionalValues.isEmpty
        ? const SizedBox.shrink()
        : Text(
            wholeAdditionalParamString(),
            style: context.textTheme.bodyLarge!.copyWith(
              color: primaryBlueColor,
              fontWeight: FontWeight.w600,
            ),
          );
  }
}
