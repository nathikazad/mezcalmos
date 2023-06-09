import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/pages/DeliveryServices/Laundry/LaundriesList/components/CustomerLaundrySelectCard.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Laundry.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['CustomerApp']
    ['pages']['Businesses']['components']['OnMapLaundryCard'];

class OnMapLaundryCard extends StatelessWidget {
  final Laundry laundry;
  final EdgeInsetsGeometry margin;
  const OnMapLaundryCard(
      {super.key,
      required this.laundry,
      this.margin = const EdgeInsets.only(bottom: 75, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child:
          CustomerLaundrySelectCard(laundry: laundry, customerLocation: null),
    );
  }
}
