import 'package:flutter/material.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessHeading.dart';
import 'package:mezcalmos/CustomerApp/pages/Businesses/Offerings/components/CustBusinessSubHeading.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/helpers/StringHelper.dart';

class CustBusinessDescription extends StatelessWidget {
  const CustBusinessDescription({super.key, this.description});

  final Map<Language, String>? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustBusinessHeading(text: "Description"),
        CustBusinessSubHeading(
          text: description?[userLanguage] ?? "No Desription",
        ),
      ],
    );
  }
}
