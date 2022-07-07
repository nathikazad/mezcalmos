import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/components/ROpNumberSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant.dart';

class ROpOptionSelector extends StatelessWidget {
  const ROpOptionSelector({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final ROpOptionViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(child: _singleOptionComponent(OptionType.ChooseOne)),
              Flexible(child: _singleOptionComponent(OptionType.ChooseMany)),
              Flexible(child: _singleOptionComponent(OptionType.Custom)),
            ],
          ),
          if (_helperText() != null) _helperTextWidget(),
          if (viewController.optionType == OptionType.Custom)
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Option choices",
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Min",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      Flexible(
                          child: ROpNumberSelector(
                        value: viewController.min,
                      )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Free",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      Flexible(
                          child: ROpNumberSelector(
                        value: viewController.free,
                      )),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Max",
                          style: Get.textTheme.bodyText1,
                        ),
                      ),
                      Flexible(
                          child: ROpNumberSelector(
                        value: viewController.max,
                      )),
                    ],
                  ),
                  if (_shouldShowCostAboveFree())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Cost for option above the free limit",
                          style: Get.textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: Get.textTheme.bodyText1,
                          controller: viewController.costPerExtra,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.attach_money)),
                        ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  bool _shouldShowCostAboveFree() {
    return viewController.free.value != null &&
        viewController.max.value != null &&
        viewController.max.value! > viewController.free.value!;
  }

  Widget _helperTextWidget() {
    return Container(
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
            style: Get.textTheme.bodyText2?.copyWith(color: primaryBlueColor),
          ))
        ],
      ),
    );
  }

  String? _helperText() {
    switch (viewController.optionType.value) {
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
          viewController.switchOptionType(optionType);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          // width: double.infinity,
          decoration: BoxDecoration(
              color: (optionType == viewController.optionType.value)
                  ? primaryBlueColor
                  : Colors.grey.shade300),
          child: Text(
            optionType.toOptionName(),
            style: Get.textTheme.bodyText1?.copyWith(
                color: (optionType == viewController.optionType.value)
                    ? Colors.white
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
