import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class CustSwitchOpenService extends StatelessWidget {
  const CustSwitchOpenService({
    super.key,
    required this.label,
    required this.showOnlyOpen,
    required this.onChange,
  });
  final String label;
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
        label,
        style:
            context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
