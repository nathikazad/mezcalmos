import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessBlueText.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustBusinessNoOrderBanner extends StatelessWidget {
  const CustBusinessNoOrderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.info_outline,
              color: primaryBlueColor,
            ),
          ),
          Expanded(
            child: Text(
              "Online booking is not available, you can message the business for any inquiries.",
              style: context.textTheme.titleMedium!.copyWith(
                color: primaryBlueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
