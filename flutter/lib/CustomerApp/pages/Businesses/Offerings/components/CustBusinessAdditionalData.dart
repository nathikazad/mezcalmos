import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessBlueText.dart';
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
      var additionalValues2 = {
        "Space": "Very Spacious",
        "For party": true,
        "Space2": "Very Spacious",
        "For party2": true,
        "Space3": "Very Spacious",
        "For party3": true,
      };
      String wholeString = "";
      additionalValues2.map(
        (key, value) {
          wholeString += "$circle $key $value ";
          return MapEntry(key, value);
        },
      );
      return wholeString.toString();
    }

    return CustBusinessBlueText(
      text: wholeAdditionalParamString(),
    );
  }
}
