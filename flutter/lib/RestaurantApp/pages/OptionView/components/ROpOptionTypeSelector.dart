import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';
import 'package:sizer/sizer.dart';

class ROpOptionSelector extends StatelessWidget {
  const ROpOptionSelector({Key? key, required this.value, required this.ontap})
      : super(key: key);
  final OptionType value;
  final Function(OptionType id) ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _singleOptionComponent(OptionType.ChooseOne),
            _singleOptionComponent(OptionType.ChooseMany),
            _singleOptionComponent(OptionType.Custom),
          ],
        ),
        if (_helperText() != null)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: primaryBlueColor,
                  size: 23,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                    child: Text(
                  _helperText()!,
                  style: Get.textTheme.bodyText2
                      ?.copyWith(color: primaryBlueColor),
                ))
              ],
            ),
          )
      ],
    );
  }

  String? _helperText() {
    switch (value) {
      case OptionType.ChooseMany:
        return "Customer can choose many options";
      case OptionType.ChooseOne:
        return "Customer can choose only one option";
      case OptionType.Custom:
        return null;
    }
  }

  Widget _singleOptionComponent(OptionType optionType) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          ontap.call(optionType);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          width: 30.w,
          decoration: BoxDecoration(
              color: (optionType == value)
                  ? primaryBlueColor
                  : Colors.grey.shade300),
          child: Text(
            optionType.toOptionName(),
            style: Get.textTheme.bodyText1?.copyWith(
                color: (optionType == value) ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
