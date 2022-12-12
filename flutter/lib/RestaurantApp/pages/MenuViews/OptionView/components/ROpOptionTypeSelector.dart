import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/components/ROpNumberSelector.dart';
import 'package:mezcalmos/RestaurantApp/pages/MenuViews/OptionView/controllers/ROpOptionViewController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Services/Restaurant/Option.dart';
import 'package:sizer/sizer.dart';

//
dynamic _i18n() => Get.find<LanguageController>().strings["RestaurantApp"]
    ["pages"]["ROpOptionView"]["components"]["ROpOptionSelector"];

//
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
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${_i18n()["opChoiches"]}',
                    style: Get.textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 10,
                    runSpacing: 15,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_i18n()["min"]}',
                            style: Get.textTheme.bodyText1,
                          ),
                          Container(
                            width: 20.w,
                            margin: const EdgeInsets.only(left: 5),
                            child: ROpNumberSelector(
                              value: viewController.min,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_i18n()["free"]}',
                            style: Get.textTheme.bodyText1,
                          ),
                          Container(
                            width: 20.w,
                            margin: const EdgeInsets.only(left: 5),
                            child: ROpNumberSelector(
                              value: viewController.free,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_i18n()["max"]}',
                            style: Get.textTheme.bodyText1,
                          ),
                          Container(
                            width: 20.w,
                            margin: const EdgeInsets.only(left: 5),
                            child: ROpNumberSelector(
                              value: viewController.max,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (_shouldShowCostAboveFree())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '${_i18n()["costAboveLimit"]}',
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
        return '${_i18n()["choooseManyHelper"]}';
      case OptionType.ChooseOne:
        return '${_i18n()["chooseOneHelper"]}';
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
            '${_i18n()["${optionType.toOptionName().toLowerCase()}"]}',
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
