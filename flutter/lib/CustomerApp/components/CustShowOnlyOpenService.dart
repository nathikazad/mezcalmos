import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';

dynamic _i18n() => Get.find<LanguageController>().strings["CustomerApp"]
    ["pages"]["Restaurants"]["ListRestaurantsScreen"]["ListRestaurantScreen"];

class CustSwitchOpenService extends StatelessWidget {
  const CustSwitchOpenService({
    super.key,
    required this.showOnlyOpen,
    required this.onChange,
  });
  final bool showOnlyOpen;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: showOnlyOpen,
      onChanged: onChange,
      activeColor: primaryBlueColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      title: Text(
        "${_i18n()["showOnlyOpen"]}",
        style:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
